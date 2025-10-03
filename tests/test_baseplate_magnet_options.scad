// Test file for baseplate magnet hole options
include <src/core/standard.scad>
include <src/core/gridfinity-baseplate.scad>
use <src/core/gridfinity-rebuilt-utility.scad>
use <src/core/gridfinity-rebuilt-holes.scad>
use <src/helpers/generic-helpers.scad>
use <src/helpers/grid.scad>

// Test 1: Default behavior (backward compatibility) - WEIGHTED style
module test_bottom_only() {
    echo("Testing bottom-only magnet holes (WEIGHTED style)");
    hole_options_bottom = bundle_hole_options(refined_hole=false, magnet_hole=true, screw_hole=false, crush_ribs=true, chamfer=true, supportless=false);
    gridfinityBaseplate([1, 1], l_grid, [0, 0], 1, hole_options_bottom, 0, [0, 0], magnet_holes_top=true, magnet_holes_bottom=false);
}

// Test 2: Top-only magnet holes - WEIGHTED style
module test_top_only() {
    echo("Testing top-only magnet holes (WEIGHTED style)");
    translate([50, 0, 0]) {
        hole_options_top = bundle_hole_options(refined_hole=false, magnet_hole=true, screw_hole=false, crush_ribs=true, chamfer=true, supportless=false);
        gridfinityBaseplate([1, 1], l_grid, [0, 0], 1, hole_options_top, 0, [0, 0], magnet_holes_top=false, magnet_holes_bottom=true);
    }
}

// Test 3: Both bottom and top magnet holes - WEIGHTED style
module test_both() {
    echo("Testing both bottom and top magnet holes (WEIGHTED style)");
    translate([100, 0, 0]) {
        hole_options_both = bundle_hole_options(refined_hole=false, magnet_hole=true, screw_hole=false, crush_ribs=true, chamfer=true, supportless=false);
        gridfinityBaseplate([1, 1], l_grid, [0, 0], 1, hole_options_both, 0, [0, 0], magnet_holes_top=true, magnet_holes_bottom=true);
    }
}

// Test 4: No magnet holes - WEIGHTED style
module test_none() {
    echo("Testing no magnet holes (WEIGHTED style)");
    translate([150, 0, 0]) {
        hole_options_none = bundle_hole_options(refined_hole=false, magnet_hole=false, screw_hole=false, crush_ribs=true, chamfer=true, supportless=false);
        gridfinityBaseplate([1, 1], l_grid, [0, 0], 1, hole_options_none, 0, [0, 0], magnet_holes_top=true, magnet_holes_bottom=true);
    }
}

// Test 5: Weighted style with magnet holes (best style for magnet holes)
module test_weighted() {
    echo("Testing weighted style with magnet holes");
    translate([200, 0, 0]) {
        hole_options_weighted = bundle_hole_options(refined_hole=false, magnet_hole=true, screw_hole=false, crush_ribs=true, chamfer=true, supportless=false);
        gridfinityBaseplate([1, 1], l_grid, [0, 0], 1, hole_options_weighted, 0, [0, 0], magnet_holes_top=true, magnet_holes_bottom=false);
    }
}

// Run all tests
test_bottom_only();
test_top_only();
test_both();
test_none();
test_weighted();

echo("All baseplate magnet hole tests completed successfully!");