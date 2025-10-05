// Test file for enclosed magnet cavity feature
include <../src/core/standard.scad>
use <../src/core/gridfinity-rebuilt-holes.scad>

// Test the new enclosed_magnet parameter
echo("Testing enclosed magnet cavity feature");

// Test 1: Enclosed magnet cavity with crush ribs
module test_enclosed_with_ribs() {
    echo("Test 1: Enclosed magnet cavity WITH crush ribs");
    hole_options = bundle_hole_options(
        refined_hole=false,
        magnet_hole=true,
        screw_hole=false,
        crush_ribs=true,
        chamfer=false,
        supportless=false,
        enclosed_magnet=true
    );
    
    difference() {
        cube([20, 20, 10], center=true);
        translate([0, 0, -5])
        block_base_hole(hole_options);
    }
}

// Test 2: Enclosed magnet cavity without crush ribs
module test_enclosed_without_ribs() {
    echo("Test 2: Enclosed magnet cavity WITHOUT crush ribs");
    hole_options = bundle_hole_options(
        refined_hole=false,
        magnet_hole=true,
        screw_hole=false,
        crush_ribs=false,
        chamfer=false,
        supportless=false,
        enclosed_magnet=true
    );
    
    translate([30, 0, 0])
    difference() {
        cube([20, 20, 10], center=true);
        translate([0, 0, -5])
        block_base_hole(hole_options);
    }
}

// Test 3: Enclosed magnet cavity with chamfer
module test_enclosed_with_chamfer() {
    echo("Test 3: Enclosed magnet cavity WITH chamfer");
    hole_options = bundle_hole_options(
        refined_hole=false,
        magnet_hole=true,
        screw_hole=false,
        crush_ribs=true,
        chamfer=true,
        supportless=false,
        enclosed_magnet=true
    );
    
    translate([60, 0, 0])
    difference() {
        cube([20, 20, 10], center=true);
        translate([0, 0, -5])
        block_base_hole(hole_options);
    }
}

// Test 4: Regular magnet hole for comparison (NOT enclosed)
module test_regular_magnet_hole() {
    echo("Test 4: Regular magnet hole (NOT enclosed) for comparison");
    hole_options = bundle_hole_options(
        refined_hole=false,
        magnet_hole=true,
        screw_hole=false,
        crush_ribs=true,
        chamfer=false,
        supportless=false,
        enclosed_magnet=false
    );
    
    translate([0, 30, 0])
    difference() {
        cube([20, 20, 10], center=true);
        translate([0, 0, -5])
        block_base_hole(hole_options);
    }
}

// Run all tests
test_enclosed_with_ribs();
test_enclosed_without_ribs();
test_enclosed_with_chamfer();
test_regular_magnet_hole();

echo("All enclosed magnet cavity tests completed!");
echo("Expected behavior:");
echo("  - Tests 1-3: Should have solid bottom layer (0.2mm) + hollow walls");
echo("  - Test 4: Should be a regular open hole for comparison");