include <defines.scad>

scale(scale)
  translate([0,0,0])
  union() {
    translate([0,-1.35, 0]) cube([0.5, 0.8, Hf], center = true);
    translate([0, 1.35, 0]) cube([0.5, 0.8, Hf], center = true);

    translate([ 1.9, 0, 0]) cube([1.2, 0.5, Hf], center = true);
    translate([-1.9, 0, 0]) cube([1.2, 0.5, Hf], center = true);

  }
