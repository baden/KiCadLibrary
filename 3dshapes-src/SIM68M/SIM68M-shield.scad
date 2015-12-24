
// example012.stl is Mblock.stl, (c) 2009 Will Langford
// licensed under the Creative Commons - GNU GPL license.
// http://www.thingiverse.com/thing:753

//import("sim800c.stl", convexity=3);

// PCB

include <defines.scad>

// SHIELD

sw = w - 2.0;
sh = h - 1.0;

color("Silver")
  scale(scale)
  translate([-sw/2, -sh/2, pcb_t])
    cube(size = [sw, sh, t - pcb_t], center = false);
