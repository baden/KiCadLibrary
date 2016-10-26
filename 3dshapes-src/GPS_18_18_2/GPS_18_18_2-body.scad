include <defines.scad>

c_r = c_d / 2;

tb_chamfer = 0.2;
tb_chamfer_of = 0.2;

module corner() {
  translate([-L/2 + c_r/2, -W/2 + c_r/2, tb_chamfer]) cylinder(r=c_r/2, h=H-2*tb_chamfer, center=false);
}

module corner_top() {
  translate([-L/2 + c_r/2, -W/2 + c_r/2, H - tb_chamfer]) cylinder(r1=c_r/2-tb_chamfer_of, r2=c_r/2-tb_chamfer_of-tb_chamfer, h=tb_chamfer, center=false);
}

module corner_bot() {
  translate([-L/2 + c_r/2, -W/2 + c_r/2, 0]) cylinder(r2=c_r/2-tb_chamfer_of, r1=c_r/2-tb_chamfer_of-tb_chamfer, h=tb_chamfer, center=false);
}

module body(){
  hull() {
    corner();
    mirror([1,0,0]) corner();
    mirror([0,1,0]) corner();
    mirror([1,1,0]) corner();
  }

  hull() {
    corner_top();
    mirror([1,0,0]) corner_top();
    mirror([0,1,0]) corner_top();
    mirror([1,1,0]) corner_top();
  }

  hull() {
    corner_bot();
    mirror([1,0,0]) corner_bot();
    mirror([0,1,0]) corner_bot();
    mirror([1,1,0]) corner_bot();
  }


}

/*scale(scale) color("Tan Yellow") body();*/
/*scale(scale) color([197/255,173/255,135/255]) body(); // Tan Yellow  */
/*scale(scale) color("Pale silver") body();*/
scale(scale) color([0.83, 0.77, 0.75]) body();
