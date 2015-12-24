
// example012.stl is Mblock.stl, (c) 2009 Will Langford
// licensed under the Creative Commons - GNU GPL license.
// http://www.thingiverse.com/thing:753

//import("sim800c.stl", convexity=3);

// PCB

include <defines.scad>

color("Red")
  scale(scale)
  translate([-12.9/2 + 1,  14.8/2 - 1, 2.32])
    cylinder(r = 0.5, h = 0.02, $fn = 16);
