// Test file for magnet hole placement functionality
// Tests the new magnet_holes_top and magnet_holes_bottom parameters

include <src/core/base.scad>

// Test configurations for different magnet hole placement modes
test_options_magnet_bottom_only = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=true,
    chamfer=false,
    supportless=false
);

test_options_magnet_top_only = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=true,
    chamfer=false,
    supportless=false
);

test_options_magnet_both = bundle_hole_options(
    refined_hole=false,
    magnet_hole=true,
    screw_hole=false,
    crush_ribs=true,
    chamfer=false,
    supportless=false
);

// Test 1: Bottom only placement (default behavior - backward compatibility)
module test_magnet_bottom_only() {
    echo("Testing magnet holes - BOTTOM ONLY");
    gridfinityBase(
        grid_size = [2, 2],
        hole_options = test_options_magnet_bottom_only,
        magnet_holes_top = true,
        magnet_holes_bottom = false
    );
}

// Test 2: Top only placement
module test_magnet_top_only() {
    echo("Testing magnet holes - TOP ONLY");
    gridfinityBase(
        grid_size = [2, 2],
        hole_options = test_options_magnet_top_only,
        magnet_holes_top = false,
        magnet_holes_bottom = true
    );
}

// Test 3: Both bottom and top placement
module test_magnet_both() {
    echo("Testing magnet holes - BOTTOM AND TOP");
    gridfinityBase(
        grid_size = [2, 2],
        hole_options = test_options_magnet_both,
        magnet_holes_top = true,
        magnet_holes_bottom = true
    );
}

// Test 4: Backward compatibility - default parameters should work
module test_backward_compatibility() {
    echo("Testing backward compatibility - default parameters");
    gridfinityBase(
        grid_size = [2, 2],
        hole_options = test_options_magnet_bottom_only
        // Using defaults: magnet_holes_top=true, magnet_holes_bottom=false
    );
}

// Test 5: Lite version with different placement modes
module test_lite_magnet_bottom_only() {
    echo("Testing lite magnet holes - BOTTOM ONLY");
    gridfinity_base_lite(
        grid_size = [2, 2],
        wall_thickness = 1.2,
        bottom_thickness = 2.0,
        hole_options = test_options_magnet_bottom_only,
        magnet_holes_top = true,
        magnet_holes_bottom = false
    );
}

module test_lite_magnet_top_only() {
    echo("Testing lite magnet holes - TOP ONLY");
    gridfinity_base_lite(
        grid_size = [2, 2],
        wall_thickness = 1.2,
        bottom_thickness = 2.0,
        hole_options = test_options_magnet_top_only,
        magnet_holes_top = false,
        magnet_holes_bottom = true
    );
}

module test_lite_magnet_both() {
    echo("Testing lite magnet holes - BOTTOM AND TOP");
    gridfinity_base_lite(
        grid_size = [2, 2],
        wall_thickness = 1.2,
        bottom_thickness = 2.0,
        hole_options = test_options_magnet_both,
        magnet_holes_top = true,
        magnet_holes_bottom = true
    );
}

// Run all tests
test_magnet_bottom_only();
// translate([25, 0, 0]) test_magnet_top_only();
// translate([50, 0, 0]) test_magnet_both();
// translate([0, 25, 0]) test_backward_compatibility();
// translate([25, 25, 0]) test_lite_magnet_bottom_only();
// translate([50, 25, 0]) test_lite_magnet_top_only();
// translate([0, 50, 0]) test_lite_magnet_both();