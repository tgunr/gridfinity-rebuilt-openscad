// Simple visual test for enclosed magnet cavity
include <../src/core/standard.scad>
use <../src/core/gridfinity-rebuilt-holes.scad>

$fa = 4;
$fs = 0.25;

// Test enclosed magnet cavity
hole_options_enclosed = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=false,  // Disable ribs for clearer visualization
    chamfer=false,
    supportless=false,
    enclosed_magnet=true
);

// Test regular hole for comparison
hole_options_regular = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=false,
    chamfer=false,
    supportless=false,
    enclosed_magnet=false
);

// Create a simple cube with enclosed cavity
difference() {
    translate([-5, -5, 0])
    cube([10, 10, 5]);
    
    // This is the NEGATIVE that gets subtracted
    block_base_hole(hole_options_enclosed);
}

// Create a simple cube with regular hole for comparison
translate([15, 0, 0])
difference() {
    translate([-5, -5, 0])
    cube([10, 10, 5]);
    
    block_base_hole(hole_options_regular);
}

echo("Left cube: ENCLOSED cavity (should have solid bottom 0-0.2mm, hollow 0.2-2.4mm)");
echo("Right cube: REGULAR hole (should be open all the way through)");