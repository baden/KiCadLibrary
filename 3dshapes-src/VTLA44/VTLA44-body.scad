include <defines.scad>

scale(scale)
  color([0.15,0.15,0.15])
    translate([0, 0, (A - A1) / 2 + A1])
      cube([D, E, A - A1], center = true);
