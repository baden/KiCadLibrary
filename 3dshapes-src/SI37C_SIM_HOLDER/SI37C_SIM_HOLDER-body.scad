include <defines.scad>

module Base() {
  linear_extrude(height = 0.5, center = false)
    polygon([
      [-5.00, -6.15],
      [-5.00,  5.25],
      [-4.25,  6.15],
      [-3.85,  6.15],
      [-3.85,  5.15],
      [ 3.85,  5.15],
      [ 3.85,  6.15],
      [ 5.00,  6.15],
      [ 5.00, -6.15],
      [ 3.85, -6.15],
      [ 3.85, -5.15],
      [-3.85, -5.15],
      [-3.85, -6.15]
    ]);

  translate([8.9/2, -12.30/2])
    cube([0.55, 12.30, 1.25], center=false);

  linear_extrude(height = 1.25, center = false)
    polygon([
      [-5.00, -6.15],
      [-5.00,  5.25],
      [-4.25,  6.15],
      [-3.85,  6.15],
      [-3.85,  5.15],
      [-4.45,  4.45],
      [-4.45, -6.15]
    ]);
}


scale(scale) color("Gray") {
  difference() {
    Base();

    translate([-0.6-2.54, 1.1, -1]) cube([1.2, 3.3, 2]);
    translate([-0.6, 1.1, -1]) cube([1.2, 3.3, 2]);
    translate([-0.6+2.54, 1.1, -1]) cube([1.2, 3.3, 2]);

    translate([-0.6-2.54, -1.1-3.3, -1]) cube([1.2, 3.3, 2]);
    translate([-0.6, -1.1-3.3, -1]) cube([1.2, 3.3, 2]);
    translate([-0.6+2.54, -1.1-3.3, -1]) cube([1.2, 3.3, 2]);

    translate([ 4.85, -2.6/2, -0.05]) cube([0.2, 2.6, 1.50]);
    mirror([1,0,0]) translate([ 4.85, -2.6/2, -0.05]) cube([0.2, 2.6, 1.50]);
  }

  translate([-4.4,-4.15, -0.6]) cylinder(r=0.4, h=0.6);
  translate([ 4.6, 4.15, -0.6]) cylinder(r=0.3, h=0.6);
}
