include <defines.scad>

scale(scale)
  color([0.0,0.6,0.0])
    translate([-A/2+D+lab_mark, -B/2, C-pt]) cube([A-D-D-lab_mark, B, pt]);
