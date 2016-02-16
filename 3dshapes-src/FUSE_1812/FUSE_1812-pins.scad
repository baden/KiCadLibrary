include <defines.scad>

module Pin()
{
  union() {
    difference() {
      translate([-A/2, -B/2, 0]) cube([D, B, C]);
      translate([-A/2, 0, -1]) cylinder(r = E, h = C+2);
      translate([-A/2-0.1, -B/2-0.1, pt]) cube([D+0.2, B/2-E-pt+0.1, C-pt-pt]);
      mirror([0,1,0]) translate([-A/2-0.1, -B/2-0.1, pt]) cube([D+0.2, B/2-E-pt+0.1, C-pt-pt]);
      /*union() {
        translate([-A/2, -B/2, C-pt]) cube([D, B, pt]);
      }
      */
    }
    /*difference(){
      translate([-A/2, 0, 0]) cylinder(r = E+pt, h = C);
      translate([-A/2, 0, -1]) cylinder(r = E, h = C+2);
      translate([-A/2-D, -B/2, -1]) cube([D, B, C+2]);
    }*/
  }
}


module Pin1()
{
  union() {
    difference() {
      union() {
        translate([-A/2, -B/2, 0]) cube([D, B, pt]);
        translate([-A/2, -B/2, C-pt]) cube([D, B, pt]);
      }
      translate([-A/2, 0, -1]) cylinder(r = E+pt, h = C+2);
    }
    difference(){
      translate([-A/2, 0, 0]) cylinder(r = E+pt, h = C);
      translate([-A/2, 0, -1]) cylinder(r = E, h = C+2);
      translate([-A/2-D, -B/2, -1]) cube([D, B, C+2]);
    }
  }
}

module Pin2()
{
  difference(){
    translate([-A/2, -B/2, 0]) cube([D, B, C]);
    difference(){
      translate([-A/2, 0, pt]) cylinder(r = B, h = C-pt-pt);
      translate([-A/2, 0, pt/2]) cylinder(r = E+pt, h = C-pt);
    }
    translate([-A/2, 0, -1]) cylinder(r = E, h = C+2);
  }
}


color("White") scale(scale) Pin();
color("White") scale(scale) mirror([1,0,0]) Pin();
