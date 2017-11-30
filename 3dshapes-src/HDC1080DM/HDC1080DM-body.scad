include <defines.scad>

ox = 1.1/2;
oy = 1.2/2;

scale(scale)
  color([0.15,0.15,0.15])
    translate([0, 0, (H - Hf)/2]) {
      difference() {
        cube([L, W, H - Hf], center = true);
        /*%translate([0.45, 0, (H - Hf)/2]) cube([1.2, 1.3, 0.44], center = true);*/
        translate([0.0,-0.45, (H - Hf)/2]) {
          hull(){
            translate([ ox, oy, 0]) cylinder(r1=0.1, r2=0.6, h=0.44, $fn=16, center=true);
            translate([-ox, oy, 0]) cylinder(r1=0.1, r2=0.6, h=0.44, $fn=16, center=true);
            translate([ ox,-oy, 0]) cylinder(r1=0.1, r2=0.6, h=0.44, $fn=16, center=true);
            translate([-ox,-oy, 0]) cylinder(r1=0.1, r2=0.6, h=0.44, $fn=16, center=true);
          }
        }
      }

        /*%translate([0.45, 0, (H - Hf)/2 - 0.44]) square(size=[1.2, 1.3], center=true);*/

    }
