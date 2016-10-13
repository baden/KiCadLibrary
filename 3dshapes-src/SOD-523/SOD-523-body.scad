include <defines.scad>

fn1 = 8;
fn2 = 8;


R = 0.1;
R1 = 0.08;
R2 = 0.06;

o2 = -0.014;
k2 = 0.0047;

scale(scale)
color([0.25,0.25,0.25])
translate([0, 0, 0.01])
union() {

  /*translate([-E1 / 2, -D / 2, 0]) cube([E1, D, A]);*/

  hull(){
    translate([E1/2 - R, D/2 - R, 0]) cylinder(r1=R1, r2=R, h=c, center=false, $fn=fn1);
    translate([-E1/2 + R, D/2 - R, 0]) cylinder(r1=R1, r2=R, h=c, center=false, $fn=fn1);
    translate([E1/2 - R, -D/2 + R, 0]) cylinder(r1=R1, r2=R, h=c, center=false, $fn=fn1);
    translate([-E1/2 + R, -D/2 + R, 0]) cylinder(r1=R1, r2=R, h=c, center=false, $fn=fn1);
  }

  hull(){
    translate([E1/2 - R, D/2 - R, c]) cylinder(r1=R, r2=R2, h=A-c-R2, center=false, $fn=fn1);
    translate([-E1/2 + R, D/2 - R, c]) cylinder(r1=R, r2=R2, h=A-c-R2, center=false, $fn=fn1);
    translate([E1/2 - R, -D/2 + R, c]) cylinder(r1=R, r2=R2, h=A-c-R2, center=false, $fn=fn1);
    translate([-E1/2 + R, -D/2 + R, c]) cylinder(r1=R, r2=R2, h=A-c-R2, center=false, $fn=fn1);
  }

  translate([0,0,-0.01 + o2])
  hull(){
    translate([E1/2 - R, D/2 - R , A - R2]) sphere(r=R2+k2, $fn=fn2);
    translate([-E1/2 + R, D/2 - R , A - R2]) sphere(r=R2+k2, $fn=fn2);
    translate([E1/2 - R, -D/2 + R , A-R2]) sphere(r=R2+k2, $fn=fn2);
    translate([-E1/2 + R, -D/2 + R , A-R2]) sphere(r=R2+k2, $fn=fn2);
  }

}
