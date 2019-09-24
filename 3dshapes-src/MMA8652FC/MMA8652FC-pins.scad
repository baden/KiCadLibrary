include <defines.scad>

p_w = 0.567;
p_h = 0.2;

p_co = 1.0 - 0.667 + p_w/2;

module Pin(x, y, z, r) {
color("Gold")
  rotate([0,0,r]) translate([x-0.12,y,z+0.05])
  union() {
    /*Упрощенный вид ног*/
    cube(size = [p_w, p_h, Hf*3],center=true);
    /*Оригинальная форма*/
    /* translate([-0.04,0,0.0]) cube(size = [0.4, 0.3, Hf], center=true);
    translate([ 0.14,0,0.0]) cylinder(r = p_h/2, h = Hf, $fn = 64, center=true);
    translate([-0.23,0.1,0.0]) cylinder(r = 0.05, h = Hf, $fn = 64, center=true);
    translate([-0.23,-0.1,0.0]) cylinder(r = 0.05, h = Hf, $fn = 64, center=true);
    translate([-0.23,0,0]) cube(size = [0.1, 0.2, Hf],center=true); */

    /* translate([-0.39,0,0.15]) cube(size = [0.015, p_h, 0.1],center=true); // На боковине */
  }
}

scale(scale)
  translate([0,0,Hf/2])
  union() {
    Pin(-p_co, 0.8, 0, 0); // #1
    Pin(-p_co, 0.4, 0, 0); // #2
    Pin(-p_co, 0.0, 0, 0); // #3
    Pin(-p_co,-0.4, 0, 0); // #4
    Pin(-p_co,-0.8, 0, 0); // #5

    Pin(-p_co, 0.8, 0, 180); // #6
    Pin(-p_co, 0.4, 0, 180); // #7
    Pin(-p_co, 0.0, 0, 180); // #8
    Pin(-p_co,-0.4, 0, 180); // #9
    Pin(-p_co,-0.8, 0, 180); // #10

  };
