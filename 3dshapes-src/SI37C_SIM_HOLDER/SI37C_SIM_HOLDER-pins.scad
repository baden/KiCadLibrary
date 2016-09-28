include <defines.scad>

pitch = 2.5;
p_w = 0.6;

module PinT() {
  translate([-p_w/2, 6.08 - 0.8, 0.00]) cube([p_w, 0.8, 0.15]);

  difference() {
    translate([-1.2/2, 1.1, 0.10]) cube([1.2, 4.2, 0.15]);
    translate([-1.0/2, 1.7, 0.00]) cube([1.0, 2.6, 0.3]);
  }

  translate([0, 1.7, 0.1])
  rotate([18.4, 0, 0])
  linear_extrude(height = 0.15, center = false)
    polygon([
      [-0.30, 0.00],
      [-0.15, 1.69],
      [ 0.15, 1.69],
      [ 0.30, 0.00]
    ]);

  translate([0, 3.4, 0.70]) cube([0.3, 0.3, 0.15], center=true);

}

module PinB() {
  translate([-p_w/2, -6.08, 0.00]) cube([p_w, 0.8, 0.15]);

  translate([0,-5.8,0]) {
    difference() {
      translate([-1.2/2, 0.5, 0.10]) cube([1.2, 4.2, 0.15]);
      translate([-1.0/2, 1.7, 0.00]) cube([1.0, 2.6, 0.3]);
    }

    translate([0, 1.7, 0.1])
    rotate([18.4, 0, 0])
    linear_extrude(height = 0.15, center = false)
      polygon([
        [-0.30, 0.00],
        [-0.15, 1.69],
        [ 0.15, 1.69],
        [ 0.30, 0.00]
      ]);

    translate([0, 3.4, 0.70]) cube([0.3, 0.3, 0.15], center=true);

  }

}
// Pins
scale(scale) color("Silver") {
  translate([-2.54,0,0]) PinT();
  PinT();
  translate([ 2.54,0,0]) PinT();

  translate([-2.54,0,0]) PinB();
  PinB();
  translate([ 2.54,0,0]) PinB();
}
