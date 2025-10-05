// Simple cavity test to debug slicer recognition
include <../src/core/standard.scad>

module basic_through_hole() {
    // Most basic through hole possible - explicitly centered
    difference() {
        cube([20, 20, 10]);
        translate([10, 10, 0])  // Center the cylinder in the cube
        cylinder(h=12, r=4, center=true);
    }
}

module basic_enclosed_cavity() {
    // UNIFIED cavity structure: solid base → hollow cavity → solid bridge
    translate([10, 10, 0]) {
        difference() {
            // SOLID container: base + walls + bridge (2.4mm total)
            cylinder(h=2.4, r=4);

            // Cut out cavity space starting SLIGHTLY above base (layers 2-10)
            // This ensures first layer is completely solid
            translate([0, 0, 0.21])  // Start cavity slightly above base
            cylinder(h=1.99, r=4);   // 2mm cavity, slightly less to avoid bottom
        }
    }
}

module bridged_cavity() {
    // Same unified structure as basic_enclosed_cavity
    translate([10, 10, 0]) {
        difference() {
            // SOLID container: base + walls + bridge (2.4mm total)
            cylinder(h=2.4, r=4);

            // Cut out cavity space starting SLIGHTLY above base (layers 2-10)
            translate([0, 0, 0.21])  // Start cavity slightly above base
            cylinder(h=1.99, r=4);   // 2mm cavity, slightly less to avoid bottom
        }
    }
}

basic_through_hole();
translate([25, 0, 0]) basic_enclosed_cavity();
translate([50, 0, 0]) bridged_cavity();