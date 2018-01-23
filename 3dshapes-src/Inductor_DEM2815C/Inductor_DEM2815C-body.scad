include <defines.scad>

f1 = 0.7;
f2 = 0.3;

scale(scale) color("Grey")
union() {
// Base

/*translate([-L/2, -W/2, 0])*/
  /*cube([L, W, H]);*/
  linear_extrude(height = H, center = false)
    polygon([
      [-L/2,-W/2+f1],
      [-L/2+f1,-W/2],
      [ L/2-f1,-W/2],
      [ L/2,-W/2+f1],
      [ L/2, W/2-f2],
      [ L/2-f2, W/2],
      [-L/2+f2,W/2],
      [-L/2,W/2-f2]
    ]);

// Body
/*translate([-L/2, -W/2, H-0.75])*/
    /*cylinder(r = 2.5, h = H, $fn = 64);*/

// Head
/*translate([-L/2, -W/2, H-0.75])
  linear_extrude(height = 0.75, center = false)
    polygon([[0,1],[0,5],[1,6],[5,6],[6,5],[6,1],[5,0],[1,0]]);*/

}
