include <defines.scad>

an = 0.15;

/*module Label() {
  translate([0, 0, A-lab_h]) {
    linear_extrude(height = lab_h*2, center=false)
    scale(0.06)
    text("HUC7", font = font, valign="center", halign="center");
  }
}*/

module Body() {
  translate([0, 0, J]) hull() {
    translate([0, 0, K/2]) cube([H-an, B-an, K], center=true);
    translate([0, 0, N]) cube([H, B, an], center=true);
  }
  /*translate([0, 0, A1]) {
    hull(){
      translate([0, 0, A2/2]) cube([D, E1, c], center=true);
      translate([0, 0, A2/2]) cube([D-an, E1-an, A2], center=true);
    }
  }*/
}

scale(scale)
color([0.25,0.25,0.25]) {
  Body();
}
