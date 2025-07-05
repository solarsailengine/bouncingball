# Bouncing Ball Demo for SolarSail

A simple demonstration of SolarSail's entity-component system showing a ball bouncing around the screen edges.

## What It Demonstrates

- SolarSail's coordinate system (origin at center)
- Entity creation with components
- Script components with `on_init()` and `on_update()`
- Transform manipulation
- Sprite rendering with atlas
- Basic physics and collision detection

## Custom Ball Sprite

The demo includes a custom 3D-looking red ball created with SVG:

1. **Created SVG** (`ball_transparent.svg`):
   - Radial gradient from white highlight to bright red (#ff6b6b) to dark red (#c92a2a)
   - White highlight ellipse for shine effect
   - Subtle shadow underneath
   - 64x64 pixel dimensions

2. **PNG Conversion with Transparency**:
   - ImageMagick's `convert` command failed to preserve transparency properly
   - Solution: Use Inkscape for SVG to PNG conversion
   ```bash
   inkscape ball_transparent.svg --export-type=png --export-filename=ball.png --export-width=64 --export-height=64
   ```

3. **Atlas Creation**:
   - Copy `ball.png` as `atlas.png` (single sprite atlas)
   - Update `atlas.lua` to define one sprite named "ball"

## Running

```bash
cd /home/dagostinelli/projects/solarsail/bouncingball
make run
```

Press 'q' to quit.

## Key Files

- `program.lua` - Engine callbacks and window creation
- `game.json` - Scene definition with ball entity
- `ball.lua` - Ball physics and movement logic
- `config.lua` - Screen bounds and ball parameters

## Important Concepts

1. **Coordinate System**: Origin (0,0) is at screen center
2. **World Coordinates**: X: -1.78 to +1.78, Y: -1.0 to +1.0
3. **No dt parameter**: `on_update()` doesn't receive delta time
4. **Transform property**: Use `transform.translation`, not `transform.position`

See `GETTING_STARTED.md` for a detailed tutorial.