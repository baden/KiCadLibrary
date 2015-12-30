include <defines.scad>

scale(scale) color("Grey")
union() {
// Base

translate([-L/2, -W/2, 0])
  linear_extrude(height = 0.75, center = false)
    polygon([[0,0.6],[0,5.4],[1.5,5.4],[1.5,6],[4.5,6],[4.5,5.4],[6,5.4],[6,0.6],[4.5,0.6],[4.5,0],[1.5,0],[1.5,0.6]]);

// Body
/*translate([-L/2, -W/2, H-0.75])*/
    cylinder(r = 2.5, h = H, $fn = 64);

// Head
translate([-L/2, -W/2, H-0.75])
  linear_extrude(height = 0.75, center = false)
    polygon([[0,1],[0,5],[1,6],[5,6],[6,5],[6,1],[5,0],[1,0]]);

}
