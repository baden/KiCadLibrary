include <defines.scad>

scale(scale)
  color([1.0, 0.6, 0.0])
    translate([0, 0, (H - Hf)/2]) {
      translate([0,-0.45, (H - Hf)/2 - 0.22]) cube([1.0, 1.1, 0.1], center = true);
    }
