include <defines.scad>

Lh = 0.05;

// Label
scale(scale) color("Green") translate([0, Hb/2 + Lh/2, 0.6/2]) rotate([90,0,0]){

  translate([-0.1, 0, 0]) cube([0.3, 0.6, Lh], center=true);
  translate([ 0.1, 0, 0]) cube([0.4, 0.3, Lh], center=true);
}
