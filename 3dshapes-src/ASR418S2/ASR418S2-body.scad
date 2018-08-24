include <defines.scad>

scale(scale)
  color([0.15, 0.15, 0.15])
    translate([-L/2, -W/2, Hf])
      cube([L, W, H - Hf]);
