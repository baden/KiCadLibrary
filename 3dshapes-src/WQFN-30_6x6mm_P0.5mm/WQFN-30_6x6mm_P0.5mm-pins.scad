include <defines.scad>

module Pin() {
  for(i = [0 : ND-2]) {
    translate([(i - (ND-1)/2)*e, (ND-1)/2*e, A1/2])
    cube([L, b, A1], center = true);
  }
}

h = 0.4;

color("Gold")
scale(scale) {
  Pin();
  rotate([0, 0, 90]) Pin();
  rotate([0, 0, 180]) Pin();
  rotate([0, 0, 270]) Pin();

  /*translate([0, 0, A1/2])
  cube([D2, E2, A1], center = true);*/

  linear_extrude(height = A1, center = false)
    polygon([
      [-D2/2, -E2/2],
      [ D2/2, -E2/2],
      [ D2/2,  E2/2],
      [-D2/2+h,E2/2],
      [-D2/2,  E2/2-h]
    ]);


}
