# Outpost Remastered — C++ Implementation Design

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A6, C1, C2, D2 (see section E)). See [ERRATA.md](../001-outpost-reverse-engineering/findings/ERRATA.md) and the verified [00-ground-truth.md](../001-outpost-reverse-engineering/findings/00-ground-truth.md) before relying on it.

**Derived from**: Phase 001 reverse-engineering findings (binary structure, engine architecture, data model, tech tree, deep analysis, tilemap format, spec, and plan)

---

## A. Simulation Pipeline C++ Design

### Pipeline Table — 20-Step SCI Simulation Order

Each turn executes these functions sequentially on the ColonyState singleton. All functions are methods on a `SimulationPipeline` class, operating on a mutable `ColonyState&`.

| Step | SC Function | Purpose | Reads | Writes | Dependencies |
|------|------------|---------|-------|-------|--------------|
| 1 | `SCPrelimAlloc` | Allocate budget for this turn's resource distribution | Colony resource pools, building counts | Per-turn allocation budgets | None |
| 2 | `SCPop` | Process population counts and housing capacity | UGResident capacity, current population | Usable worker/scientist counts | Step 1 (budget known) |
| 3 | `SCGenKids` | Compute births from food surplus + amenities | Food, population, UGMed, UGRec, UGResident | New colonists added | Step 2 (pop known) |
| 4 | `SCStarve` | Compute deaths from food deficit | Food supply, population | Population loss, event flag | Step 2 (pop known) |
| 5 | `SCFillResources` | Distribute raw resources to producing buildings | Allocated pools, building list | Per-building input buffers | Steps 1-4 (state settled) |
| 6 | `SCMines` | Process mining output from DisMine/ActiveMine | Mine buildings, ore vein state | Common metals, rare metals | Step 5 (inputs available) |
| 7 | `SCFactory` | Process factory production | Fact buildings, refined materials | Manufactured goods | Step 6 (materials available) |
| 8 | `SCAddSpew` | Process refinery/spew output | Spew buildings, raw ore | Refined metal, processed materials | Step 6 (ore available) |
| 9 | `SCPower` | Compute power grid balance | All building power draw, power plant output | Net power surplus/deficit, building shutdown list | Steps 5-8 (all loads known) |
| 10 | `SCMorale` | Compute colony happiness | Food, power, UGRec, UGPark, Cops, Chap, UGUniv, disasters | Morale value (0-100) | Step 9 (power known) |
| 11 | `SCConstruct` | Advance active construction projects by 1 turn | Construction queue, build time tier | Progress counters, completion triggers | Steps 5-10 (resources allocated) |
| 12 | `SCPutBldg` / `SCInternalPutBldg` | Handle new building placement requests | Placement queue, building definition | New BuildingInstance in colony | Step 11 (construction capacity) |
| 13 | `SCEvent` | Roll random events and disasters | Event probability table, colony state | Disaster effects, event log | Steps 1-12 (state stable) |
| 14 | `SCKillBldg` | Remove buildings destroyed by events/disasters | Event destruction list, building state | Removed BuildingInstance, rubble | Step 13 (events resolved) |
| 15 | `SCAiInput` | AI opponent colony decisions | AI personality config, all colony states | AI building commands, moves | Steps 1-14 (full state known) |
| 16 | `SCProdSched` | Advance production queue (manufactured goods) | Production queue, Factory/UGFact state | Output goods, resource consumption | Steps 5-8 (resources fresh) |
| 17 | `SCRchSched` | Advance research queue (tech unlocks) | Research queue, Lab/HotLab/Univ state | Tech tree progress, unlocks | Step 16 (production done) |
| 18 | `SCSelect` | Sync UI selection state with simulation | Current selection, colony state | UI highlight data | Step 17 (all changes applied) |
| 19 | `SCMove` / `SCMoveBas` / `SCRoboMove` | Process unit/robot movement orders | Movement queue, unit positions | New positions, path state | Step 18 (UI synced) |
| 20 | `SCEndSim` | Finalize turn: increment counter, apply decay, serialize | All state | Turn counter, decay effects, save checkpoint | Steps 1-19 (all done) |

### C++ Interfaces

```cpp
// Pipeline executor — called once per game turn
class SimulationPipeline {
public:
    void executeTurn(ColonyState& colony);

private:
    void step01_prelimAlloc(ColonyState& c);
    void step02_pop(ColonyState& c);
    void step03_genKids(ColonyState& c);
    void step04_starve(ColonyState& c);
    void step05_fillResources(ColonyState& c);
    void step06_mines(ColonyState& c);
    void step07_factory(ColonyState& c);
    void step08_addSpew(ColonyState& c);
    void step09_power(ColonyState& c);
    void step10_morale(ColonyState& c);
    void step11_construct(ColonyState& c);
    void step12_putBldg(ColonyState& c);
    void step13_event(ColonyState& c);
    void step14_killBldg(ColonyState& c);
    void step15_aiInput(ColonyState& c);
    void step16_prodSched(ColonyState& c);
    void step17_rchSched(ColonyState& c);
    void step18_select(ColonyState& c);
    void step19_move(ColonyState& c);
    void step20_endSim(ColonyState& c);
};
```

### Turn-Based vs Event-Driven

| Aspect | Model |
|--------|-------|
| **Simulation turns** | Strictly turn-based. Each press of ENTER (or timer tick) advances one turn |
| **Animation timing** | Event-driven, decoupled from turns. A/B frame cycling runs on a separate 100ms multimedia timer |
| **UI updates** | Event-driven. UI re-renders on state change signals, not on simulation ticks |
| **Audio** | Event-driven. Sounds fire on specific game events, not per turn |
| **Disaster system** | Turn-based roll at step 13, with instant event-driven effects |

### Original Function Mapping

| Remastered Name | Original EXE Name | Notes |
|----------------|-------------------|-------|
| `prelimAlloc` | `SCPrelimAlloc` | First in turn order |
| `pop` | `SCPop` | Population accounting |
| `genKids` | `SCGenKids` | Birth rate computation |
| `starve` | `SCStarve` | Starvation deaths |
| `fillResources` | `SCFillResources` | Resource distribution |
| `mines` | `SCMines` | Mining production |
| `factory` | `SCFactory` | Factory production |
| `addSpew` | `SCAddSpew` | Refinery/spew processing |
| `power` | `SCPower` | Power grid balance |
| `morale` | `SCMorale` | Morale computation |
| `construct` | `SCConstruct` | Construction progress |
| `putBldg` | `SCPutBldg` / `SCInternalPutBldg` / `SCInternalPutBldg2` | Building placement |
| `event` | `SCEvent` | Random event engine |
| `killBldg` | `SCKillBldg` | Building removal |
| `aiInput` | `SCAiInput` | AI decision engine |
| `prodSched` | `SCProdSched` | Production scheduling |
| `rchSched` | `SCRchSched` | Research scheduling |
| `select` | `SCSelect` | UI selection sync |
| `move` | `SCMove` / `SCMoveBas` / `SCRoboMove` | Unit movement |
| `endSim` | `SCEndSim` | Turn finalization |

---

## B. Building System Design

### `BuildingDefinition` — Static Data from BLDGBLD.DAT (40 fields) + BLDGOPS.DAT (46 fields)

```cpp
struct BuildingDefinition {
    // --- Identity (BLDGBLD[0]) ---
    std::string name;                        // Unique building name, e.g. "SpacePort"
    uint16_t index;                          // 0-137, index into both DAT files

    // --- Tech Prerequisites (BLDGBLD[17..32], 16-bit field, 12 bits used) ---
    uint16_t prereqMask;                     // bits 0-11 valid, bit N = BLDGBLD[17+N]

    // --- Economics (BLDGBLD[36-37]) ---
    uint8_t costTier;                        // 0-7 (maps to actual costs via lookup table)
    uint8_t buildTime;                       // 0-6 (actual turns, not tiered)

    // --- Classification (BLDGBLD[38-39]) ---
    uint8_t resourceCategory;                // 1-10: resource cost class (resCategory)
    uint8_t buildingCategory;                // 0-10: functional group (transport=1, hab=2,
                                             //        services=3, power=7, industry=8,
                                             //        terraform=9, seed=10)

    // --- Function Flags (BLDGOPS[17..26], 10-bit production class mask) ---
    uint16_t funcFlags;                      // bits 0-9, bit N = BLDGOPS[17+N]
                                             // Identifies WHAT the building produces/does

    // --- Operations (BLDGOPS[36-38]) ---
    uint8_t powerTier;                       // 0-5: 0=producer/neutral, 1-5=consumer
    uint8_t maintenance;                     // 0-4: maintenance cost factor
    int8_t specialFlag;                      // BLDGOPS[38]: -1=HotLab risk, 0=normal,
                                             // 1=needs colonists, 2=restricted, 5=TerraForm

    // --- Derived (from RE analysis) ---
    uint8_t upgradeChainId;                  // From buildingCategory + naming convention
    uint8_t upgradeLevel;                    // 0=base, 1=upgrade, 2=upgrade2
    bool isBuildable;                        // False for terrain, destroyed, abstract types
};
```

### `BuildingInstance` — Runtime Mutable State

```cpp
struct BuildingInstance {
    const BuildingDefinition* def;           // Pointer to static definition
    uint8_t gridX;                           // Column on site view grid
    uint8_t gridY;                           // Row on site view grid
    uint8_t terrainType;                     // 1-6 (TILE1-6.BMP)

    // --- Construction ---
    uint8_t buildProgress;                   // 0 = not started, max = buildTime turns
    bool isComplete;                         // Construction finished

    // --- Operations ---
    bool isOperational;                      // Staffed + powered + ops prereqs met
    bool isPowered;                          // Receiving sufficient power this turn
    uint8_t animationFrame;                  // 0=A, 1=B for A/B sprite animation
    uint16_t turnLastOperational;            // Turn counter for downtime tracking

    // --- Production (per-turn accumulators) ---
    int32_t inputStock;                      // Current input buffer
    int32_t outputStock;                     // Current output buffer (for storage buildings)
    int32_t workersAssigned;                 // Colonists working here (0 = none)

    // --- Damage ---
    uint8_t health;                          // 0-100 (0 = destroyed)
    bool isDestroyed;                        // Set by disaster/SCKillBldg
};
```

### Prerequisite Mask Resolution Algorithm

```cpp
// The prereq mask is a CUMULATIVE tech-level checkpoint, not a literal dependency graph.
// Each bit corresponds to a building index. When that building EXISTS, the bit is SET.
// A building is buildable if all ON-bits in its mask are also ON in the colony's techMask.

bool canBuild(const ColonyTechState& tech, const BuildingDefinition& bldg) {
    uint16_t required = bldg.prereqMask;       // 16-bit mask from BLDGBLD[17..32]
    uint16_t achieved = tech.techMask;         // Colony's accumulated tech mask
    return (required & achieved) == required;  // All required bits must be set
}

// Resolution rule (from RE analysis):
// - Bit N = BLDGBLD[17+N] (0-indexed from data start after name)
// - Bit N is set when building index (N+15) EXISTS in any colony
// - The mask is INCLUSIVE: setting higher bits implies lower bits also set
// - SpacePort (bit 0, bldg idx 15) is a sentinel always set after colony established
// - Exception: Some masks like 111111111010 (MassDrv) omit XMono bit intentionally
// - Only bits 0-11 are used; bits 12-15 are reserved (always 0)

// Operational flag checking (BLDGOPS[17..26] function flags):
// These are NOT prereqs — they classify what the building PRODUCES or DOES.
// See funcFlags bit definitions in the BuildingDefinition struct.
```

### 22 Upgrade Chains

| Chain ID | Base | Variants | CostTier | BuildTime | Cat |
|----------|------|----------|----------|-----------|-----|
| 1 | Fact | Fact / Fact2 / Fact3 | 6 | 2 | 8 |
| 2 | AgriDome | AgriDome / AgriDome2 / AgriDome3 | 3 | 2 | 5 |
| 3 | Spew | Spew / Spew2 / Spew3 | 4 | 3 | 7 |
| 4 | CommTwr | CommTwr / CommTwr2 / CommTwr3 | 5 | 2 | 3 |
| 5 | HotLab | HotLab / HotLab2 | 5 | 3 | 5 |
| 6 | Chap | Chap / Chap2 | 6 | 4 | 8 |
| 7 | TerraForm | TerraForm / TerraForm2 | 6 | 4 | 9 |
| 8 | Dirt | Dirt / Dirt2 | 5 | 3 | 8 |
| 9 | Cops | Cops / Cops2 | 4 | 3 | 3 |
| 10 | RoboCmd | RoboCmd / RoboCmd2 | 4 | 2 | 7 |
| 11 | Warehouse | Warehouse / Warehouse2 | 2 | 2 | 3 |
| 12 | Storage | Storage / Storage2 | 2 | 1 | 2 |
| 13 | ActiveMine | ActiveMine / ActiveMine2 | 6,7 | 2,5 | 5 |
| 14 | Smelter | Smelter / Smelter2 | 6 | 4 | 8 |
| 15 | Tokamak | Tokamak / Tokamak2 | 1 | 2 | 10 |
| 16 | UGResident | UGResident / UGResident2 / UGResident3 | 3 | 2 | 2 |
| 17 | UGRec | UGRec / UGRec2 | 2 | 2 | 2 |
| 18 | UGUniv | UGUniv / UGUniv2 / UGUniv3 | 3 | 2 | 2 |
| 19 | UGCommercial | UGCommercial / UGCommercial2 / UGCommercial3 | 4 | 2 | 2 |
| 20 | UGLab | UGLab / UGLab2 / UGLab3 | 4 | 3 | 2 |
| 21 | UGAdmin | UGAdmin / UGAdmin2 | 2 | 2 | 2 |
| 22 | UGMed | UGMed / UGMed2 | 3 | 2 | 4 |
| 23 | UGCops | UGCops / UGCops2 | 4 | 3 | 3 |

---

## C. Resource System Design

### 6 Resource Types

```cpp
enum class ResourceType : uint8_t {
    CommonMetals,      // Ore from mines, consumed by Smelter/Spew
    RareMetals,        // Special ore, consumed by Factory
    Food,              // From AgriDomes, consumed by population
    Energy,            // From Tokamaks/Solar, consumed by building ops
    Population,        // Colonist count (workers + scientists + children)
    Research           // Research points from Labs/Univs
};

struct ResourcePool {
    int32_t current{0};    // Current amount
    int32_t capacity{0};   // Storage limit (0 = unlimited for population)
    int32_t produced{0};   // Produced this turn (for display)
    int32_t consumed{0};   // Consumed this turn (for display)

    int32_t surplus() const { return produced - consumed; }
};
```

### Production/Consumption Formulas (from RE analysis)

```cpp
// Each turn in order:

// SCMines: DisMine/ActiveMine output
// Tier determines base output; staffing multiplier applied
void processMines(ColonyState& c) {
    for (auto& mine : c.buildingsOfType(Mine)) {
        if (!mine.isOperational) continue;
        int baseOutput = mine.def->upgradeLevel > 0 ? 8 : 4;  // ActiveMine vs DisMine
        int staffMult = 1 + (mine.workersAssigned / 10);       // Staffing bonus
        int powerMult = mine.isPowered ? 2 : 1;                // Power doubles output
        int output = baseOutput * staffMult * powerMult;
        c.resources[CommonMetals].current += output * 3 / 4;   // 75% common
        c.resources[RareMetals].current += output * 1 / 4;     // 25% rare
    }
}

// SCAddSpew: Spew refines ore → processed materials
void processSpew(ColonyState& c) {
    for (auto& spew : c.buildingsOfType(Spew)) {
        if (!spew.isOperational) continue;
        int commonIn = 3;                                       // Consumes 3 common
        int rareIn = 1;                                         // Consumes 1 rare
        if (c.resources[CommonMetals].current >= commonIn &&
            c.resources[RareMetals].current >= rareIn) {
            c.resources[CommonMetals].current -= commonIn;
            c.resources[RareMetals].current -= rareIn;
            // Produces processed materials (tracked as a sub-resource or abstract good)
        }
    }
}

// SCFactory: Factory consumes processed → manufactured goods
void processFactory(ColonyState& c) {
    for (auto& fact : c.buildingsOfType(Factory)) {
        if (!fact.isOperational) continue;
        // Consumes refined materials, produces manufactured goods
    }
}

// SCStarve: Food deficit kills colonists
void processStarve(ColonyState& c) {
    int pop = c.resources[Population].current;
    int food = c.resources[Food].current;
    if (food < pop) {
        int lost = pop - food;
        c.resources[Population].current -= lost;
        c.resources[Food].current = 0;
        c.events.push_back(Event::Starvation, lost);
    } else {
        c.resources[Food].current -= pop;  // Each colonist eats 1 food/turn
    }
}

// SCGenKids: Food surplus drives growth
void processGenKids(ColonyState& c) {
    int pop = c.resources[Population].current;
    int food = c.resources[Food].current;
    int foodSurplus = std::max(0, food - pop);
    int birthRate = 2;                                          // Base 2%
    if (foodSurplus > 0) birthRate += 3;                        // +3% for surplus
    if (c.hasOperationalBuilding(UGResident)) birthRate += 2;   // +2% for housing
    if (c.hasOperationalBuilding(UGMed)) birthRate += 1;         // +1% for medical
    if (c.hasOperationalBuilding(UGRec)) birthRate += 1;         // +1% for recreation
    int newColonists = (birthRate * pop) / 100;
    c.resources[Population].current += std::max(1, newColonists);
}

// SCPower: Balance generation vs consumption
void processPower(ColonyState& c) {
    int totalProduction = 0;
    int totalConsumption = 0;
    for (auto& b : c.buildings) {
        if (b.isOperational && b.def->powerCostTier == 0)       // Producers
            totalProduction += powerOutput(b);
        else if (b.isComplete)
            totalConsumption += powerDraw(b);                   // Consumers
    }
    c.energyBalance = totalProduction - totalConsumption;
    // If deficit: power down lowest-priority buildings first
    if (c.energyBalance < 0) {
        c.energyBalance = 0;
        powerDownBuildings(c, totalConsumption - totalProduction);
    }
}

// SCMorale: 0-100 scale
void processMorale(ColonyState& c) {
    int morale = 50;                                            // Base
    if (c.resources[Food].surplus() > 0) morale += 10;
    if (c.hasOperationalBuilding(UGRec)) morale += 10;
    if (c.hasOperationalBuilding(UGPark)) morale += 5;
    if (c.hasOperationalBuilding(Cops)) morale += 5;
    if (c.hasOperationalBuilding(UGUniv)) morale += 5;
    if (c.hasOperationalBuilding(Chap)) morale += 5;
    if (c.energyBalance < 0) morale -= 15;
    if (c.recentDisaster) morale -= 20;
    c.morale = std::clamp(morale, 0, 100);
}
```

### Storage Limits and Overflow

```cpp
// Storage limits are determined by Warehouse/Storage buildings:
// Each Storage building adds +200 capacity to all resource pools
// Each Warehouse adds +100 to Common/Rare Metals specifically
// Overflow: resources above capacity are LOST (wasted) at end of turn
void applyStorageLimits(ColonyState& c) {
    int storageBonus = c.countOperational(Storage) * 200;
    int warehouseBonus = c.countOperational(Warehouse) * 100;

    c.resources[CommonMetals].capacity = 100 + storageBonus + warehouseBonus;
    c.resources[RareMetals].capacity = 50 + storageBonus + warehouseBonus;
    c.resources[Food].capacity = 200 + storageBonus;
    c.resources[Energy].capacity = 500 + storageBonus;  // Energy has higher base

    for (auto& pool : c.resources) {
        if (pool.capacity > 0 && pool.current > pool.capacity) {
            pool.current = pool.capacity;  // Overflow discarded
        }
    }
}
```

---

## D. Multi-View Rendering System Design

### View Hierarchy — Planet → Site → Tile

```
┌──────────────────────────────────────────────────────┐
│                  Window (1280×720+)                   │
│  ┌────────────────────────────────────────────────┐  │
│  │              Viewport (main area)              │  │
│  │  Planet View: 480.BMP (640×480) scaled         │  │
│  │  Site View:   TILE{1-6}.BMP (640×480) scaled  │  │
│  │  Tile View:   Terrain + sprite overlay         │  │
│  └────────────────────────────────────────────────┘  │
│  ┌──────┬──────┬──────┬──────┬──────┬──────┬──────┐  │
│  │Plnt  │Site  │Tile  │Turn  │Res   │Menu  │Zoom  │  │ ← Toolbar
│  └──────┴──────┴──────┴──────┴──────┴──────┴──────┘  │
└──────────────────────────────────────────────────────┘
```

### Coordinate System and Grid Mapping

```cpp
// Three coordinate spaces:

struct ViewportCoord { int x, y; };          // Screen pixels
struct GridCoord { int col, row; };          // Building grid (col=0-2, row=0-3)
struct SiteCoord { int siteId; };            // Planet colony site index (0-14)

// Grid mapping (Site View):
//  640×480 terrain bitmap divided into ~2×3 grid cells
//  Each cell is approximately 300×150 pixels
//  Building sprites (300×150) align to grid cell origin

GridCoord screenToGrid(ViewportCoord screen, const Camera& cam) {
    float wx = (screen.x - cam.viewportOffset.x) / cam.zoom + cam.worldOffset.x;
    float wy = (screen.y - cam.viewportOffset.y) / cam.zoom + cam.worldOffset.y;
    return { static_cast<int>(wx / 300), static_cast<int>(wy / 150) };
}

ViewportCoord gridToScreen(GridCoord grid, const Camera& cam) {
    float wx = grid.col * 300.0f;
    float wy = grid.row * 150.0f;
    return {
        static_cast<int>((wx - cam.worldOffset.x) * cam.zoom + cam.viewportOffset.x),
        static_cast<int>((wy - cam.worldOffset.y) * cam.zoom + cam.viewportOffset.y)
    };
}
```

### Zoom Levels

| Level | Scale | Bitmap | Description |
|-------|-------|--------|-------------|
| Planet (0) | 0.25× | 480.BMP | Full planet surface, site selection dots |
| Site (1) | 1.0× | TILE{1-6}.BMP | Colony view, building management |
| Tile (2) | 2.0× | Enlarged terrain + sprites | Detailed building inspection |

Zoom is smooth-interpolated (not discrete), using a float `zoomLevel` that clamps to [0.25, 2.0].

```cpp
struct Camera {
    float worldX{0}, worldY{0};             // World position (in unscaled pixels)
    float zoom{1.0f};                       // 0.25 (planet) to 2.0 (tile)
    int viewportW{1280}, viewportH{720};    // Viewport dimensions

    void pan(int dx, int dy) { worldX += dx / zoom; worldY += dy / zoom; }
    void zoomIn()  { zoom = std::min(zoom * 1.1f, 2.0f); }
    void zoomOut() { zoom = std::max(zoom / 1.1f, 0.25f); }

    // Snap to discrete level
    int viewLevel() const {
        if (zoom <= 0.35f) return 0;  // Planet
        if (zoom <= 1.5f)  return 1;  // Site
        return 2;                      // Tile
    }
};
```

### Rendering Pipeline

```cpp
void renderFrame(const ColonyState& colony, const Camera& cam) {
    renderer.clear();

    switch (cam.viewLevel()) {
    case 0: // Planet View
        Texture* planet = assets.getTexture("480.BMP");
        renderer.blit(planet, cam, planetViewBounds);
        // Draw site selection markers
        for (auto& site : colony.sites) {
            renderer.drawCircle(site.screenPos, 5, Color::Green);
        }
        break;

    case 1: // Site View
        Texture* terrain = assets.getTerrain(colony.terrainType);
        renderer.blit(terrain, cam, fullViewport);
        // Draw grid overlay when placing
        if (placementMode) renderer.drawGrid(2, 3, Color::White, 0.3f);
        // Draw placed buildings
        for (auto& b : colony.placedBuildings) {
            if (!b.isComplete) continue;
            Texture* sprite = assets.getBuildingSprite(b.def->index, b.animationFrame);
            renderer.blit(sprite, cam, gridToScreen({b.gridX, b.gridY}));
        }
        break;

    case 2: // Tile View
        Texture* terrain = assets.getTerrain(colony.terrainType);
        renderer.blit(terrain, cam, fullViewport);
        // Draw building sprite at 2x zoom with detail overlay
        for (auto& b : colony.placedBuildings) {
            if (b.gridX != selectedTile.col || b.gridY != selectedTile.row) continue;
            Texture* sprite = assets.getBuildingSprite(b.def->index, b.animationFrame);
            renderer.blit(sprite, cam, gridToScreen({b.gridX, b.gridY}));
            // Draw health bar, status indicators
            renderBuildingOverlay(b, cam);
        }
        break;
    }

    // Always: UI chrome (HUD, toolbar, buttons)
    renderUI(colony);
}
```

### A/B Animation Timing

```cpp
struct AnimationController {
    uint32_t lastTick{0};
    uint32_t frameInterval{100};  // 100ms between A/B flip

    void update() {
        uint32_t now = SDL_GetTicks();
        if (now - lastTick >= frameInterval) {
            for (auto& b : colony.buildings) {
                if (b.def->hasAnimation) {
                    b.animationFrame = 1 - b.animationFrame;  // Toggle A/B
                }
            }
            lastTick = now;
        }
    }
};
```

---

## E. Data Flow Architecture

### Full Pipeline: Original Files → In-Memory Definitions

```
RESOURCE.000 (archive)
│
├── [extractor: tools/resource-extractor/dotnet-cli]
│   Decodes PKWare DCL IMPODE, extracts 15 files
│
├── BLDGBLD.DAT (12,403 bytes)
│   └── [data-compiler: Python XOR-0x80 CSV parser]
│       Decodes 138 records × 40 fields
│       └── bldgbld.json (structured YAML/JSON)
│
├── BLDGOPS.DAT (14,049 bytes)
│   └── [data-compiler: Python XOR-0x80 CSV parser]
│       Decodes 138 records × 46 fields
│       └── bldgops.json (structured YAML/JSON)
│
├── TUTOR.OPS (20,276 bytes)
│   └── [data-compiler: Python dcbSC section parser]
│       Decodes 19 sections, 133 tutorial steps
│       └── tutor.json (structured JSON)
│
├── BITMAPS/*.BMP (339 files)
│   ├── [bmp-upscaler: Python Pillow + ESRGAN]
│   │   Upscales 8-bit DIB → 4× HD PNG
│   │   └── hd/*.png (optional)
│   └── [direct loader]
│       └── textures/*.bmp (original, fallback)
│
├── *.FLC (92 files)
│   └── [flc-converter: Python + FFmpeg]
│        Converts to H.264 MP4
│        └── video/*.mp4
│
├── MUSIC/*.WAV (277 files)
│   ├── [wav-processor: Python + SoX]
│   │   Resamples 22050/8 → 44100/16 OGG Vorbis
│   │   └── audio/sfx/*.ogg
│
└── MUSIC/*.MID (35 files)
    └── [midi-renderer: Python + FluidSynth]
        Renders with selectable SoundFont → OGG Vorbis
        └── audio/music/*.ogg

────────── Runtime (game startup) ──────────

[AssetManager::loadData()] ← reads JSON/YAML from assets/data/
│
├── BuildingDefinition[138] ← bldgbld.json + bldgops.json merged
│   └── BuildingDefinitionLoader::fromJson()
│       → std::vector<BuildingDefinition>
│       → BuildingCatalog (indexed by building index)
│
├── TechTree ← building prereq masks merged
│   └── TechTree::buildFromDefinitions()
│       → 12-bit mask resolution table
│       → 22 upgrade chain descriptors
│
├── StarSystem[15] ← star-systems.json (hardcoded from RE)
│   └── StarSystemLoader::fromJson()
│       → Terrain type, ore distribution, difficulty
│
├── Tutorial → tutor.json
│   └── TutorialLoader::fromJson()
│       → 133 steps, 19 sections, 4 scenarios
│
├── Textures ← *.png from hd/ or *.bmp from originals/
│   └── TextureLoader::load()
│       → SDL_Texture cache via OpenGL
│
├── Audio → *.ogg
│   └── AudioManager::loadBank()
│       → SoundBank (SFX) + MusicPlaylist
│
└── Video → *.mp4
    └── CutsceneManager::loadCatalog()
        → Event-triggered cutscene table
```

### Game State Data Flow (Each Turn)

```
[Save File (*.ops)]
    ↓ (deserialize)
[ColonyState] ← mutable game state singleton
    │
    ├── SimulationPipeline::executeTurn()
    │   ├── step01-20: reads/writes ColonyState
    │   └── → ColonyState modified in place
    │
    ├── RenderSystem::renderFrame()
    │   ├── reads ColonyState.buildings, resources
    │   └── → OpenGL draw calls
    │
    ├── AudioSystem::update()
    │   ├── reads ColonyState.events
    │   └── → SDL2-Mixer play calls
    │
    └── UI::update()
        ├── reads ColonyState
        └── → event-driven UI state changes
            ↓
    [Save File (*.ops)]
        ↑ (serialize on save)
```

### C++ Type Map

| JSON Field | C++ Type | Source File |
|------------|----------|-------------|
| `definitions[].name` | `std::string` | `data/bldgbld.hpp` |
| `definitions[].prereqMask` | `uint16_t` | `data/bldgbld.hpp` |
| `definitions[].costTier` | `uint8_t` | `data/bldgbld.hpp` |
| `definitions[].powerCostTier` | `uint8_t` | `data/bldgops.hpp` |
| `definitions[].staffingTier` | `uint8_t` | `data/bldgops.hpp` |
| `definitions[].specialFlag` | `int8_t` | `data/bldgops.hpp` |
| `colony.resources[6]` | `ResourcePool[6]` | `simulation/resources.hpp` |
| `colony.buildings[n]` | `std::vector<BuildingInstance>` | `simulation/building.hpp` |
| `colony.techMask` | `uint16_t` | `simulation/tech-tree.hpp` |
| `colony.morale` | `uint8_t` | `simulation/colony.hpp` |
| `colony.population` | `int32_t` | `simulation/population.hpp` |
| `camera.zoom` | `float` | `render/camera.hpp` |
| `eventLog[]` | `std::deque<GameEvent>` | `simulation/colony.hpp` |

---

## F. Identified Gaps — Unknowns Requiring Further Investigation

### Critical Unknowns (Block Implementation)

| # | Gap | Affected System | What We Need |
|---|-----|----------------|--------------|
| 1 | **Exact resource cost formulas** — Cost tiers (0-7) don't map linearly to manual costs. Tier 6 includes SpacePort (10+5+1000E) and DisMine (3+1+5E) | `SCFillResources`, building placement UI | The cost lookup table in the EXE to map tier → actual Common Metal / Rare Metal / Energy costs |
| 2 | **Power output formulas** — Tokamaks produce power, but we don't know base output values or upgrade scaling | `SCPower` | Power plant output values and how Tokamak → Tokamak2 upgrades affect them |
| 3 | **Mine depletion mechanics** — DisMines may deplete over time; ActiveMines may have different depletion rates | `SCMines` | Depletion probability per turn, vein size ranges |
| 4 | **Exact SCMorale formula** — Our formula is hypothesized; the actual weighted sum and thresholds are in overlay code | `SCMorale` | Weight coefficients for each morale factor |
| 5 | **SCAiInput decision weights** — AI personality selection logic, building priorities, aggression thresholds | `SCAiInput` | AI decision tree or weight table |
| 6 | **SCEvent probability table** — Per-disaster probability per turn, based on what? Turn count? Colony size? | `SCEvent` | Event probability distribution and scaling factors |
| 7 | **SCPop worker assignment** — How population splits into workers vs scientists vs children | `SCPop` | Worker allocation ratio formula |
| 8 | **Exact building-to-sprite mapping** — Building index → sprite BMP ID (500-579 range). Mapping is not 1:1 | `render/terrain-view` | The sprite assignment table in the binary |
| 9 | **Grid placement rules** — How the 640×480 viewport divides into grid cells. Is it 2×3? 3×3? Variable per terrain? | Building placement | Grid dimensions and collision detection rules |
| 10 | **SCProdSched / SCRchSched queue depth** — How many items can be queued? Priority ordering? | Production/research UI | Queue data structure limits |

### Secondary Unknowns (Non-Blocking But Desirable)

| # | Gap | Affected System | What We Need |
|---|-----|----------------|--------------|
| 11 | **Colony object layout** — The exact field offsets of the C++ colony object (passed as `%08lX` 32-bit pointer) | All simulation | Would validate struct layout; not blocking since we have functional spec |
| 12 | **Overlay segment code** — Segments 2/4/6 (980KB virtual each, only 16 bytes on disk) contain simulation code we can't read statically | Steps 1-20 | Dynamic analysis with debugger or memory dump during gameplay |
| 13 | **FLC-to-event mapping** — Which numeric FLC ID maps to which game event | `CutsceneManager` | String cross-reference or table in EXE overlay |
| 14 | **dcbSC opcode semantics** — The exact meaning of each opcode in TUTOR.OPS beyond our inferred types (00 03-00 08) | Tutorial system | Execute TUTOR.OPS in a debugger to trace opcode dispatch |
| 15 | **UGRed "restricted access" behavior** — Special flag = 2 only on UGRed. What does this gate? | Building operations | Possibly AI-only or event-triggered construction |
| 16 | **Road/pipe network mechanics** — Roads and pipes have orientation variants (L/R/X) but no transport simulation is visible in our data | Building placement, transport | Do roads/pipes affect movement speed or resource flow? |
| 17 | **Nano and Dirt production formulas** — These advanced buildings reference resource cat 5 but output is unspecified | `SCFactory` / production | Nano especially has unknown production chain |
| 18 | **SpacePort resource reception** — SpacePort appears to receive resources from Earth. Rate? Duration? Cost? | `SCFillResources` | Earth supply ship schedule and contents |
| 19 | **"Pop:Leaving" emigration threshold** — What morale level triggers emigration? How many leave per turn? | `SCPop`, `SCMorale` | Emigration formula |
| 20 | **HotLab meltdown probability** — Special flag -1 triggers nuclear accident. Base probability per turn? Modifiers? | `SCEvent`, disaster system | Meltdown risk formula |

### Recommended Investigation Approach

1. **Dynamic analysis**: Run OUTPOST.EXE under a debugger (x64dbg with 16-bit support or DOSBox debugger) with the original assets. Capture memory snapshots before/after each SC function call.

2. **Memory watchpoints**: Set hardware breakpoints on colony resource fields to capture write patterns during simulation ticks.

3. **TUTOR.OPS tracing**: Hook the dcbSC dispatch in the EXE to trace opcode execution in real time.

4. **Sprite mapping**: Write a brute-force tool that places each building index at each grid coordinate and screenshots the result to build the sprite→building mapping empirically.

5. **Cost table search**: Look for the cost multiplier/table arrays in segments 1, 3, or 5 (initialized data sections) — these would be small integer arrays of 7 or 8 entries matching the cost tier range.
