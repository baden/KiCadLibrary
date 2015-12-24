include <defines.scad>

// Pcb

module Pcb() {
  color("Green")
  translate([-w/2, -h/2])
    cube(size = [w, h, pcb_t], center = false);

}

// Pin drill

module PadPin(o_x, o_y, d_x, d_y, cnt) {
  color("Red")
  for(i = [0 : cnt-1]) {
    translate([o_x + i * d_x, o_y + i * d_y, -0.5])
      cylinder(h = 2, r = 0.30, $fn = pin_fragments);
  }
}

module PadDrills() {
    PadPin(-w/2, h/2 - 0.65, 0, -1.1, 12);
    PadPin( w/2, h/2 - 0.65, 0, -1.1, 12);
}

// Combine together

/*Pcb();*/
scale(scale)
difference() {
  union() {
    Pcb();
  }

	PadDrills();
}
