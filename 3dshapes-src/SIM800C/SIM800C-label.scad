
// example012.stl is Mblock.stl, (c) 2009 Will Langford
// licensed under the Creative Commons - GNU GPL license.
// http://www.thingiverse.com/thing:753

//import("sim800c.stl", convexity=3);

// PCB

include <defines.scad>

// Pin#1 marker

color("White")
  translate([-w/2 + 0.25,   h/2 - 2.25,  0.8])
    cube(size = [2.5, 2, 0.02], center = false);

// Label

color("White")
  translate([-12.9/2, -14.8/2, 2.3])
    cube(size = [12.9, 14.8, 0.02], center = false);
