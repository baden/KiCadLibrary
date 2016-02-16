include <defines.scad>


scale(scale)
  color([0.15,0.15,0.15])
    union(){
      translate([-A/2+D, -B/2, C-pt]) cube([lab_mark, B, pt]);
        translate([-A/2+pt, -B/2, pt]) cube([A-2*pt, B, C-pt-pt]);
    }
