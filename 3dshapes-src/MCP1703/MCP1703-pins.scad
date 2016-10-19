include <defines.scad>

up = A2 / 2 - c/2 + A1;
dl = 0.05;

module Pin() {
  rotate([90, 0, -90])
  linear_extrude(height = b, center = true)
    polygon([
      [0.0, 0.0],
      [0.0,   c],
      [L-c-dl,   c],
      [L-c,   c+dl],
      [L-c,   up+c-dl*2],
      [L-c+dl*2,   up+c],
      [(E-E1)/2, up+c],
      [(E-E1)/2, up],
      [L,    up],
      [L,   dl*2],
      [L-dl*2,   0.0]
    ]);
}


scale(scale) color("Silver") {
  translate([0, E/2, 0]) Pin();
  translate([-e1/2, -E/2, 0]) rotate([0,0,180]) Pin();
  translate([ e1/2, -E/2, 0]) rotate([0,0,180]) Pin();
}
