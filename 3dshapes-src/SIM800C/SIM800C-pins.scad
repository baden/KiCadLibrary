
// example012.stl is Mblock.stl, (c) 2009 Will Langford
// licensed under the Creative Commons - GNU GPL license.
// http://www.thingiverse.com/thing:753

//import("sim800c.stl", convexity=3);

// PCB

include <defines.scad>


// Pin pad

module PinPads() {
  color("Gold")
  for(i = [0 : 11]) {
    translate([-w/2-0.02, h/2 - 2.75 + 0.3 - i * 1.1, -0.02])
      cube(size = [0.5, 0.6, 0.84]);
    translate([ w/2+0.02-0.5, h/2 - 2.75 + 0.3 - i * 1.1, -0.02])
      cube(size = [0.5, 0.6, 0.84]);
  }
  for(i = [0 : 8]) {
    translate([-w/2+3.45-0.3 + i * 1.1,  h/2 + 0.02 - 0.5, -0.02])
      cube(size = [0.6, 0.5, 0.84]);
    translate([-w/2+3.45-0.3 + i * 1.1, -h/2 - 0.02, -0.02])
      cube(size = [0.6, 0.5, 0.84]);
  }
}

//PinPad(-w/2-0.02, h/2 - 2.75 - 0.3);

// Pin drill

module Pin(o_x, o_y, d_x, d_y, cnt) {
  color("Gold")
  for(i = [0 : cnt-1]) {
    translate([o_x + i * d_x, o_y + i * d_y, -0.5])
      cylinder(h = 2, r = 0.25, $fn = pin_fragments);
  }
}

module PinDrills() {
    Pin(-w/2 + 3.45,  h/2, 1.1, 0, 9);
    Pin(-w/2 + 3.45, -h/2, 1.1, 0, 9);

    Pin(-w/2, h/2 - 2.75, 0, -1.1, 12);
    Pin( w/2, h/2 - 2.75, 0, -1.1, 12);
}

// Combine together

difference() {
  union() {

      for(i = [0 : 11]) {
        translate([-w/2-0.02, h/2 - 2.75 - 0.3 - i * 1.1, -0.02])
          cube(size = [0.5, 0.6, 0.84]);
        translate([ w/2+0.02-0.5, h/2 - 2.75 - 0.3 - i * 1.1, -0.02])
          cube(size = [0.5, 0.6, 0.84]);
      }
      for(i = [0 : 8]) {
        translate([-w/2+3.45-0.3 + i * 1.1,  h/2 + 0.02 - 0.5, -0.02])
          cube(size = [0.6, 0.5, 0.84]);
        translate([-w/2+3.45-0.3 + i * 1.1, -h/2 - 0.02, -0.02])
          cube(size = [0.6, 0.5, 0.84]);
      }

  }
  PinDrills();
}
