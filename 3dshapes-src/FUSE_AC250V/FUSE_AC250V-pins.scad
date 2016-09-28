include <defines.scad>

scale(scale) color("Silver") {
  translate([12/2-2.7/2, 0, 4.5/2]) cube([2.7, 4.5, 4.5], center=true);
  mirror([1,0,0])
  translate([12/2-2.7/2, 0, 4.5/2]) cube([2.7, 4.5, 4.5], center=true);
}
