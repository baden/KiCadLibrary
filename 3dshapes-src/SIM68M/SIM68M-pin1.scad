
// example012.stl is Mblock.stl, (c) 2009 Will Langford
// licensed under the Creative Commons - GNU GPL license.
// http://www.thingiverse.com/thing:753

//import("sim800c.stl", convexity=3);

// PCB

include <defines.scad>

color("Red")
  scale(scale)
  translate([-w/2 + 2.5,  h/2 - 2.0, t+0.02])
    cylinder(r = 0.5, h = 0.02, $fn = 16);
