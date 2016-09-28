include <defines.scad>

w = 9.2;
h = 4.4;

p_h = 2.6;

scale(scale) color("Silver") {
  translate([-w/2, -h/2, 1.25]) cube([w, h, 0.15]);

  translate([ w/2, -3.2/2, 1.25]) cube([0.4, 3.2, 0.15]);

  translate([ 4.85, -p_h/2, 0.00]) cube([0.15, 0.4, 1.40]);
  translate([ 4.85,  p_h/2-0.4, 0.00]) cube([0.15, 0.4, 1.40]);

  translate([ 5.0, -p_h/2, 0.00]) cube([0.6, p_h, 0.15]);

  mirror([1,0,0]) {
    translate([ w/2, -3.2/2, 1.25]) cube([0.4, 3.2, 0.15]);
    translate([ 4.85, -p_h/2, 0.00]) cube([0.15, 0.4, 1.40]);
    translate([ 4.85,  p_h/2-0.4, 0.00]) cube([0.15, 0.4, 1.40]);
    translate([ 5.0, -p_h/2, 0.00]) cube([0.6, p_h, 0.15]);

  }


}
