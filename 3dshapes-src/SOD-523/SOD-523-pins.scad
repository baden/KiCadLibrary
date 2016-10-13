include <defines.scad>

/*module Pin(x, y, z, r) {

    translate([-0.39,0,0.15]) cube(size = [0.015, p_h, 0.1],center=true); // На боковине
}*/

scale(scale) color("Silver") {
  translate([E1/2 - L1, -b/2, 0])
    cube([(E - E1) / 2 + L1, b, c]);
  mirror([1,0,0])
  translate([E1/2 - L1, -b/2, 0])
    cube([(E - E1) / 2 + L1, b, c]);
}
