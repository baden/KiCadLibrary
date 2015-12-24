include <defines.scad>

lw = w - 3.0;
lh = h - 2.0;

/*color("White")
  translate([-w/2 + 0.25,   h/2 - 2.25,  0.8])
    cube(size = [2.5, 2, 0.02], center = false);*/

// Label

color("White")
  scale(scale)
  translate([-lw/2, -lh/2, t])
    cube(size = [lw, lh, 0.02], center = false);
