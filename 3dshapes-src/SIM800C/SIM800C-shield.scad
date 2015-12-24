
// example012.stl is Mblock.stl, (c) 2009 Will Langford
// licensed under the Creative Commons - GNU GPL license.
// http://www.thingiverse.com/thing:753

//import("sim800c.stl", convexity=3);

// PCB

include <defines.scad>

// SHIELD

color("Silver")
  translate([-13.9/2, -15.8/2, 0.8])
    cube(size = [13.9, 15.8, 1.5], center = false);
