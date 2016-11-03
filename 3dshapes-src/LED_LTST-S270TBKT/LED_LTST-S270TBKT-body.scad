include <defines.scad>


scale(scale) color([0.8, 0.8, 0.8]) {

  linear_extrude(height = 0.60, center = false)
    polygon([
      [-Wb/2,  Hb/2],
      [ Wb/2,  Hb/2],
      [ Wb/2, -Hb/2],
      [ Wf/2, -Hb/2],
      [ Wf/2-Fo, Hb/2-H],
      [-Wf/2+Fo, Hb/2-H],
      [-Wf/2, -Hb/2],
      [-Wb/2, -Hb/2]
    ]);


  /*translate([-1.65/2, -0.68/2, 0]) cube([1.65, 0.68, 0.60], center=false);
  translate([-1.20/2, -1.15+0.68/2, 0]) cube([1.20, 1.15, 0.60], center=false);*/

}
