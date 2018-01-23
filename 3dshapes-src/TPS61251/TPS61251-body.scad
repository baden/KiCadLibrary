include <defines.scad>

ox = 1.1/2;
oy = 1.2/2;

scale(scale)
  color([0.15,0.15,0.15])
    translate([0, 0, (H - Hf)/2]) {
        cube([L, W, H - Hf], center = true);
    }
