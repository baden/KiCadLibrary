include <defines.scad>

p_w = 0.6;
p_t = 0.2;

module Pin() {
  translate([-6.4/2, 3.7/2, 0])
  rotate([90,0,0])
  linear_extrude(height = p_w, center = true)
    polygon([
      [0.0, 0.0],
      [0.0, 0.2],
      [0.4, 0.2],
      [0.7, 0.5],
      [1.0, 0.5],
      [1.0, 0.3],
      [0.8, 0.3],
      [0.5, 0.0]
    ]);
}

scale(scale) color("Silver") {
  /*translate([3.0, -p_w/2, 0.00]) cube([1.0, p_w, p_t]);*/

  /*mirror([1,0,0])
    translate([3.0, -p_w/2, 0.00]) cube([1.0, p_w, p_t]);*/

  Pin();
  mirror([1,0,0]) Pin();
  mirror([0,1,0]) Pin();
  mirror([1,0,0]) mirror([0,1,0]) Pin();

  translate([6.4/2, 3.7/2, 0]) cube([0.1, 0.1, 0.1], center=true);
}
