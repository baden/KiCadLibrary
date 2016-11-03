include <defines.scad>

Eh = 0.05;

// Label
scale(scale) color("Blue") translate([0, Hb/2 - H - Eh/2, 0.6/2]) rotate([90,0,0]){

  translate([1.65/2 - 0.70, 0, 0]) cube([0.2, 0.2, Eh], center=true);
}
