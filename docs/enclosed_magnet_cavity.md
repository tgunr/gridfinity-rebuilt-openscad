# Enclosed Magnet Cavity Feature

## Overview

The enclosed magnet cavity feature allows you to create bins and baseplates with magnet cavities that have:
- A **solid bottom layer** (0.2mm thick)
- **Hollow cylinder walls** (from 0.2mm to 2.4mm height)
- An **open top** for magnet insertion during printing

This enables **pause-and-insert printing** where you pause the print at 2mm height, insert the magnet, and resume printing to encase it.

## Benefits

1. **No supports needed** - The solid bottom layer prints directly on the build plate
2. **Secure magnet retention** - The magnet is completely enclosed within the object
3. **Easy insertion** - Pause the print and drop the magnet in from above
4. **Clean finish** - The top layer prints over the magnet for a professional look

## Usage

### In Bins (gridfinity-rebuilt-bins.scad)

Set the `enclosed_magnet_cavity` parameter to `true`:

```openscad
/* [Base Hole Options] */
magnet_holes = true;
crush_ribs = true;
chamfer_holes = true;
printable_hole_top = false;  // Not needed with enclosed cavity
enclosed_magnet_cavity = true;  // Enable enclosed cavity
```

### In Baseplates (gridfinity-rebuilt-baseplate.scad)

Set the `enclosed_magnet_cavity` parameter to `true`:

```openscad
/* [Magnet Hole] */
enable_magnet = true;
crush_ribs = true;
chamfer_holes = true;
enclosed_magnet_cavity = true;  // Enable enclosed cavity
```

### In Code

Use the `bundle_hole_options()` function:

```openscad
hole_options = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=true,
    chamfer=true,
    supportless=false,
    enclosed_magnet=true  // Enable enclosed cavity
);
```

## Printing Instructions

1. **Slice the model** with your preferred slicer (Cura, PrusaSlicer, etc.)

2. **Add a pause at layer height 2.0mm**
   - In Cura: Extensions → Post Processing → Modify G-Code → Add "Pause at height" at 2.0mm
   - In PrusaSlicer: Right-click on layer slider at 2.0mm → Add pause print (M601)
   - In Simplify3D: Add a process change at 2.0mm with M0 command

3. **Start the print**
   - Layers 1 (0-0.2mm): Solid bottom of cavity
   - Layers 2-10 (0.2-2.0mm): Hollow cylinder walls

4. **When the printer pauses at 2mm:**
   - Insert your 6mm diameter × 2mm height magnet into the cavity
   - The magnet should drop in from the top
   - Resume the print

5. **Printer continues:**
   - Prints solid layers over the magnet
   - Completely encases the magnet within the object

## Technical Details

- **Bottom layer thickness**: 0.2mm (1 layer at standard 0.2mm layer height)
- **Wall thickness**: 0.2mm (1 perimeter)
- **Cavity height**: 2.4mm (MAGNET_HOLE_DEPTH)
- **Magnet size**: 6mm diameter × 2mm height
- **Pause height**: 2.0mm (allows clearance for magnet insertion)

## Compatibility

- ✅ Compatible with `crush_ribs` (recommended for press fit)
- ✅ Compatible with `chamfer` (eases magnet insertion)
- ❌ **NOT** compatible with `supportless` (different printing strategy)
- ❌ **NOT** compatible with `refined_hole` (different hole type)
- ✅ Requires `magnet_hole=true`

## Comparison with Other Options

| Feature | Regular Hole | Supportless | Enclosed Cavity |
|---------|-------------|-------------|-----------------|
| Bottom | Open | Bridging layers | Solid (0.2mm) |
| Walls | Full cylinder | Full cylinder | Hollow (0.2mm thick) |
| Magnet insertion | Press from bottom | Press from bottom | Drop from top during print |
| Supports needed | No | No | No |
| Encased magnet | No | No | Yes |

## Example Files

- `examples/enclosed_magnet_example.scad` - Complete working example
- `tests/test_enclosed_magnet.scad` - Test file showing all variations

## Troubleshooting

**Problem**: Magnet falls through the bottom
- **Solution**: Ensure your first layer is properly calibrated and adhering well

**Problem**: Walls are too thin and break
- **Solution**: This is by design (0.2mm walls). The magnet provides structural support once inserted

**Problem**: Magnet doesn't fit
- **Solution**: Check your magnet size (should be 6mm × 2mm). Adjust `MAGNET_HOLE_RADIUS` in `src/core/standard.scad` if needed

**Problem**: Top layer doesn't seal properly
- **Solution**: Ensure you resume the print promptly after inserting the magnet. The cavity should be at exactly 2mm when paused.