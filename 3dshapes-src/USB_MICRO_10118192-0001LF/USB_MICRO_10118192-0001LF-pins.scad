include <defines.scad>


Pin_w = 0.24;
Pin_h = 1.60;
Pin_u = 0.2;

// Смещение края вывода относительно оси
Pin_edge = 5.10 - 2.15;

module Pin() {
  translate([-Pin_w/2, Pin_edge-Pin_h, 0]) cube([Pin_w, Pin_h, Pin_u], center=false);

}

// Pins
scale(scale) color("Silver") {
  translate([-1.30, 0, 0]) Pin();
  translate([-0.65, 0, 0]) Pin();
  Pin();
  translate([0.65, 0, 0]) Pin();
  translate([1.30, 0, 0]) Pin();

}
