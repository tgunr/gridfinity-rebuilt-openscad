// Example: How to use the enclosed magnet cavity feature
// This creates a bin with enclosed magnet cavities for pause-and-insert printing

include <../src/core/standard.scad>
use <../src/core/gridfinity-rebuilt-utility.scad>
use <../src/core/gridfinity-rebuilt-holes.scad>
use <../src/core/bin.scad>

/* [Setup Parameters] */
$fa = 4;
$fs = 0.25;

/* [General Settings] */
gridx = 1;
gridy = 1;
gridz = 3;

/* [Base Hole Options] */
// Enable enclosed magnet cavity (solid bottom + hollow walls)
enclosed_magnet_cavity = true;
// Magnet holes will have crush ribs to hold the magnet
crush_ribs = true;
// Magnet/Screw holes will have a chamfer to ease insertion
chamfer_holes = true;

// Create hole options with enclosed magnet cavity enabled
hole_options = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=crush_ribs,
    chamfer=chamfer_holes,
    supportless=false,
    enclosed_magnet=enclosed_magnet_cavity
);

// Create the bin
bin1 = new_bin(
    grid_size = [gridx, gridy],
    height_mm = fromGridfinityUnits(gridz),
    hole_options = hole_options
);

// Render the bin
bin_render(bin1);

echo("=== ENCLOSED MAGNET CAVITY PRINTING INSTRUCTIONS ===");
echo("1. Slice this model with your slicer");
echo("2. Set up a pause at layer height 2.0mm (10 layers at 0.2mm layer height)");
echo("3. Start the print - it will print:");
echo("   - Layer 1 (0-0.2mm): Solid bottom of cavity");
echo("   - Layers 2-10 (0.2-2.0mm): Hollow cylinder walls");
echo("4. When printer pauses at 2mm:");
echo("   - Insert 6mm x 2mm magnet into the cavity");
echo("   - Resume print");
echo("5. Printer will continue and print solid layers over the magnet, encasing it");
echo("====================================================");