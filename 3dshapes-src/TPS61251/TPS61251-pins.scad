include <defines.scad>

p_w = 0.25;
p_h = 0.3;

p_co = 1.55 - 3*p_h/2 + 0.02;

module Pin(x, y, z, r) {
color("Gold")
  rotate([0,0,r]) translate([x,y,z])
  union() {
    translate([0.25, 0, 0.1]) cube(size = [p_h, p_w, 0.21],center=true); // На боковине
  }
}

scale(scale)
  union() {
    Pin(-p_co, 0.75, 0, 0); // #1
    Pin(-p_co, 0.25, 0, 0); // #2
    Pin(-p_co,-0.25, 0, 0); // #2
    Pin(-p_co,-0.75, 0, 0); // #3

    Pin(-p_co, 0.75, 0, 180); // #4
    Pin(-p_co, 0.25, 0, 180); // #4
    Pin(-p_co,-0.25, 0, 180); // #5
    Pin(-p_co,-0.75, 0, 180); // #6


  };
