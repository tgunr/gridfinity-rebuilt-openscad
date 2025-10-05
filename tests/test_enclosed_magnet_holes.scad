// Test file for enclosed magnet hole functionality
// Tests the new enclosed parameter for print-pause-insert-resume workflow

include <../src/core/standard.scad>
include <../src/core/gridfinity-rebuilt-holes.scad>

// Test configurations for enclosed magnet holes
test_options_enclosed_basic = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=false,
    chamfer=false,
    supportless=false,
    enclosed=true  // NEW: Creates thin layer over magnet hole
);

test_options_enclosed_with_ribs = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=true,
    chamfer=false,
    supportless=false,
    enclosed=true  // NEW: Creates thin layer over magnet hole
);

test_options_enclosed_with_chamfer = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=false,
    chamfer=true,
    supportless=false,
    enclosed=true  // NEW: Creates thin layer over magnet hole
);

// Test 1: Basic enclosed magnet hole
module test_enclosed_basic() {
    echo("Testing basic enclosed magnet hole");
    difference() {
        cube([20, 20, 10], center=true);
        block_base_hole(test_options_enclosed_basic);
    }
}

// Test 2: Enclosed magnet hole with crush ribs
module test_enclosed_with_ribs() {
    echo("Testing enclosed magnet hole with crush ribs");
    translate([25, 0, 0]) {
        difference() {
            cube([20, 20, 10], center=true);
            block_base_hole(test_options_enclosed_with_ribs);
        }
    }
}

// Test 3: Enclosed magnet hole with chamfer (should not add chamfer due to enclosed logic)
module test_enclosed_with_chamfer() {
    echo("Testing enclosed magnet hole with chamfer");
    translate([50, 0, 0]) {
        difference() {
            cube([20, 20, 10], center=true);
            block_base_hole(test_options_enclosed_with_chamfer);
        }
    }
}

// Test 4: Compare regular vs enclosed magnet holes side by side
module test_comparison() {
    echo("Comparing regular vs enclosed magnet holes");
    translate([0, 25, 0]) {
        // Regular magnet hole
        difference() {
            cube([15, 15, 8], center=true);
            block_base_hole(bundle_hole_options(
                magnet_hole=true,
                enclosed=false
            ));
        }

        // Enclosed magnet hole
        translate([20, 0, 0]) {
            difference() {
                cube([15, 15, 8], center=true);
                block_base_hole(bundle_hole_options(
                    magnet_hole=true,
                    enclosed=true
                ));
            }
        }
    }
}

// Test 5: Multiple enclosed magnet holes in a baseplate configuration
module test_baseplate_enclosed() {
    echo("Testing enclosed magnet holes in baseplate configuration");
    translate([0, 50, 0]) {
        hole_options = bundle_hole_options(
            magnet_hole=true,
            enclosed=true,
            crush_ribs=true
        );

        difference() {
            // Simulate a 2x2 baseplate section
            cube([42, 42, 7], center=true);

            // Place magnet holes at corners
            for (x = [-15.5, 15.5]) {
                for (y = [-15.5, 15.5]) {
                    translate([x, y, 0])
                    block_base_hole(hole_options);
                }
            }
        }
    }
}

// Run all tests
test_enclosed_basic();
test_enclosed_with_ribs();
test_enclosed_with_chamfer();
test_comparison();
test_baseplate_enclosed();

echo("All enclosed magnet hole tests completed successfully!");