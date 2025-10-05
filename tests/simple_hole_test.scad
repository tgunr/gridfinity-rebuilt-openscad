// Simple test to verify magnet holes are working
include <src/core/standard.scad>
use <src/core/gridfinity-rebuilt-holes.scad>

// Test basic magnet hole creation
hole_options = bundle_hole_options(refined_hole=false, magnet_hole=true, screw_hole=false, crush_ribs=true, chamfer=true, supportless=false);

echo("Hole options:", hole_options);
echo("Magnet hole enabled:", hole_options[1]);

// Create a simple cube and add a magnet hole
difference() {
    cube([42, 42, 5]);

    translate([21, 21, 0])
    block_base_hole(hole_options);
}

echo("Simple magnet hole test completed!");