# Contract: Tile Map Format

> **Superseded 2026-10-12** by [../findings/10-map.md](../findings/10-map.md): the map is a sparse grid of tile handles per site and level over a terrain bitmap (5xxA.BMP).

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A4 (rendering is DIB.DRV + SetDIBitsToDevice)). See [ERRATA.md](../findings/ERRATA.md) and the verified [00-ground-truth.md](../findings/00-ground-truth.md) before relying on it.

**Status**: Complete — Non-tile-engine architecture confirmed

## Architecture

Outpost does NOT use a traditional tile engine. The "map" is implemented through three hierarchical pre-rendered view layers, not a tile array. There is no tile map data file; terrain is displayed by selecting a full-screen bitmap based on the colony's terrain type.

## View System (3 zoom levels)

| View | Icon (32×32) | Bitmap Source | Description |
|------|-------------|---------------|-------------|
| **Planet View** | `PLNTICON.BMP` | `480*.BMP` series (640×480) | Orbital view — 15 star systems, planet surface with site selection |
| **Site View** | `SITEICON.BMP` | `TILE1-6.BMP` (640×480) | Colony close-up — terrain type backdrop, building placement |
| **Tile View** | `TILEICON.BMP` | Enlarged tile area | Individual tile inspection with building sprite overlay |

## Terrain Rendering (Site View)

### Terrain Bitmap Catalog

| File | Dimensions | Size | Role |
|------|-----------|------|------|
| `TILE1.BMP` | 640×480 | 308,278 | Terrain type 1 (rocky) |
| `TILE2.BMP` | 640×480 | 308,278 | Terrain type 2 |
| `TILE3.BMP` | 640×480 | 308,278 | Terrain type 3 |
| `TILE4.BMP` | 640×480 | 308,278 | Terrain type 4 (animated: + `TILE4A.BMP`, `TILE4B.BMP`) |
| `TILE5.BMP` | 640×480 | 308,278 | Terrain type 5 (animated: + `TILE5A.BMP`, `TILE5B.BMP`) |
| `TILE6.BMP` | 640×480 | 308,278 | Terrain type 6 |

### Rendering Pipeline

```
1. Determine terrain type (from colony state / site data)
2. Load TILE{N}.BMP for the terrain type
3. Blit 640×480 bitmap to the viewport (GDI StretchBlt / SetDIBitsToDevice)
4. For each placed building at this site:
   a. Load building sprite (500-579 series, 300×150 BMP)
   b. If animated, alternate A/B frame each timer tick
   c. Blit sprite at grid coordinate position on the terrain backdrop
5. Blit UI chrome (toolbar, info panels, buttons) on top
```

### Animation Variants

- `TILE4A/B.BMP`, `TILE5A/B.BMP` — 2-frame A/B animation for terrain features (e.g., flowing lava, moving water)
- Building sprites `500A.BMP` ↔ `500.BMP` — active/inactive or open/closed state flip
- Timer-driven via MMSYSTEM `timeSetEvent`, decoupled from simulation turns

## Coordinate System

### Grid Positioning

Buildings are placed on the 640×480 site view using a grid coordinate system confirmed by format strings in the EXE:

| Format String | Usage | Example |
|--------------|-------|---------|
| `"%d,%d"` | Building placement coordinates | `"3,5"` = grid column 3, row 5 |
| `"%d,%d,%d,%d"` | Selection rectangle | `"2,3,8,7"` = x1,y1,x2,y2 |
| `"Site %d"` | Colony site identifier | `"Site 4"` = colony index |

### Grid Model (Hypothesized)

The terrain bitmap (640×480) is divided into an implicit grid. Building sprites (300×150) are positioned at integer grid coordinates, aligning with the 640×480 backdrop.

| Property | Value |
|----------|-------|
| Viewport size | 640×480 pixels |
| Sprite size | 300×150 pixels (building sprites) |
| Grid columns | ~2–3 per row (based on 640/300) |
| Grid rows | ~3 per column (based on 480/150) |
| Coordinate format | `"%d,%d"` (col, row) |

### Site Identifiers

- `"Site %d"` references an indexed colony location on the planet
- Sites correspond to positions on the 480.BMP planet view
- Each site has an associated terrain type (1–6) that determines which TILE*.BMP to display

## Building Sprite Overlay

### Sprite Catalog

| ID Range | Count | Size | Content |
|----------|-------|------|---------|
| 500–579 | 80 + 80A | 300×150 | Building structures (A = animated frame) |
| 580–649 | 70 | 145×120 | Robots, vehicles, units |
| 845–849 | ~5 | 145×120 | Additional units |

### Placement Data Model

Building positions are stored per colony/state (not in a map file). The hypothetical data structure:

```c
struct BuildingPlacement {
    uint16  buildingIndex;     // BLDGBLD.DAT index (0-137)
    uint8   gridX;             // Column position ("%d")
    uint8   gridY;             // Row position ("%d")
    uint8   terrainType;       // 1-6 (TILE1*.BMP - TILE6*.BMP)
    uint8   animationFrame;    // 0=A, 1=B (for animated sprites)
    // ... additional state fields
};
```

## Minimap System

| File | Dimensions | Role |
|------|-----------|------|
| `1TILE.BMP` | 132×125 | Minimap tile legend — colored tile type reference |
| `SURFACE.BMP` | 77×19 | Elevation/surface-type indicator strip |
| `LEVEL1.BMP`–`LEVEL4.BMP` | 77×19 | Underground level indicator strips |
| `TILEICON.BMP` | 32×32 | Tile view mode icon |
| `SITEICON.BMP` | 32×32 | Site view mode icon |
| `PLNTICON.BMP` | 32×32 | Planet view mode icon |

## Planet View (480.BMP Series)

The 480-bitmap series provides the top-level planet selection view:

| Examples | Dimensions | Content |
|----------|-----------|---------|
| `480.BMP`, `480A.BMP` | 640×480 | Planet surface from orbit |
| `480B.BMP`, `482.BMP`, `484.BMP` | 640×480 | Alternate planet views |

## Tool Interface

```
map-viewer render <site-id> --terrain <1-6> --buildings <csv> [--tileset <dir>] [--out <png>]
map-viewer planet <planet-id> [--out <png>]
```

**Expected behavior**:
- `render`: Load the specified terrain TILE{N}.BMP, overlay building sprites at grid coordinates from the CSV (format: `buildingIdx,gridX,gridY`), output a PNG image of the complete site view
- `planet`: Extract and display the 480.BMP planet view
- No tile map binary format exists — the "map" is synthetic, composed of pre-rendered bitmaps with sprite overlays
