include <defines.scad>

module Pin()
{
  difference() {
    translate([-A/2, -B/2-plw, 0]) cube([D, B+2*plw, C]);
    translate([-A/2+pt, -B/2-0.1, pt]) cube([D+0.2, B+0.2, C-pt-pt]);
  }
}

color("White") scale(scale) Pin();
color("White") scale(scale) mirror([1,0,0]) Pin();
