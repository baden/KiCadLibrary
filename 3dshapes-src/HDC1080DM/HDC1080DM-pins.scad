include <defines.scad>

p_w = 0.567;
p_h = 0.4;

p_co = 1.55 - 3*p_h/2 + 0.02;

module Pin(x, y, z, r) {
color("Gold")
  rotate([0,0,r]) translate([x,y,z])
  union() {
    /*Упрощенный вид ног*/
    /*cube(size = [p_w, p_h, Hf],center=true);*/
    /*Оригинальная форма*/
    /*translate([-0.04,0,0.0]) cube(size = [0.4, 0.3, Hf], center=true);
    translate([ 0.14,0,0.0]) cylinder(r = p_h/2, h = Hf, $fn = 64, center=true);
    translate([-0.23,0.1,0.0]) cylinder(r = 0.05, h = Hf, $fn = 64, center=true);
    translate([-0.23,-0.1,0.0]) cylinder(r = 0.05, h = Hf, $fn = 64, center=true);
    translate([-0.23,0,0]) cube(size = [0.1, 0.2, Hf],center=true);*/

    translate([-0.39, 0, 0.1]) cube(size = [p_h, p_h, 0.2],center=true); // На боковине
  }
}

scale(scale)
  union() {
    Pin(-p_co, 1.0, 0, 0); // #1
    Pin(-p_co, 0.0, 0, 0); // #2
    Pin(-p_co,-1.0, 0, 0); // #3

    /*Pin(-p_co, 0.5, 0, 90); // #6
    Pin(-p_co, 0.0, 0, 90); // #7
    Pin(-p_co,-0.5, 0, 90); // #8*/

    Pin(-p_co, 1.0, 0, 180); // #4
    Pin(-p_co, 0.0, 0, 180); // #5
    Pin(-p_co,-1.0, 0, 180); // #6

    /*Pin(-p_co, 0.5, 0, 270); // #14
    Pin(-p_co, 0.0, 0, 270); // #15
    Pin(-p_co,-0.5, 0, 270); // #16*/

  };
