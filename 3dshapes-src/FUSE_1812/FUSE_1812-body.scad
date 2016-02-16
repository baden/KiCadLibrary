include <defines.scad>

plw = 0.02;

scale(scale)
  color([0.15,0.15,0.15])
    union(){
      translate([-A/2+D, -B/2, C-pt]) cube([lab_mark, B, pt]);
      difference() {
        translate([-A/2+plw, -B/2+plw, pt]) cube([A-2*plw, B-2*plw, C-pt-pt]);
        translate([-A/2, 0, -1]) cylinder(r = E+pt, h = C+2);
        translate([ A/2, 0, -1]) cylinder(r = E+pt, h = C+2);
      }
    }
