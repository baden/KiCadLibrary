include <defines.scad>

scale(scale) color("Silver") {
  translate([0, 0, 0.75/2]) cube([5.1, 5.1, 0.75], center=true);
  translate([0, 0, 0.5+0.5/2]) cylinder(d=4, h=0.5, center=true);
  /*translate([0, 0, 1.75]) cube([4.4, 2.6, 0.5], center=true);*/
}
