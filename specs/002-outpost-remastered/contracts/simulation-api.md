# Simulation API Contract — Outpost Remastered

**Version**: 1.0.0  
**Status**: Draft  
**Derived from**: Phase 001 reverse-engineering (OUTPOST.EXE binary analysis, SCI function catalog, engine architecture)

---

## 1. Pipeline Overview

The simulation is a **20-step sequential pipeline** that executes once per game turn. Each step is a function object implementing the `ISimulationStep` interface, registered with the `SimulationPipeline` orchestrator. Steps execute in strict order; each step reads from and writes to a shared `ColonyState` mutable reference.

### Execution Order

| # | SC Function (Original) | Remastered Name | Purpose | Dependencies | Reads | Writes | Frequency |
|---|----------------------|-----------------|---------|--------------|-------|--------|-----------|
| 1 | `SCPrelimAlloc` | `prelimAlloc` | Pre-allocate worker slots and resource production targets for this turn | None (first step) | Building definitions, current population | Worker assignments, resource production targets | Every turn |
| 2 | `SCPop` | `pop` | Process population counts, housing capacity, worker/scientist distribution | Step 1 (budget known) | UGResident capacity, current population | Usable worker count, scientist count, child count | Every turn |
| 3 | `SCGenKids` | `genKids` | Compute births from food surplus, housing, medical, recreation amenities | Step 2 (pop known) | Food surplus, population, UGMed, UGRec, UGResident | New colonists added to population | Every turn |
| 4 | `SCStarve` | `starve` | Compute deaths from food deficit; reduce population proportionally | Step 2 (pop known) | Food supply, population | Population loss, starvation event flag | Every turn (conditional: deficit only) |
| 5 | `SCFillResources` | `fillResources` | Distribute raw resources from colony pools to producing building input buffers | Steps 1-4 (state settled) | Allocated pools, building list, SpacePort reception | Per-building input buffers, resource pool deductions | Every turn |
| 6 | `SCMines` | `mines` | Process mining output from DisMine/ActiveMine buildings; apply depletion | Step 5 (inputs available) | Mine buildings, ore vein state, staffing | Common metals, rare metals, vein depletion counters | Every turn |
| 7 | `SCFactory` | `factory` | Process factory/conversion building production | Step 6 (materials available) | Factory buildings (Fact, Nano, Dirt), refined materials | Manufactured goods, resource consumption | Every turn |
| 8 | `SCAddSpew` | `addSpew` | Process refinery/spew building conversion of raw ore to refined metal | Step 6 (ore available) | Spew/Smelter buildings, raw ore, staffing | Refined metal, processed materials, ore consumption | Every turn |
| 9 | `SCPower` | `power` | Compute power grid balance; power-down low-priority buildings on deficit | Steps 5-8 (all loads known) | All building power draw, power plant output (Tokamak, Solar) | Net power surplus/deficit, building shutdown list | Every turn |
| 10 | `SCMorale` | `morale` | Compute colony happiness (0-100) from food, power, amenities, disasters | Step 9 (power known) | Food surplus, power balance, UGRec, UGPark, Cops, Chap, UGUniv, disaster flags | Morale value, emigration triggers | Every turn |
| 11 | `SCConstruct` | `construct` | Advance active construction projects by 1 turn; check completion | Steps 5-10 (resources allocated) | Construction queue, build time tier, resource availability | Progress counters, completion triggers, resource deductions | Every turn |
| 12 | `SCPutBldg` / `SCInternalPutBldg` / `SCInternalPutBldg2` | `putBldg` | Process new building placement requests from queue; validate prereqs | Step 11 (construction capacity) | Placement queue, building definition, prereq mask, colony state | New BuildingInstance in colony, resource cost deductions | Conditional (queue non-empty) |
| 13 | `SCEvent` | `event` | Roll random events and disasters against probability table | Steps 1-12 (state stable) | Event probability table, colony size, turn count, difficulty | Disaster effects, event log, building destruction list | Every turn |
| 14 | `SCKillBldg` | `killBldg` | Remove buildings destroyed by events/disasters from colony state | Step 13 (events resolved) | Event destruction list, building state | Removed BuildingInstance, rubble/clearing state | Conditional (buildings destroyed) |
| 15 | `SCAiInput` | `aiInput` | AI opponent evaluates colony state and issues building/unit commands | Steps 1-14 (full state known) | AI personality config, all colony states, difficulty level | AI building commands, AI moves, AI event triggers | Conditional (AI-controlled colony) |
| 16 | `SCProdSched` | `prodSched` | Advance production queue; consume inputs, produce outputs, check completion | Steps 5-8 (resources fresh) | Production queue items, Factory/UGFact building state, input buffers | Output goods, resource consumption, queue advancement | Every turn |
| 17 | `SCRchSched` | `rchSched` | Advance research queue; accumulate research points; check tech unlocks | Step 16 (production done) | Research queue items, Lab/HotLab/Univ building state | Tech tree progress, techMask updates, unlocks | Every turn |
| 18 | `SCSelect` | `select` | Synchronize UI selection state with simulation results | Step 17 (all changes applied) | Current UI selection, updated colony state | UI highlight data, selection validity flags | Every turn |
| 19 | `SCMove` / `SCMoveBas` / `SCRoboMove` | `move` | Process unit/robot movement orders; update positions | Step 18 (UI synced) | Movement queue, unit/robot positions, path grid | New positions, path state, movement completion | Conditional (units moving) |
| 20 | `SCEndSim` | `endSim` | Finalize turn: increment counter, apply resource decay/overflow, check game-over conditions | Steps 1-19 (all done) | All colony state, game-over conditions | Turn counter++, resource overflow capping, decay effects, save checkpoint trigger | Every turn |

### Pipeline Invariants

1. **Idempotency constraint**: Running the same `ColonyState` through the pipeline twice must produce identical results (deterministic simulation).
2. **Ordering guarantee**: Step N+1 always sees all writes from Step N.
3. **No step skips**: All 20 steps execute every turn, even if a step's internal logic has no work to do.
4. **No out-of-band mutation**: No external system may mutate `ColonyState` while the pipeline is executing.
5. **Step isolation**: A step must not call back into the pipeline or trigger re-entrant execution.

---

## 2. Class/Struct Definitions (C++)

### 2.1 Enum and Type Definitions

```cpp
#include <cstdint>
#include <string>
#include <string_view>
#include <vector>
#include <deque>
#include <memory>
#include <functional>
#include <optional>
#include <variant>
#include <unordered_map>

// Resource type identifiers
enum class ResourceType : uint8_t {
    CommonMetals = 0,
    RareMetals   = 1,
    Food         = 2,
    Energy       = 3,
    Population   = 4,
    Research     = 5,
    COUNT        = 6
};

// Event types generated by the simulation
enum class EventType : uint8_t {
    None             = 0,
    Starvation       = 1,
    Plague           = 2,
    Meteor           = 3,
    Earthquake       = 4,
    Fire             = 5,
    Meltdown         = 6,
    BuildingComplete = 7,
    TechUnlocked     = 8,
    ColonistArrived  = 9,
    ColonistEmigrated= 10,
    MineDepleted     = 11,
    BuildingDestroyed= 12,
    Rebellion        = 13,
    SupplyShip       = 14,
    AIAction         = 15
};

// Priority determines execution order within the pipeline
using StepPriority = uint8_t;  // 0-255, matches step number (1-indexed)

struct ExecutionResult {
    bool success{true};
    std::string errorMessage;
    std::vector<EventType> eventsGenerated;
};

struct SimulationContext {
    uint32_t turnNumber{0};
    uint32_t timestamp{0};              // Wall clock ms for RNG seeding
    uint32_t randomSeed{0};             // Deterministic seed for this turn
    bool isAITurn{false};               // True when AI is driving this turn
    uint8_t difficultyLevel{2};         // 0=Beginner, 1=Easy, 2=Medium, 3=Hard
    bool debugMode{false};
};
```

### 2.2 ISimulationStep Interface

```cpp
class ISimulationStep {
public:
    virtual ~ISimulationStep() = default;

    /// Human-readable name matching the original SC function
    virtual std::string_view name() const = 0;

    /// Execution order (1-20, matching step number)
    virtual StepPriority priority() const = 0;

    /// Execute this step against the colony state
    /// @param state  Mutable colony snapshot — read and write
    /// @param ctx    Read-only simulation context for this turn
    /// @return       Result indicating success/failure and generated events
    virtual ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) = 0;
};
```

### 2.3 TurnResult — Pipeline Output

```cpp
struct ResourceDelta {
    ResourceType type;
    int32_t previous;      // Value before pipeline execution
    int32_t current;       // Value after pipeline execution
    int32_t delta;         // current - previous
};

struct TurnResult {
    bool success{true};
    std::string errorMessage;
    uint32_t turnNumber{0};

    // Resource changes this turn
    std::array<ResourceDelta, 6> resourceDeltas;

    // Events generated during this turn
    std::vector<EventType> events;

    // Human-readable messages for the event log
    std::vector<std::string> messages;

    // Buildings destroyed this turn
    std::vector<uint16_t> destroyedBuildingIds;

    // Buildings completed this turn
    std::vector<uint16_t> completedBuildingIds;

    // Tech nodes unlocked this turn
    std::vector<uint8_t> unlockedTechBits;

    // Units that reached destination this turn
    std::vector<uint16_t> completedMoves;

    // Starvation statistics
    int32_t colonistsLostToStarvation{0};
    int32_t colonistsBorn{0};
    int32_t colonistsEmigrated{0};

    // Energy statistics
    int32_t energyProduced{0};
    int32_t energyConsumed{0};

    // Checkpoint hint (true if game-over state reached)
    bool isGameOver{false};
};
```

### 2.4 SimulationPipeline — Orchestrator

```cpp
class SimulationPipeline {
public:
    SimulationPipeline();

    /// Register a simulation step (called once at startup)
    void registerStep(std::unique_ptr<ISimulationStep> step);

    /// Execute one complete turn
    /// @param state  Mutable colony state — modified in place
    /// @param ctx    Simulation context for this turn
    /// @return       TurnResult with all changes, events, and deltas
    TurnResult executeTurn(ColonyState& state, const SimulationContext& ctx);

    /// Reset pipeline to initial state (step counters, RNG state)
    void reset();

    /// Access step by priority for testing
    ISimulationStep* getStep(StepPriority priority) const;

private:
    // Steps sorted by priority (ascending)
    std::vector<std::unique_ptr<ISimulationStep>> m_steps;

    // Internal RNG used by steps
    std::mt19937 m_rng;

    // Validate state before execution
    bool validatePreconditions(const ColonyState& state) const;

    // Validate state after execution
    bool validatePostconditions(const ColonyState& state) const;

    // Build resource deltas for TurnResult
    TurnResult buildResult(const ColonyState& before, const ColonyState& after,
                           const std::vector<ExecutionResult>& stepResults) const;
};
```

---

## 3. ColonyState Structure

Complete mutable snapshot of a single colony at one point in time.

```cpp
struct ResourcePool {
    int32_t current{0};     // Current amount
    int32_t capacity{0};    // Storage limit (0 = unlimited)
    int32_t produced{0};    // Gross production this turn (for display)
    int32_t consumed{0};    // Gross consumption this turn (for display)

    int32_t surplus() const { return produced - consumed; }
};

/// Runtime mutable state of a single building instance
struct BuildingInstance {
    const BuildingDefinition* def{nullptr};  // Pointer to static definition
    uint8_t gridX{0};                        // Column on site view grid (0-2)
    uint8_t gridY{0};                        // Row on site view grid (0-3)
    uint8_t terrainType{1};                  // 1-6 matching TILE{1-6}.BMP

    // Construction
    uint8_t buildProgress{0};                // 0 = not started, max = buildTimeTier
    bool isComplete{false};                  // Construction finished

    // Operations
    bool isOperational{false};               // Staffed + powered + ops prereqs met
    bool isPowered{true};                    // Receiving sufficient power
    uint8_t animationFrame{0};               // 0=A frame, 1=B frame
    uint16_t turnLastOperational{0};         // Last turn this was operational

    // Production
    int32_t inputStock{0};                   // Current input buffer
    int32_t outputStock{0};                  // Current output buffer
    int32_t workersAssigned{0};              // Colonists assigned here

    // Damage
    uint8_t health{100};                     // 0-100 (0 = destroyed)
    bool isDestroyed{false};                 // Set by disaster/SCKillBldg
};

/// A unit or mobile entity on the map
struct UnitInstance {
    enum class Type : uint8_t {
        Truck = 0,
        Rover = 1,
        Robot = 2,
        Probe = 3
    };

    Type type{Type::Truck};
    uint16_t id{0};
    uint8_t gridX{0};
    uint8_t gridY{0};
    uint8_t targetX{0};
    uint8_t targetY{0};
    bool isMoving{false};
    uint8_t moveProgress{0};       // 0-100 percent of current path segment
    bool isOperational{true};
};

/// A single game event log entry
struct GameEvent {
    EventType type{EventType::None};
    uint32_t turn{0};
    std::string description;
    int32_t magnitude{0};          // Severity or count
    uint16_t buildingId{0};        // Associated building (if any)
};

/// Tech tree state for a colony
struct ColonyTechState {
    uint16_t techMask{0};           // 12-bit cumulative tech mask
    uint16_t researchProgress{0};   // Accumulated research points this turn
    uint16_t researchTarget{0};     // Points needed for next unlock (0 = none active)
    uint8_t researchBuildingIndex{0}; // Building index of active research facility
};

/// Position of a building on the placement queue
struct PendingBuilding {
    uint16_t buildingIndex{0};       // Index into BuildingDefinition array
    uint8_t gridX{0};
    uint8_t gridY{0};
    bool isAIRequest{false};         // True if placed by AI
};

/// A production queue entry
struct ProductionOrder {
    uint16_t buildingIndex{0};       // What to produce
    uint16_t quantity{1};            // How many units
    uint16_t turnsCompleted{0};      // Progress
    uint16_t turnsRequired{1};       // Total turns needed
};

/// A research queue entry
struct ResearchOrder {
    uint8_t techBit{0};              // Which tech bit to unlock (0-11)
    uint16_t researchCost{100};      // Accumulated research points needed
    uint16_t progress{0};            // Current points accumulated
};

// Forward declaration from data model (see data-model.md §B for full definition)
// Key fields: name, prereqMask (BLDGBLD[17..32], 16-bit), costTier (BLDGBLD[36], 0-7),
// buildTime (BLDGBLD[37], 0-6), powerTier (BLDGOPS[36], 0=producer, 1-5=consumer),
// maintenance (BLDGOPS[37], 0-4), funcFlags (BLDGOPS[17..26], 10-bit production class)
struct BuildingDefinition;

/// Complete colony state — the single source of truth for simulation
struct ColonyState {
    // === Identity ===
    uint32_t colonyId{0};            // Unique colony identifier
    std::string colonyName;
    uint8_t terrainType{1};          // 1-6 (TILE{1-6}.BMP)

    // === Turn ===
    uint32_t turnCount{0};

    // === Resources ===
    std::array<ResourcePool, 6> resources{};

    // === Buildings ===
    std::vector<BuildingInstance> buildings;
    uint16_t buildingCapacity{138};   // Max buildings (from BLDGBLD.DAT)

    // === Population (aliases into resources[Population]) ===
    // current = total colonists
    // produced = births this turn
    // consumed = deaths this turn
    int32_t workers() const;
    int32_t scientists() const;
    int32_t children() const;

    // === Population Breakdown (derived each turn by SCPop) ===
    int32_t numWorkers{0};
    int32_t numScientists{0};
    int32_t numChildren{0};
    int32_t unemployedWorkers{0};    // Workers not assigned to a building
    int32_t housingCapacity{0};      // From UGResident buildings

    // === Morale ===
    uint8_t morale{50};              // 0-100 scale
    bool recentDisaster{false};      // Set this turn if disaster occurred

    // === Power ===
    int32_t energyBalance{0};        // Produced - Consumed (positive = surplus)
    std::vector<uint16_t> poweredDownBuildings;  // Building IDs shut down this turn

    // === Tech ===
    ColonyTechState tech;

    // === Construction ===
    std::vector<PendingBuilding> placementQueue;  // Buildings waiting to be placed

    // === Production ===
    std::vector<ProductionOrder> productionQueue;

    // === Research ===
    std::vector<ResearchOrder> researchQueue;

    // === Units ===
    std::vector<UnitInstance> units;

    // === Movement ===
    struct MoveOrder {
        uint16_t unitId;
        uint8_t targetX;
        uint8_t targetY;
    };
    std::vector<MoveOrder> moveQueue;

    // === Events ===
    std::deque<GameEvent> eventLog;   // Max 100 entries (FIFO)

    // === Starvation ===
    int32_t colonistsLostToStarvation{0};  // Counter, reset each turn

    // === Disasters ===
    int32_t disasterCooldown{0};       // Turns until next disaster can occur

    // === Difficulty & AI ===
    uint8_t difficulty{2};             // 0=Beginner, 1=Easy, 2=Medium, 3=Hard
    bool isAIControlled{false};        // True if AI manages this colony
    uint8_t aiPersonality{0};          // 0=Aggressive, 1=Balanced, 2=Defensive

    // === Colony Status ===
    bool isAlive{true};                // False = colony destroyed (game over)
    bool hasSpacePort{false};          // True if SpacePort exists and is operational

    // === Scoring ===
    uint32_t totalScore{0};
    uint32_t scoreBreakdown[4]{0};     // [population, tech, buildings, resources]

    // === Helper methods ===
    BuildingInstance* getBuilding(uint16_t index);
    const BuildingInstance* getBuilding(uint16_t index) const;
    std::vector<BuildingInstance*> buildingsOfType(uint8_t buildingCategory);
    bool hasOperationalBuilding(uint8_t buildingIndex) const;
    int32_t countOperational(uint8_t buildingIndex) const;
    ResourcePool& resource(ResourceType t) { return resources[static_cast<size_t>(t)]; }
    const ResourcePool& resource(ResourceType t) const { return resources[static_cast<size_t>(t)]; }
};
```

---

## 4. Step-by-Step API

### Step 01: prelimAlloc (SCPrelimAlloc)

```cpp
/// Original: SCPrelimAlloc — pre-allocates worker slots and resource targets.
///
/// Reads: BuildingDefinition staffing tiers (from BLDGOPS[37] maintenance
///        field — buildings with maint > 0 require staffing), current population.
/// Writes: Worker assignments per building, resource production targets.
/// Frequency: Every turn.
/// Dependencies: None (first step).
///
/// Logic:
///   1. Count total available workers from ColonyState::numWorkers.
///   2. For each incomplete building in the construction queue, reserve
///      workers based on building definition maintenance field.
///   3. For each operational production building, assign workers up to
///      maintenance * 10 (max 40 per building).
///   4. Leftover workers go to unemployed pool.
///   5. Set resource production targets based on assigned workers.
class PrelimAllocStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCPrelimAlloc"; }
    StepPriority priority() const override { return 1; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    // Maintenance factor (BLDGOPS[37]) → worker count mapping
    // maint 0 = 0, maint 1 = 5, maint 2 = 10, maint 3 = 20, maint 4 = 40
    static int32_t workersForMaintFactor(uint8_t maintenance);
};
```

### Step 02: pop (SCPop)

```cpp
/// Original: SCPop — process population counts and housing capacity.
///
/// Reads: ColonyState::resources[Population], UGResident buildings,
///        housing capacity.
/// Writes: numWorkers, numScientists, numChildren, unemployedWorkers,
///         housingCapacity.
/// Frequency: Every turn.
/// Dependencies: Step 01 (prelimAlloc) — worker targets must exist.
///
/// Logic:
///   1. Compute housingCapacity = sum of all operational UGResident capacity.
///   2. Cap population to housingCapacity (overcrowding reduces morale, does
///      not kill).
///   3. Split population into workers (60%), scientists (20%), children (20%).
///   4. Subtract assigned workers (from building workerAssigned totals) from
///      total workers → unemployedWorkers.
///   5. If "Pop:Leaving" morale threshold met (morale < 15), trigger
///      emigration: remove 5% of population, generate ColonistEmigrated event.
class PopStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCPop"; }
    StepPriority priority() const override { return 2; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    static constexpr double WORKER_RATIO = 0.60;
    static constexpr double SCIENTIST_RATIO = 0.20;
    static constexpr double CHILD_RATIO = 0.20;
    static constexpr int32_t EMIGRATION_MORALE_THRESHOLD = 15;
    static constexpr double EMIGRATION_RATE = 0.05;  // 5% per turn
};
```

### Step 03: genKids (SCGenKids)

```cpp
/// Original: SCGenKids — compute births from food surplus and amenities.
///
/// Reads: Food surplus, population count, operational UGResident, UGMed,
///        UGRec.
/// Writes: Population increase (births), colonistArrived events.
/// Frequency: Every turn.
/// Dependencies: Step 02 (pop) — population counts must be current.
///
/// Logic:
///   birthRate = 2% (base)
///   if foodSurplus > 0:     birthRate += 3%
///   if UGResident exists:   birthRate += 2%
///   if UGMed exists:        birthRate += 1%
///   if UGRec exists:        birthRate += 1%
///   births = max(1, (birthRate * population) / 100)
///   Children added first; next turn's SCPop redistributes.
class GenKidsStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCGenKids"; }
    StepPriority priority() const override { return 3; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    static constexpr int32_t BASE_BIRTH_RATE = 2;     // 2%
    static constexpr int32_t FOOD_SURPLUS_BONUS = 3;  // +3%
    static constexpr int32_t HOUSING_BONUS = 2;        // +2% if UGResident
    static constexpr int32_t MEDICAL_BONUS = 1;        // +1% if UGMed
    static constexpr int32_t RECREATION_BONUS = 1;     // +1% if UGRec
    static constexpr int32_t MIN_BIRTHS = 1;
};
```

### Step 04: starve (SCStarve)

```cpp
/// Original: SCStarve — compute deaths from food deficit.
///
/// Reads: Food supply, population count.
/// Writes: Population decrease, starvation event flags, food consumption.
/// Frequency: Every turn. Conditional: only when food < population.
/// Dependencies: Step 02 (pop) — population must be current.
///
/// Logic:
///   population = ColonyState.resources[Population].current
///   food = ColonyState.resources[Food].current
///   if food >= population:
///       // Everyone eats
///       food -= population (each colonist consumes 1 food/turn)
///   else:
///       // Starvation — not enough food
///       lost = population - food
///       population -= lost
///       food = 0
///       generate Starvation event with magnitude = lost
///       if population == 0: colony death (isAlive = false)
///
/// Note: In the original game, starvation could chain across turns.
/// Children die first; if still insufficient, workers and scientists.
class StarveStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCStarve"; }
    StepPriority priority() const override { return 4; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;
};
```

### Step 05: fillResources (SCFillResources)

```cpp
/// Original: SCFillResources — distribute raw resources from colony pools
/// to producing building input buffers.
///
/// Reads: Colony resource pools, building list (inputStock fields),
///        SpacePort operational status.
/// Writes: Per-building inputStock, resource pool deductions.
/// Frequency: Every turn.
/// Dependencies: Steps 01-04 — resource targets and population settled.
///
/// Logic:
///   1. For each operational production building, allocate from colony
///      resource pools into building.inputStock up to building capacity.
///   2. If SpacePort is operational and supply ship is present, receive
///      Earth supplies (bonus resources).
///   3. Priority order: Food production first, then manufacturing, then
///      research.
///   4. Resources are consumed from colony pools; inputStock is the
///      building's working buffer for this turn.
///
/// This step is the "gate" that determines which buildings actually get
/// resources to produce. If colony pools are empty, production shuts down.
class FillResourcesStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCFillResources"; }
    StepPriority priority() const override { return 5; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    void allocateToBuilding(ColonyState& state, BuildingInstance& bldg);
    bool processSupplyShip(ColonyState& state);
};
```

### Step 06: mines (SCMines)

```cpp
/// Original: SCMines — process mining output from DisMine/ActiveMine.
///
/// Reads: Mine buildings (DisMine idx 22, ActiveMine idx 51, upgrades),
///        staffing levels, ore vein state.
/// Data Source: BLDGOPS[36] = powerTier, BLDGOPS[37] = maintenance
/// Writes: CommonMetals resource, RareMetals resource, mine depletion
///         counters.
/// Frequency: Every turn.
/// Dependencies: Step 05 (fillResources) — input buffers must be filled.
///
/// Logic:
///   for each operational mine:
///       baseOutput = (mine.def->upgradeLevel > 0) ? 8 : 4
///       staffMult = 1 + (workersAssigned / 10)
///       powerMult = isPowered ? 2 : 1
///       output = baseOutput * staffMult * powerMult
///       CommonMetals += output * 3/4
///       RareMetals   += output * 1/4
///       Depletion check: if random(100) < depletionProbability:
///           mine.outputStock -= depletionAmount
///           if mine.outputStock <= 0: mine isDepleted = true
///
/// Depletion probability and amounts are best-estimate defaults (not yet
/// reverse-engineered — the exact algorithm is in EXE overlay SCMines):
///   DisMine:   2% per turn, depletes fully on trigger
///   ActiveMine: 5% per turn, depletes in chunks of 25%
class MinesStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCMines"; }
    StepPriority priority() const override { return 6; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    static constexpr int32_t DIS_MINE_BASE = 4;
    static constexpr int32_t ACTIVE_MINE_BASE = 8;
    static constexpr int32_t STAFF_DIVISOR = 10;
    static constexpr int32_t POWER_MULTIPLIER = 2;
    static constexpr int32_t COMMON_RATIO_NUM = 3;
    static constexpr int32_t COMMON_RATIO_DEN = 4;
    static constexpr int32_t RARE_RATIO_NUM = 1;
    static constexpr int32_t RARE_RATIO_DEN = 4;
};
```

### Step 07: factory (SCFactory)

```cpp
/// Original: SCFactory — process factory/conversion building production.
///
/// Reads: Factory buildings (Fact index=24, Fact2=25, Fact3=26; Nano
///        index=18, Dirt index=28), input buffers.
/// Writes: Output goods, resource consumption from input buffers.
/// Frequency: Every turn.
/// Dependencies: Step 06 (mines) — materials must be available.
///
/// Logic:
///   for each operational factory-class building:
///       if inputStock >= recipeInput:
///           inputStock -= recipeInput
///           outputStock += recipeOutput
///       else:
///           set notOperational this turn
///
/// Recipes vary by building type:
///   Fact*: consumes CommonMetals + RareMetals → ManufacturedGoods
///   Nano:  consumes RareMetals → Nanites (advanced construction)
///   Dirt:  consumes CommonMetals → structures/fill
class FactoryStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCFactory"; }
    StepPriority priority() const override { return 7; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    struct Recipe {
        int32_t commonMetalInput{0};
        int32_t rareMetalInput{0};
        int32_t output{1};
    };
    Recipe getRecipe(const BuildingDefinition& def) const;
};
```

### Step 08: addSpew (SCAddSpew)

```cpp
/// Original: SCAddSpew — process refinery/spew building conversion.
///
/// Reads: Spew/Smelter buildings (Spew index=27, Spew2=120, Spew3=121;
///        Smelter=54, Smelter2=122), ore availability, staffing.
/// Writes: Refined metal, processed materials, ore consumption.
/// Frequency: Every turn.
/// Dependencies: Step 06 (mines) — raw ore must exist.
///
/// Logic:
///   for each operational Spew/Smelter:
///       if CommonMetals >= 3 AND RareMetals >= 1:
///           CommonMetals -= 3
///           RareMetals -= 1
///           ProcessedMaterials += 2  (abstract intermediate good)
///       else:
///           idle this turn (insufficient ore)
///
/// Spew upgrades increase conversion efficiency (less input, more output).
class AddSpewStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCAddSpew"; }
    StepPriority priority() const override { return 8; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    static constexpr int32_t COMMON_INPUT = 3;
    static constexpr int32_t RARE_INPUT = 1;
    static constexpr int32_t PROCESSED_OUTPUT = 2;
};
```

### Step 09: power (SCPower)

```cpp
/// Original: SCPower — compute power grid balance.
///
/// Reads: All buildings' powerCostTier, power plant buildings (Tokamak,
///        Solar), building operational status.
/// Writes: energyBalance, poweredDownBuildings list, per-building
///         isPowered flags.
/// Frequency: Every turn.
/// Dependencies: Steps 05-08 — all building loads must be computed.
///
/// Data Source: BLDGOPS[36] = powerTier (0-5)
///   0 = producer (Tokamak, Solar, Geothermal) or zero-consumption
///   1-5 = consumer power draw level
///   Power producers = 7 total: SolrPwrRecvr, MShipTokamak, Tokamak, Tokamak2,
///                              UGTokamak, UGTokamak2, UGGeoTherm
///
/// Note: Power OUTPUT values are NOT stored in DAT files — they are computed
/// by SCPower function in the EXE overlay based on building type, upgrade level,
/// and game state (solar intensity, tech level). The values below are best-estimate
/// configurable defaults, not reverse-engineered constants.
///
/// Logic:
///   sumProduction = 0; sumConsumption = 0;
///   for each building:
///       if isOperational AND powerTier == 0 AND isPowerProducer():
///           sumProduction += powerOutput(bldg)
///       if isComplete AND powerTier > 0:      // Consumer
///           sumConsumption += powerDraw(bldg)
///   energyBalance = sumProduction - sumConsumption
///   if energyBalance < 0:
///       deficit = -energyBalance
///       // Power-down in priority order (category-based):
///       // 1. Recreation (UGRec)      2. Commercial (UGCommercial)
///       // 3. Research (Lab/Univ)     4. Production (Fact)
///       // 5. Residential (UGResident) — NEVER powered down
///       for each building in priority order while deficit > 0:
///           if building.isPowered:
///               building.isPowered = false
///               deficit -= powerDraw(bldg)
///               poweredDownBuildings.push_back(bldg.id)
///       energyBalance = 0 (deficit is real, but handled by power-down)
///
/// Power draw by tier (BLDGOPS[36], configurable):
///   tier 0 = 0 (producer), tier 1 = 5, tier 2 = 10, tier 3 = 20, tier 4 = 35, tier 5 = 50
///
/// Power output by building type (configurable defaults):
///   Tokamak:    50 base (+50 per upgrade level)
///   Solar:      10 + sunIntensity * 2 (sun intensity from star system data)
///   Geothermal: 30 constant
class PowerStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCPower"; }
    StepPriority priority() const override { return 9; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    static constexpr int32_t TOKAMAK_BASE_OUTPUT = 50;
    static constexpr int32_t TOKAMAK_UPGRADE_STEP = 50;
    static constexpr int32_t SOLAR_BASE_OUTPUT = 10;
    static constexpr int32_t SOLAR_SUN_MULTIPLIER = 2;
    static constexpr int32_t GEO_OUTPUT = 30;
    // Power draw map: tier → actual KW (configurable via JSON)
    // {0: 0, 1: 5, 2: 10, 3: 20, 4: 35, 5: 50}

    int32_t powerOutput(const BuildingInstance& bldg, const ColonyState& state) const;
    int32_t powerDraw(const BuildingInstance& bldg) const;
    bool isPowerProducer(const BuildingDefinition& def) const;
    void powerDownByPriority(ColonyState& state, int32_t deficit);
};
```

### Step 10: morale (SCMorale)

```cpp
/// Original: SCMorale — compute colony happiness on 0-100 scale.
///
/// Reads: Food surplus, energyBalance, UGRec, UGPark, Cops, Chap, UGUniv,
///        disaster flags.
/// Writes: ColonyState::morale value.
/// Frequency: Every turn.
/// Dependencies: Step 09 (power) — power state must be final.
///
/// Logic:
///   morale = 50 (base)
///   if foodSurplus > 0:                    morale += 10
///   if hasOperational(UGRec):              morale += 10
///   if hasOperational(UGPark):             morale += 5
///   if hasOperational(Cops):               morale += 5
///   if hasOperational(UGUniv):             morale += 5
///   if hasOperational(Chap):               morale += 5
///   if energyBalance < 0:                  morale -= 15
///   if recentDisaster:                     morale -= 20
///   if populationHousingRatio > 1.2:       morale -= 10  (overcrowding)
///   clamp(morale, 0, 100)
///
/// Note: The original game's exact weightings are in the EXE overlay (SCMorale
/// function, segments 2/4/6) and have not been dynamically traced. These values
/// are best-estimate defaults intended to produce plausible game behavior.
/// All values are configurable via JSON building definitions — update the
/// moraleWeights table in buildings.json to tune without recompiling.
class MoraleStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCMorale"; }
    StepPriority priority() const override { return 10; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    static constexpr uint8_t BASE_MORALE = 50;
    static constexpr uint8_t FOOD_BONUS = 10;
    static constexpr uint8_t RECREATION_BONUS = 10;
    static constexpr uint8_t PARK_BONUS = 5;
    static constexpr uint8_t POLICE_BONUS = 5;
    static constexpr uint8_t UNIVERSITY_BONUS = 5;
    static constexpr uint8_t CHAPEL_BONUS = 5;
    static constexpr uint8_t POWER_DEFICIT_PENALTY = 15;
    static constexpr uint8_t DISASTER_PENALTY = 20;
    static constexpr uint8_t OVERCROWDING_PENALTY = 10;
};
```

### Step 11: construct (SCConstruct)

```cpp
/// Original: SCConstruct — advance active construction projects.
///
/// Reads: Construction queue (buildings with buildProgress < buildTimeTier),
///        resource pools for ongoing cost deductions.
/// Writes: buildProgress counters, completion triggers, resource deductions.
/// Frequency: Every turn.
/// Dependencies: Steps 05-10 — resource allocation must be settled.
///
/// Logic:
///   for each building where !isComplete:
///       if buildProgress == 0:
///           // First turn — deduct build cost from resources
///           if sufficient resources:
///               deductCost(bldg.def->costTier)
///               buildProgress = 1
///           else:
///               continue (insufficient funds, stalled)
///       else:
///           buildProgress++
///           if buildProgress >= bldg.def->buildTime:  // BLDGBLD[37] = actual turns
///               isComplete = true
///               generate BuildingComplete event
///               apply operational prereq check
class ConstructStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCConstruct"; }
    StepPriority priority() const override { return 11; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    struct Cost {
        int32_t commonMetal{0};
        int32_t rareMetal{0};
        int32_t energy{0};
    };

    /// Cost tier → resource cost mapping (BLDGBLD[36] = costTier, 0-7)
    /// Data-driven: loaded from buildings.json costTable array.
    /// Default estimate (tuneable):
    ///   tier 0: {0,0,0}     tier 1: {25,10,2}    tier 2: {60,20,6}
    ///   tier 3: {120,40,12}  tier 4: {200,80,20}  tier 5: {300,150,30}
    ///   tier 6: {450,200,45} tier 7: {800,400,80}
    Cost getCostForTier(uint8_t costTier) const;
    bool deductCost(ColonyState& state, const Cost& cost);
};
```

### Step 12: putBldg (SCPutBldg / SCInternalPutBldg / SCInternalPutBldg2)

```cpp
/// Original: SCPutBldg / SCInternalPutBldg / SCInternalPutBldg2 — process
/// new building placement requests.
///
/// Reads: placementQueue, BuildingDefinition catalog, colony prereq masks
///        (techMask), grid occupancy.
/// Writes: New BuildingInstance in colony.buildings, resource cost deduction.
/// Frequency: Conditional — only when placementQueue is non-empty.
/// Dependencies: Step 11 (construct) — construction capacity must be known.
///
/// Logic:
///   for each PendingBuilding in placementQueue:
///       1. Validate prereqMask: (colony.techMask & bldg.prereqMask) ==
///          bldg.prereqMask
///       2. Validate grid position is unoccupied
///       3. Create BuildingInstance with def pointer, gridX, gridY
///       4. Initialize buildProgress = 0, isComplete = false
///       5. Set buildTimeTier and costTier from definition
///       6. Add to colony.buildings vector
///       7. Resource cost will be deducted by ConstructStep on first
///          construction tick
///   placementQueue cleared after processing
///
/// SCInternalPutBldg/2 are internal variants that bypass placement queue
/// validation (used by AI, events, and scenario scripts).
class PutBldgStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCPutBldg"; }
    StepPriority priority() const override { return 12; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    bool validatePlacement(const ColonyState& state, const BuildingDefinition& def,
                           uint8_t gridX, uint8_t gridY) const;
    void placeBuilding(ColonyState& state, const PendingBuilding& request);
    void internalPutBldg(ColonyState& state, uint16_t buildingIndex,
                         uint8_t gridX, uint8_t gridY);
};
```

### Step 13: event (SCEvent)

```cpp
/// Original: SCEvent — roll random events and disasters.
///
/// Reads: Event probability table, colony state (population size, turn
///        count, buildings present), difficulty level.
/// Writes: Disaster effects, event log, building destruction list,
///         recentDisaster flag.
/// Frequency: Every turn.
/// Dependencies: Steps 01-12 — state must be stable before events.
///
/// Logic:
///   if disasterCooldown > 0:
///       disasterCooldown--
///       return (no event this turn)
///
///   baseProbability = 5% (scales with turn count and colony size)
///   roll = random(0, 100)
///   if roll < baseProbability:
///       eventType = selectFromProbabilityTable(roll)
///       switch eventType:
///           Plague:        population -= population * 0.10
///           Meteor:        destroy random building
///           Earthquake:    destroy 1-3 random buildings
///           Fire:          destroy 1 building, spread chance to adjacent
///           Meltdown:      destroy HotLab, damage nearby buildings
///       recentDisaster = true
///       disasterCooldown = 5 + random(0, 10)  // 5-15 turns
///       generate event log entry
///
/// 8 disaster types confirmed from EXE string analysis:
///   meteoroid/meteorite, solar flare, earthquake, volcano,
///   wind storm, dust storm, electrical storm, plague/virus
///
/// Probability table (configurable defaults, exact values in EXE overlay):
///   Plague:      30% (higher with larger population)
///   Meteor:      25%
///   Earthquake:  20%
///   Fire:        15%
///   Meltdown:    10% (only if HotLab exists and is operational)
class EventStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCEvent"; }
    StepPriority priority() const override { return 13; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    static constexpr int32_t BASE_DISASTER_PCT = 5;
    static constexpr int32_t MIN_COOLDOWN = 5;
    static constexpr int32_t MAX_COOLDOWN_EXTRA = 10;

    struct EventEntry {
        EventType type;
        uint8_t weight;       // Relative probability weight
        bool requiresBuilding; // Building index needed, or 0 = any
        uint16_t requiredBuildingIndex;
    };

    static constexpr std::array<EventEntry, 5> EVENT_TABLE{{{
        {EventType::Plague,       30, false, 0},
        {EventType::Meteor,       25, false, 0},
        {EventType::Earthquake,   20, false, 0},
        {EventType::Fire,         15, false, 0},
        {EventType::Meltdown,     10, true,  126}  // HotLab index
    }}};

    EventType selectEvent(const ColonyState& state, int32_t roll) const;
    void applyPlague(ColonyState& state);
    void applyMeteor(ColonyState& state);
    void applyEarthquake(ColonyState& state);
    void applyFire(ColonyState& state);
    void applyMeltdown(ColonyState& state);
};
```

### Step 14: killBldg (SCKillBldg)

```cpp
/// Original: SCKillBldg — remove buildings destroyed by events.
///
/// Reads: Event destruction list (populated by EventStep), building state.
/// Writes: Removed BuildingInstance (isDestroyed = true, health = 0),
///         grid cell marked empty.
/// Frequency: Conditional — only when buildings are destroyed.
/// Dependencies: Step 13 (event) — destruction list must be populated.
///
/// Logic:
///   for each building in destructionList:
///       bldg.isDestroyed = true
///       bldg.health = 0
///       bldg.isOperational = false
///       If building has terrain clearing cost: mark cell as rubble
///       (requires clearing before new construction)
///       generate BuildingDestroyed event
///
///   Future: Building may be flagged as "repairable" based on health
///   remaining after event. At health=0, it requires full replacement.
class KillBldgStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCKillBldg"; }
    StepPriority priority() const override { return 14; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;
};
```

### Step 15: aiInput (SCAiInput)

```cpp
/// Original: SCAiInput — AI opponent evaluates colony state and issues
/// commands.
///
/// Reads: AI personality config, all colony states, difficulty level.
/// Writes: AI building commands (placementQueue), AI move orders
///         (moveQueue), AI event triggers.
/// Frequency: Conditional — only executes for AI-controlled colonies.
/// Dependencies: Steps 01-14 — full colony state must be settled.
///
/// Logic:
///   if !state.isAIControlled: return (skip)
///
///   AI evaluation:
///   1. Resource check — if any resource < 20% capacity: prioritize
///      production buildings for that resource
///   2. Defense check — if rebel colonies nearby: prioritize Cops/Military
///   3. Population check — if housing > 80% full: prioritize UGResident
///   4. Research check — if research queue empty: prioritize Lab/Univ
///   5. Event response — if recentDisaster: prioritize repair/replacement
///
///   AI decision weights are personality-dependent:
///     Aggressive:  defense > production > research > population
///     Balanced:    production > population > research > defense
///     Defensive:   defense > population > production > research
///
///   AI adds PendingBuilding entries to placementQueue and MoveOrder
///   entries to moveQueue.
class AiInputStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCAiInput"; }
    StepPriority priority() const override { return 15; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    struct AiWeights {
        uint8_t resourceWeight;
        uint8_t defenseWeight;
        uint8_t populationWeight;
        uint8_t researchWeight;
    };

    static constexpr AiWeights AGGRESSIVE{30, 35, 15, 20};
    static constexpr AiWeights BALANCED{30, 20, 25, 25};
    static constexpr AiWeights DEFENSIVE{20, 35, 30, 15};

    const AiWeights& getWeights(uint8_t personality) const;
    void evaluateResourceNeeds(ColonyState& state, const AiWeights& w);
    void evaluateDefenseNeeds(ColonyState& state, const AiWeights& w);
    void evaluateHousingNeeds(ColonyState& state, const AiWeights& w);
    void evaluateResearchNeeds(ColonyState& state, const AiWeights& w);
};
```

### Step 16: prodSched (SCProdSched)

```cpp
/// Original: SCProdSched — advance the production queue.
///
/// Reads: productionQueue, Factory/UGFact building state, input buffers.
/// Writes: Output goods, resource consumption, queue advancement,
///         completed production events.
/// Frequency: Every turn.
/// Dependencies: Steps 05-08 — resource buffers must be populated.
///
/// Logic:
///   for each ProductionOrder in productionQueue:
///       building = findBuildingMatching(order.buildingIndex)
///       if !building || !building->isOperational:
///           continue (skip stalled orders)
///       if building->inputStock >= recipeInput:
///           building->inputStock -= recipeInput
///           order.turnsCompleted++
///           if order.turnsCompleted >= order.turnsRequired:
///               building->outputStock += order.quantity
///               generate ProductionComplete event
///               remove from queue
///       else:
///           continue (insufficient input, stalled)
class ProdSchedStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCProdSched"; }
    StepPriority priority() const override { return 16; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;
};
```

### Step 17: rchSched (SCRchSched)

```cpp
/// Original: SCRchSched — advance the research queue.
///
/// Reads: researchQueue, Lab/HotLab/UGUniv building state, current techMask.
/// Writes: Research progress accumulation, techMask updates, tech unlock
///         events.
/// Frequency: Every turn.
/// Dependencies: Step 16 (prodSched) — production completes first.
///
/// Logic:
///   if researchQueue.empty(): return
///
///   // Accumulate research points from all operational research buildings
///   researchPoints = 0
///   for each operational Lab/HotLab/UGUniv:
///       researchPoints += researchOutput(bldg)
///
///   currentOrder = researchQueue.front()
///   currentOrder.progress += researchPoints
///   if currentOrder.progress >= currentOrder.researchCost:
///       // Tech unlocked
///       tech.techMask |= (1 << currentOrder.techBit)
///       generate TechUnlocked event
///       researchQueue.pop_front()
///       tech.researchProgress = 0
///       // Check game-over condition: all 12 tech bits unlocked
///   else:
///       tech.researchProgress = currentOrder.progress
///
/// Research output by building:
///   Lab:   5 points/turn, Lab2: 10, Lab3: 15
///   HotLab: 10 points/turn, HotLab2: 20 (with meltdown risk)
///   UGUniv: 3 points/turn, UGUniv2: 6, UGUniv3: 9
class RchSchedStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCRchSched"; }
    StepPriority priority() const override { return 17; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    int32_t researchOutput(const BuildingInstance& bldg) const;
};
```

### Step 18: select (SCSelect)

```cpp
/// Original: SCSelect — synchronize UI selection state with simulation.
///
/// Reads: Current UI selection (tile/building), updated colony state after
///        all simulation changes.
/// Writes: UI highlight data, selection validity flags.
/// Frequency: Every turn.
/// Dependencies: Step 17 (rchSched) — all changes applied.
///
/// Logic:
///   if currently selected building was destroyed:
///       clear selection, notify UI
///   if currently selected tile's building completed construction:
///       refresh selection with new isComplete state
///   if new buildings placed (by AI or events):
///       add to UI selectable list
///   if population changed significantly (births/deaths/emigration):
///       refresh population display
///   if tech unlocked:
///       update buildable buildings list in UI
///
/// This step is primarily a bridge between the simulation and the
/// presentation layer. It does not modify game-relevant colony state.
class SelectStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCSelect"; }
    StepPriority priority() const override { return 18; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    // Output written to a UI-accessible structure (not in ColonyState)
    struct SelectionState {
        bool selectionValid{false};
        uint8_t selectedGridX{0};
        uint8_t selectedGridY{0};
        uint16_t selectedBuildingIndex{0};
        bool buildingChanged{false};
        bool populationChanged{false};
        bool techChanged{false};
    };

    SelectionState m_selection;
};
```

### Step 19: move (SCMove / SCMoveBas / SCRoboMove)

```cpp
/// Original: SCMove / SCMoveBas / SCRoboMove — process unit movement.
///
/// Reads: moveQueue, unit/robot positions, path grid.
/// Writes: Unit positions, movement completion flags.
/// Frequency: Conditional — only when units have pending moves.
/// Dependencies: Step 18 (select) — UI synced.
///
/// Logic:
///   for each MoveOrder in moveQueue:
///       unit = findUnit(order.unitId)
///       if !unit || !unit->isOperational: continue
///
///       // Simple pathfinding: move 1 grid cell toward target
///       dx = sign(targetX - currentX)
///       dy = sign(targetY - currentY)
///       unit->gridX += dx
///       unit->gridY += dy
///       if unit->gridX == targetX && unit->gridY == targetY:
///           unit->isMoving = false
///           generate MovementComplete event
///           remove from moveQueue
///
/// SCMoveBas handles base relocation (entire colony moves to new site —
/// rare, triggered by events or player decision).
/// SCRoboMove handles robot movement (same logic but robots can traverse
/// impassable terrain).
class MoveStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCMove"; }
    StepPriority priority() const override { return 19; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    void processUnitMove(ColonyState& state, UnitInstance& unit,
                         const ColonyState::MoveOrder& order);
    void processBaseMove(ColonyState& state, const ColonyState::MoveOrder& order);
    void processRobotMove(ColonyState& state, UnitInstance& unit,
                          const ColonyState::MoveOrder& order);
};
```

### Step 20: endSim (SCEndSim)

```cpp
/// Original: SCEndSim — finalize the turn.
///
/// Reads: All colony state (resources, buildings, population, tech).
/// Writes: Turn counter increment, resource overflow capping, decay
///         effects, game-over state detection, save checkpoint trigger.
/// Frequency: Every turn.
/// Dependencies: Steps 01-19 — all previous steps complete.
///
/// Logic:
///   1. Increment turnCount++
///   2. Apply resource storage limits (overflow discarded):
///      for each ResourcePool where capacity > 0:
///          if current > capacity: current = capacity
///   3. Apply resource decay:
///      Food:      5% spoilage if no Storage building operational
///      Energy:    10% decay if no Storage building operational
///      Research:  resets to 0 (non-cumulative between unlocks)
///   4. Check victory conditions:
///      - All 12 tech bits unlocked → victory
///      - population >= 1000 with all amenities → victory
///      - Score > threshold → victory
///   5. Check defeat conditions:
///      - population == 0 OR isAlive == false → game over
///      - All buildings destroyed → game over
///   6. Calculate score for this turn
///   7. Set isGameOver flag in TurnResult if terminal state reached
///   8. Clear per-turn temporary state:
///      - colonistsLostToStarvation = 0
///      - recentDisaster = false
///      - poweredDownBuildings.clear()
///      - resource[].produced/consumed reset (or keep for display)
///
/// Note: The original SC KILL COLONY function is triggered here if
/// population == 0 or colony is otherwise unviable.
class EndSimStep : public ISimulationStep {
public:
    std::string_view name() const override { return "SCEndSim"; }
    StepPriority priority() const override { return 20; }
    ExecutionResult execute(ColonyState& state, const SimulationContext& ctx) override;

private:
    void applyStorageLimits(ColonyState& state);
    void applyResourceDecay(ColonyState& state);
    void checkVictoryConditions(ColonyState& state, bool& isGameOver);
    void checkDefeatConditions(ColonyState& state, bool& isGameOver);
    void calculateScore(ColonyState& state);

    static constexpr double FOOD_SPOILAGE_RATE = 0.05;
    static constexpr double ENERGY_DECAY_RATE = 0.10;
    static constexpr int32_t VICTORY_POPULATION_THRESHOLD = 1000;
};
```

---

## 5. Resource Flow Specification

### 5.1 Complete Resource Flow Diagram

```
                         ┌──────────────┐
                         │   SpacePort   │ ← Earth supply ship (bonus resources)
                         └──────┬───────┘
                                ↓
┌──────────────┐    ┌───────────────────┐    ┌──────────────┐
│   DisMine    │    │     Smelter       │    │   Factory    │
│ ActiveMine   │───→│     Spew          │───→│   Nano       │
│ (SCMines)    │    │ (SCAddSpew)       │    │ (SCFactory)  │
└──────┬───────┘    └────────┬──────────┘    └──────┬───────┘
       │                     │                      │
       ↓                     ↓                      ↓
  CommonMetals          Processed              Manufactured
  RareMetals            Materials               Goods
       │                     │                      │
       └─────────────────────┴──────────────────────┘
                              │
                              ↓
                    ┌─────────────────┐
                    │   Colony Pool   │ ← Storage/Warehouse cap
                    │  (6 resources)  │
                    └┬───┬───┬───┬───┘
                     │   │   │   │
                     ↓   ↓   ↓   ↓
              ┌──────┐ ┌──┐ ┌──┐ ┌───────┐
              │ Agri │ │Pop│ │Rch│ │Energy │
              │Dome  │ │eat│ │   │ │ Grid  │
              └──────┘ └──┘ └──┘ └───────┘
                 │       ↑       ↑      │
                 ↓       │       │      ↓
               Food   Starvation  Research  Power
               (eaten  (deficit   points    balance
               by pop)  kills)    (unlock)  (surplus/
                                           deficit)
```

### 5.2 Production and Consumption Formulas

#### 5.2.1 Mine Production

```
oreHarvested = mineCount × mineYieldPerTurn × efficiencyFactor

Where:
  mineYieldPerTurn  = (isUpgraded ? 8 : 4)
  efficiencyFactor  = (1 + workersAssigned / 10) × (isPowered ? 2 : 1)

  CommonMetals     += oreHarvested × 3/4
  RareMetals       += oreHarvested × 1/4

  Depletion check per mine:
    DisMine:    P(deplete) = 2% per turn → output halved, then removed
    ActiveMine: P(deplete) = 5% per turn → -25% output each trigger
```

#### 5.2.2 Smelter/Spew Conversion

```
Spew (base):
  Input:  3 CommonMetals + 1 RareMetals
  Output: 2 ProcessedMaterials

Spew2 (upgrade):
  Input:  2 CommonMetals + 1 RareMetals
  Output: 3 ProcessedMaterials

Spew3 (upgrade):
  Input:  1 CommonMetal + 1 RareMetal
  Output: 4 ProcessedMaterials

Smelter:
  Input:  5 CommonMetals
  Output: 10 CommonMetals (refined, higher purity)
```

#### 5.2.3 Factory Production

```
Fact (base):
  Input:  2 ProcessedMaterials + 1 RareMetal
  Output: 2 ManufacturedGoods

Fact2 (upgrade):
  Input:  2 ProcessedMaterials + 1 RareMetal
  Output: 4 ManufacturedGoods

Fact3 (upgrade):
  Input:  1 ProcessedMaterial + 1 RareMetal
  Output: 6 ManufacturedGoods

Nano:
  Input:  3 RareMetals
  Output: 1 Nanite (used for advanced construction/research)

Dirt:
  Input:  2 CommonMetals
  Output: Dirt/Fill (used for terrain modification)
```

#### 5.2.4 Food Production

```
foodProduced = farmCount × farmYield - population × consumptionRate

Where:
  AgriDome farmYield = 10 food/turn
  AgriDome2 yield    = 20 food/turn
  AgriDome3 yield    = 35 food/turn
  consumptionRate    = 1 food per colonist per turn

  foodSurplus = foodProduced - (population × consumptionRate)
  if foodSurplus < 0: starvation occurs (see Step 04)
```

#### 5.2.5 Energy Balance

```
energySurplus = energyProduced - energyConsumed

Where:
  Tokamak  output  = 50 energy/turn
  Tokamak2 output  = 100 energy/turn
  Solar    output  = 10 energy/turn

  energyConsumed = Σ buildingPowerDraw for all operational buildings

  Building power draw by powerCostTier:
    Tier 0: Producer (output, not draw)
    Tier 1:   5 energy/turn (e.g., UGLab, UGUniv)
    Tier 2:  10 energy/turn (e.g., Fact, CommTwr)
    Tier 3:  20 energy/turn (e.g., Smelter, HotLab)
    Tier 4:  30 energy/turn (e.g., SpacePort, MassDrv)
    Tier 5:  50 energy/turn (specialized high-draw buildings)

  On deficit: power-down in priority order (see PowerStep)
```

#### 5.2.6 Starvation

```
if food < population:
    populationDecrease = population - food
    population -= populationDecrease
    food = 0
else:
    food -= population  (normal consumption)

  If population reaches 0:
    colony.isAlive = false
    game over triggered
```

### 5.3 Storage Limits and Resource Decay

```
Storage base capacity (no buildings):
  CommonMetals:  100
  RareMetals:     50
  Food:          200
  Energy:        500
  Population:    unlimited
  Research:      unlimited

Per Storage building (operational):
  +200 to all resource capacities

Per Warehouse building (operational):
  +100 to CommonMetals and RareMetals capacities

End-of-turn overflow:
  if pool.current > pool.capacity:
      pool.current = pool.capacity  (overflow discarded)

End-of-turn decay (only if no Storage operational):
  Food:    5% spoilage  (current *= 0.95)
  Energy: 10% decay     (current *= 0.90)
```

### 5.4 Morale Formula

```
morale = 50 (base)
  + 10  if foodSurplus > 0
  + 10  if UGRec operational
  + 5   if UGPark operational
  + 5   if Cops/Cops2 operational
  + 5   if UGUniv operational
  + 5   if Chap/Chap2 operational
  - 15  if energyBalance < 0 (power deficit)
  - 20  if recentDisaster this turn
  - 10  if population > housingCapacity × 1.2 (overcrowding)

clamp(morale, 0, 100)
```

### 5.5 Research Point Accumulation

```
researchPointsPerTurn = Σ researchOutput of operational research buildings

Lab:    5, Lab2:   10, Lab3:   15
HotLab: 10, HotLab2: 20
UGUniv: 3, UGUniv2:  6, UGUniv3: 9

Required points for tech unlock:
  Bit 0 (SpacePort):    always unlocked
  Bits 1-3:           100 points each
  Bits 4-6:           200 points each
  Bits 7-9:           300 points each
  Bits 10-11:         500 points each
```

---

## 6. Data Flow

### 6.1 Complete Game Loop Integration

```
GameEngine::runTurn()
│
├─ 1. UI collects player actions for this turn
│      ├─ Buildings placed (buildingIndex, gridX, gridY)
│      ├─ Units ordered to move (unitId, targetX, targetY)
│      ├─ Production/research queue changes
│      └─ AI toggle changes
│
├─ 2. SimulationContext built from current state + actions
│      ctx.turnNumber    = state.turnCount + 1
│      ctx.randomSeed    = deterministicHash(state, actions)
│      ctx.difficultyLevel = state.difficulty
│      ctx.isAITurn      = state.isAIControlled
│
├─ 3. Snapshot state before simulation
│      ColonyState beforeSim = state (deep copy for delta computation)
│
├─ 4. SimulationPipeline::executeTurn(state, ctx)
│      │
│      ├─ Step 01: prelimAlloc(state, ctx)
│      ├─ Step 02: pop(state, ctx)
│      ├─ Step 03: genKids(state, ctx)
│      ├─ Step 04: starve(state, ctx)
│      ├─ Step 05: fillResources(state, ctx)
│      ├─ Step 06: mines(state, ctx)
│      ├─ Step 07: factory(state, ctx)
│      ├─ Step 08: addSpew(state, ctx)
│      ├─ Step 09: power(state, ctx)
│      ├─ Step 10: morale(state, ctx)
│      ├─ Step 11: construct(state, ctx)
│      ├─ Step 12: putBldg(state, ctx)
│      ├─ Step 13: event(state, ctx)
│      ├─ Step 14: killBldg(state, ctx)
│      ├─ Step 15: aiInput(state, ctx)
│      ├─ Step 16: prodSched(state, ctx)
│      ├─ Step 17: rchSched(state, ctx)
│      ├─ Step 18: select(state, ctx)
│      ├─ Step 19: move(state, ctx)
│      └─ Step 20: endSim(state, ctx)
│
├─ 5. TurnResult built from (afterSim - beforeSim) deltas
│      result.resourceDeltas       = per-resource change
│      result.events               = merged from all step results
│      result.messages             = human-readable event descriptions
│      result.destroyedBuildingIds = from killBldg step
│      result.completedBuildingIds = from construct step
│      result.unlockedTechBits     = from rchSched step
│      result.colonistsLostToStarvation = from starve step
│      result.colonistsBorn        = from genKids step
│      result.isGameOver           = from endSim step
│
├─ 6. UI updates from TurnResult
│      ├─ Resource bars update with deltas
│      ├─ Event log appends new messages
│      ├─ Building list refreshed (new/destroyed)
│      ├─ Tech tree UI updated (new unlocks)
│      ├─ Population display updated
│      └─ Game over dialog if isGameOver
│
├─ 7. Audio system notified of events
│      ├─ BuildingComplete → construction sound
│      ├─ Disaster → alarm sound
│      ├─ Starvation → warning sound
│      └─ TechUnlocked → chime
│
├─ 8. Render next frame
│      ├─ Animation controller updates A/B frames
│      ├─ Camera responds to pan/zoom commands
│      └─ renderFrame(state, camera)
│
└─ 9. [Optional] Auto-save checkpoint
```

### 6.2 Thread Safety

The simulation engine is **single-threaded** by design:

```
┌─────────────────────────────────────────┐
│           Main Thread (UI)              │
│                                         │
│  while (running) {                      │
│      processUIEvents();                 │
│      if (simulationTickDue) {           │
│          snapshot = state;              │
│          pipeline.executeTurn(state,    │
│              ctx);                      │
│          result = computeDeltas(        │
│              snapshot, state);          │
│          updateUI(result);              │
│      }                                  │
│      renderFrame(state, camera);        │
│      audioSystem.update(state.events);  │
│  }                                      │
│                                         │
│  No worker threads access ColonyState.  │
│  All mutation happens synchronously     │
│  on the main thread.                    │
└─────────────────────────────────────────┘
```

If multithreaded simulation is desired for AI colonies, each AI colony operates on its own `ColonyState` copy; player colony always runs on the main thread.

### 6.3 Deterministic RNG

Each turn receives a deterministic seed derived from colony state:

```cpp
uint32_t generateTurnSeed(const ColonyState& state, uint32_t turnNumber) {
    // Combine turn number with colony state hash
    uint32_t h = turnNumber;
    h ^= state.resources[0].current + 0x9e3779b9 + (h << 6) + (h >> 2);
    h ^= state.resources[4].current + 0x9e3779b9 + (h << 6) + (h >> 2);
    h ^= state.tech.techMask + 0x9e3779b9 + (h << 6) + (h >> 2);
    h ^= state.buildings.size() + 0x9e3779b9 + (h << 6) + (h >> 2);
    return h;
}
```

This ensures that loading a save from the same state always produces identical simulation results (except when player actions differ).

---

## 7. Error Handling

### 7.1 Step Failure Behavior

```
ExecutionResult::success = false scenarios:

┌─ Step validation fails ─────────────────────────────┐
│  e.g., prelimAlloc detects negative resource count   │
│  Effect: Step returns ExecutionResult{false, msg}    │
│  Pipeline: Stops execution, rolls back state         │
│  TurnResult.success = false                          │
│  Error displayed to player                           │
└──────────────────────────────────────────────────────┘

┌─ Resource underflow ────────────────────────────────┐
│  e.g., fillResources tries to allocate more than     │
│  pool has available                                  │
│  Effect: Clamp to zero, log warning, continue        │
│  Message: "Resource allocation clamped for building" │
└──────────────────────────────────────────────────────┘

┌─ Invalid building reference ────────────────────────┐
│  e.g., getBuilding(index) returns null               │
│  Effect: Log error, skip this building, continue     │
│  Message: "Invalid building reference at index N"    │
└──────────────────────────────────────────────────────┘

┌─ AI decision failure ───────────────────────────────┐
│  e.g., AI tries to place building at occupied grid   │
│  Effect: Log warning, skip invalid placement         │
│  Message: "AI attempted invalid placement at (X,Y)"  │
└──────────────────────────────────────────────────────┘
```

### 7.2 State Validation

```cpp
// Pre-execution validation (run before step 01)
bool SimulationPipeline::validatePreconditions(const ColonyState& state) {
    bool valid = true;
    for (int i = 0; i < 6; i++) {
        if (state.resources[i].current < 0) {
            logError("Resource %d has negative value", i);
            valid = false;
        }
        // Research can exceed capacity, but others should not
        if (i != 5 && state.resources[i].capacity > 0 &&
            state.resources[i].current > state.resources[i].capacity) {
            logWarning("Resource %d exceeds capacity", i);
            // Not fatal — endSim will cap it
        }
    }
    if (state.resources[Population].current > state.housingCapacity &&
        state.housingCapacity > 0) {
        logWarning("Population exceeds housing capacity");
    }
    if (state.morale > 100 || state.morale < 0) {
        logError("Morale out of range: %d", state.morale);
        valid = false;
    }
    for (const auto& b : state.buildings) {
        if (b.def == nullptr) {
            logError("Building with null definition found");
            valid = false;
        }
        if (b.health > 100) {
            logError("Building health > 100: %d", b.health);
            valid = false;
        }
    }
    return valid;
}

// Post-execution validation (run after step 20)
bool SimulationPipeline::validatePostconditions(const ColonyState& state) {
    // Same checks as precondition, plus:
    if (state.turnCount == 0) {
        logError("Turn count was not incremented");
        return false;
    }
    return true;
}
```

### 7.3 Rollback Strategy

```cpp
// Rollback via snapshot-copy pattern:
TurnResult SimulationPipeline::executeTurn(ColonyState& state,
                                            const SimulationContext& ctx) {
    // 1. Deep copy current state
    ColonyState snapshot = state;

    // 2. Validate preconditions
    if (!validatePreconditions(state)) {
        return TurnResult{false, "Precondition validation failed"};
    }

    // 3. Execute steps
    std::vector<ExecutionResult> stepResults;
    for (auto& step : m_steps) {
        ExecutionResult result = step->execute(state, ctx);
        stepResults.push_back(result);

        if (!result.success) {
            // 4. ROLLBACK: restore snapshot on failure
            state = snapshot;
            return TurnResult{
                false,
                "Step " + std::string(step->name()) + " failed: " +
                result.errorMessage
            };
        }
    }

    // 5. Validate postconditions
    if (!validatePostconditions(state)) {
        state = snapshot;
        return TurnResult{false, "Postcondition validation failed"};
    }

    // 6. Build and return result
    return buildResult(snapshot, state, stepResults);
}

// Save corruption recovery:
// If a save file (*.ops) fails to deserialize:
// 1. Log the error with save path and corruption offset
// 2. Return an error to the UI
// 3. Player can load an earlier autosave from the save directory
// 4. If no valid save exists, offer "New Game" as fallback
```

### 7.4 Error Codes

| Code | Description | Severity | Handling |
|------|-------------|----------|----------|
| `ERR_NEGATIVE_RESOURCE` | Resource pool went negative | Fatal | Rollback turn, log error |
| `ERR_NULL_BUILDING_DEF` | BuildingInstance with null def pointer | Fatal | Rollback turn, log error |
| `ERR_MORALE_OUT_OF_RANGE` | Morale outside [0, 100] | Fatal | Rollback turn, log error |
| `ERR_STEP_NOT_FOUND` | Step priority not registered | Fatal | Pipeline init error, crash |
| `WARN_RESOURCE_OVERFLOW` | Resource > capacity | Non-fatal | Cap at endSim, log warning |
| `WARN_INVALID_PLACEMENT` | Building placement at occupied grid | Non-fatal | Skip placement, log warning |
| `WARN_DUPLICATE_MOVE` | Unit already has move order | Non-fatal | Skip duplicate, log warning |
| `WARN_STALLED_PRODUCTION` | Production order has no input | Non-fatal | Skip turn, log warning |
| `WARN_STALLED_CONSTRUCTION` | Build stalled (insufficient resources) | Non-fatal | Retry next turn, log warning |

---

## 8. Testing Interface

### 8.1 Test Fixture

```cpp
/// Simulation test harness
class SimulationTestFixture {
public:
    SimulationTestFixture();

    /// Load a known colony state from a JSON file
    /// Format matches the serialized ColonyState schema
    bool loadState(const std::string& jsonPath);

    /// Run N turns with deterministic seed
    /// @param turns Number of turns to simulate
    /// @param seed  Deterministic seed (0 = use default from state)
    /// @return Vector of TurnResult, one per turn
    std::vector<TurnResult> runTurns(uint32_t turns, uint32_t seed = 0);

    /// Load state and run N turns (convenience)
    std::vector<TurnResult> simulateFromFile(const std::string& jsonPath,
                                              uint32_t turns,
                                              uint32_t seed = 0);

    /// Access current state for assertions
    const ColonyState& state() const { return m_state; }
    ColonyState& mutableState() { return m_state; }

    /// Access the pipeline for step-level testing
    SimulationPipeline& pipeline() { return m_pipeline; }

    /// Assert a resource at expected value
    void assertResource(ResourceType type, int32_t expected,
                        const std::string& label = "");

    /// Assert tech mask matches expected
    void assertTechMask(uint16_t expected, const std::string& label = "");

    /// Assert morale in range
    void assertMoraleRange(uint8_t min, uint8_t max,
                           const std::string& label = "");

    /// Assert total population
    void assertPopulation(int32_t expected, const std::string& label = "");

    /// Save current state to JSON for regression testing
    bool saveState(const std::string& jsonPath);

private:
    ColonyState m_state;
    SimulationPipeline m_pipeline;
};
```

### 8.2 JSON Test State Format

```json
{
    "schemaVersion": "1.0.0",
    "colonyName": "Test Colony Alpha",
    "terrainType": 3,
    "turnCount": 0,
    "resources": {
        "commonMetals": { "current": 100, "capacity": 300 },
        "rareMetals":   { "current": 50,  "capacity": 150 },
        "food":         { "current": 200, "capacity": 400 },
        "energy":       { "current": 500, "capacity": 1000 },
        "population":   { "current": 50,  "capacity": 0 },
        "research":     { "current": 0,   "capacity": 0 }
    },
    "morale": 50,
    "techMask": 1,
    "buildings": [
        {
            "index": 22,
            "gridX": 0,
            "gridY": 0,
            "isComplete": true,
            "isOperational": true,
            "health": 100
        }
    ],
    "difficulty": 2,
    "isAIControlled": false
}
```

### 8.3 Data-Driven Test Examples

```cpp
TEST_CASE("PrelimAlloc assigns workers to mines") {
    SimulationTestFixture fix;
    fix.loadState("tests/data/basic-mine-state.json");

    // Run single step
    auto* step = fix.pipeline().getStep(1);
    SimulationContext ctx{};
    step->execute(fix.mutableState(), ctx);

    // Assert mine has workers assigned
    auto* mine = fix.state().getBuilding(/*index=*/22);
    CHECK(mine->workersAssigned > 0);
}

TEST_CASE("Starve reduces population on food deficit") {
    SimulationTestFixture fix;
    fix.loadState("tests/data/starve-test-state.json");
    // State: 100 pop, 30 food → expect 70 lost to starvation

    auto results = fix.runTurns(1);

    CHECK(results[0].colonistsLostToStarvation == 70);
    CHECK(fix.state().resource(ResourceType::Population).current == 30);
    CHECK(fix.state().resource(ResourceType::Food).current == 0);
}

TEST_CASE("Mine production formula matches expected output") {
    SimulationTestFixture fix;
    // DisMine index 22, base output 4 with staff=10, powered=2
    fix.loadState("tests/data/mine-production-test.json");

    auto results = fix.runTurns(1);

    // Expected: output = 4 * (1 + 10/10) * 2 = 4 * 2 * 2 = 16
    // CommonMetals: 16 * 3/4 = 12
    // RareMetals:   16 * 1/4 = 4
    CHECK(fix.state().resource(ResourceType::CommonMetals).current == 112); // 100+12
    CHECK(fix.state().resource(ResourceType::RareMetals).current == 54);    // 50+4
}

TEST_CASE("Power deficit causes building shutdown") {
    SimulationTestFixture fix;
    // 1 Tokamak (50 output), 3 buildings at tier 3 (60 draw)
    fix.loadState("tests/data/power-deficit-test.json");

    auto results = fix.runTurns(1);

    // Deficit = 50 - 60 = -10 → power-down 1 building
    CHECK(results[0].energyProduced == 50);
    CHECK(results[0].energyConsumed == 60);
    CHECK(fix.state().energyBalance == 0);  // Capped, handled by power-down
    CHECK(fix.state().poweredDownBuildings.size() == 1);
}

TEST_CASE("Tech tree unlock progresses correctly") {
    SimulationTestFixture fix;
    // State with 1 Lab, no tech unlocked beyond SpacePort (bit 0)
    fix.loadState("tests/data/research-test.json");

    // Run 20 turns (100 research points at 5/turn for Lab)
    auto results = fix.runTurns(20);

    // First tech unlock (bit 1) requires 100 points → should unlock at turn 20
    CHECK(fix.state().tech.techMask == 3);  // Bit 0 (SpacePort) + Bit 1
    CHECK(results[19].unlockedTechBits.size() == 1);
    CHECK(results[19].unlockedTechBits[0] == 1);
}

TEST_CASE("Deterministic simulation — same seed produces same result") {
    SimulationTestFixture fix1, fix2;
    fix1.loadState("tests/data/determinism-test.json");
    fix2.loadState("tests/data/determinism-test.json");

    auto r1 = fix1.runTurns(10, 42);
    auto r2 = fix2.runTurns(10, 42);

    for (int t = 0; t < 10; t++) {
        CHECK(r1[t].resourceDeltas == r2[t].resourceDeltas);
        CHECK(r1[t].events == r2[t].events);
        CHECK(r1[t].colonistsBorn == r2[t].colonistsBorn);
        CHECK(r1[t].colonistsLostToStarvation == r2[t].colonistsLostToStarvation);
    }
}

TEST_CASE("Original game behavior validation") {
    // Load states captured from original OUTPOST.EXE via memory dump
    // Run one turn and compare resource deltas against original game output
    SimulationTestFixture fix;

    // Known-good state from original game, turn 5
    fix.loadState("tests/original-game/dump-turn-005.json");
    auto result = fix.runTurns(1);

    // Compare against known-good result from original game, turn 6
    SimulationTestFixture expected;
    expected.loadState("tests/original-game/dump-turn-006.json");

    // Allow small tolerance (±1) for rounding differences
    for (int i = 0; i < 6; i++) {
        int32_t delta = fix.state().resources[i].current -
                        expected.state().resources[i].current;
        CHECK(std::abs(delta) <= 1);
    }
}
```

### 8.4 Performance Benchmarks

```cpp
TEST_CASE("Pipeline performance benchmark") {
    SimulationTestFixture fix;
    fix.loadState("tests/data/full-colony-state.json"); // 138 buildings, 200 pop

    auto start = std::chrono::steady_clock::now();
    auto results = fix.runTurns(100);
    auto end = std::chrono::steady_clock::now();

    auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>
                   (end - start).count();

    // Expect < 10ms per turn for full colony
    CHECK(elapsed < 1000);  // 100 turns in < 1 second
}
```

### 8.5 Test State Catalog

| Test File | Description | Purpose |
|-----------|-------------|---------|
| `tests/data/basic-mine-state.json` | 1 DisMine, 50 pop, 100 food | Mine production validation |
| `tests/data/starve-test-state.json` | 100 pop, 30 food | Starvation mechanics |
| `tests/data/mine-production-test.json` | 1 DisMine, staff 10, powered | Production formula |
| `tests/data/power-deficit-test.json` | 1 Tokamak, 3 tier-3 buildings | Power-down priority |
| `tests/data/research-test.json` | 1 Lab, techMask=1 | Research progression |
| `tests/data/determinism-test.json` | Full state with diverse buildings | Cross-run determinism |
| `tests/data/full-colony-state.json` | 138 buildings, 200 pop | Performance benchmark |
| `tests/original-game/dump-turn-NNN.json` | Memory dumps from original EXE | Ground-truth validation |

---

## 9. Appendix: Known Gaps and Future Work

### 9.1 Parameters Requiring Tuning

The following parameters are derived from RE analysis but have not been validated against the original game. They are marked as **TUNE** and should be verified through data-driven testing:

| Parameter | Current Value | Step | Notes |
|-----------|---------------|------|-------|
| Staffing tier → worker count | tier×10 | prelimAlloc | Verify against original SCPrelimAlloc |
| Birth rate base | 2% | genKids | May vary with difficulty |
| Birth rate food bonus | +3% | genKids | Verify threshold |
| Mine depletion % (DisMine) | 2% | mines | May be lower in original |
| Mine depletion % (ActiveMine) | 5% | mines | May be higher in original |
| Tokamak output | 50 | power | Verify against original SCPower |
| Solar output | 10 | power | Could be 5-20 range |
| Morale base | 50 | morale | Could be 40-60 |
| Morale food bonus | +10 | morale | May be +15 |
| Morale power deficit penalty | -15 | morale | May be -20 |
| Plague population loss | 10% | event | May vary with severity roll |
| Disaster cooldown range | 5-15 turns | event | Verify against original |
| Research cost (bits 1-3) | 100 points | rchSched | May vary per bit |
| Food spoilage rate | 5% | endSim | May be higher/lower |

### 9.2 Missing Features (Post-MVP)

| Feature | Priority | Notes |
|---------|----------|-------|
| HotLab meltdown probability | Medium | SpecialFlag=-1 risk calculation |
| Rebel colony simulation | Medium | SCEvent→Rebel mechanics need RE |
| SpacePort supply ship schedule | Medium | Earth resupply intervals |
| Mass driver targeting | Low | Weaponization against rebel colonies |
| Tutorial dcbSC integration | Low | TUTOR.OPS script binding to pipeline |
| Multi-colony simulation | Low | Player + AI colonies on same planet |
| Achievement/scoring system | Low | End-of-game score calculation |

---

*End of Simulation API Contract v1.0.0*
