// Cross-section view to debug the enclosed magnet cavity
include <../src/core/standard.scad>
use <../src/core/gridfinity-rebuilt-holes.scad>

$fa = 4;
$fs = 0.25;

// Test enclosed magnet cavity
hole_options_enclosed = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=false,
    chamfer=false,
    supportless=false,
    enclosed_magnet=true
);

// Create a cube with enclosed cavity, then cut it in half to see cross-section
difference() {
    difference() {
        translate([-5, -5, 0])
        cube([10, 10, 5]);
        
        block_base_hole(hole_options_enclosed);
    }
    
    // Cut in half to see cross-section
    translate([-10, 0, -1])
    cube([20, 20, 20]);
}

echo("=== CROSS-SECTION VIEW ===");
echo("Looking at the cross-section from the front:");
echo("Expected layers (from bottom up):");
echo("  z=0.0-0.2mm: SOLID (no cavity)");
echo("  z=0.2-2.4mm: HOLLOW (cavity with walls)");
echo("  z=2.4-5.0mm: SOLID (top of cube)");