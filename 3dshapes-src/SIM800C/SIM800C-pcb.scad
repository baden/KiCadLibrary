
// example012.stl is Mblock.stl, (c) 2009 Will Langford
// licensed under the Creative Commons - GNU GPL license.
// http://www.thingiverse.com/thing:753

//import("sim800c.stl", convexity=3);

include <defines.scad>


// Pcb

module Pcb() {
  color("Green")
  translate([-w/2, -h/2])
    cube(size = [w, h, 0.8], center = false);

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
    PadPin(-w/2 + 3.45,  h/2, 1.1, 0, 9);
    PadPin(-w/2 + 3.45, -h/2, 1.1, 0, 9);

    PadPin(-w/2, h/2 - 2.75, 0, -1.1, 12);
    PadPin( w/2, h/2 - 2.75, 0, -1.1, 12);
}

// Combine together

/*Pcb();*/
difference() {
  union() {
    Pcb();
  }

	PadDrills();
}
