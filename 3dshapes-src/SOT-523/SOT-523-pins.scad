include <defines.scad>

/*up = A2 / 2 - M/2 + A1;*/
dl = 0.05;

of = (C - B)/2;

module Pin() {
  rotate([90, 0, -90])
  linear_extrude(height = A, center = true)
    polygon([
      [0.0,    0.0],
      [0.0,    M],
      [of-M-dl, M],
      [of-M,    M+dl],
      [of-M,    N+M-dl*2],
      [of-M+dl*2,   N+M],
      [of, N+M],
      /*[L, N],*/
      /*[L,    N],*/
      [of,   dl*2],
      [of-dl*2,   0.0]
    ]);
}


scale(scale) color("Silver") {
  /*translate([0, C/2, 0]) cube([0.1,0.1,0.1], center=true);*/
  translate([0, C/2, 0]) Pin();
  translate([-G/2, -C/2, 0]) rotate([0,0,180]) Pin();
  translate([ G/2, -C/2, 0]) rotate([0,0,180]) Pin();
}
