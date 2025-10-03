// Test file for directional expansion modes
// This file demonstrates the new directional expansion functionality

include <gridfinity-rebuilt-baseplate.scad>

// Test parameters
gridx = 1;
gridy = 1;
distancex = 80;  // Larger than base size to force expansion
distancey = 80;  // Larger than base size to force expansion

// Test different expansion modes
module test_both_sides() {
    echo("Testing: Both sides expansion (default)");
    color("blue")
    gridfinityBaseplate([gridx, gridy], l_grid, [distancex, distancey], 1, hole_options, 0, [0, 0], true, false, "both", "both");
}

module test_left_only() {
    echo("Testing: Left only expansion");
    color("red")
    translate([100, 0, 0])
    gridfinityBaseplate([gridx, gridy], l_grid, [distancex, distancey], 1, hole_options, 0, [0, 0], true, false, "left_only", "both");
}

module test_right_only() {
    echo("Testing: Right only expansion");
    color("green")
    translate([200, 0, 0])
    gridfinityBaseplate([gridx, gridy], l_grid, [distancex, distancey], 1, hole_options, 0, [0, 0], true, false, "right_only", "both");
}

module test_top_only() {
    echo("Testing: Top only expansion");
    color("yellow")
    translate([0, 100, 0])
    gridfinityBaseplate([gridx, gridy], l_grid, [distancex, distancey], 1, hole_options, 0, [0, 0], true, false, "both", "top_only");
}

module test_bottom_only() {
    echo("Testing: Bottom only expansion");
    color("purple")
    translate([100, 100, 0])
    gridfinityBaseplate([gridx, gridy], l_grid, [distancex, distancey], 1, hole_options, 0, [0, 0], true, false, "both", "bottom_only");
}

// Run all tests
test_both_sides();
test_left_only();
test_right_only();
test_top_only();
test_bottom_only();