include <defines.scad>

/*font = "Liberation Sans";*/
font = "DejaVu";
/*font = "Abyssinica SIL";*/

f_x = -1.1;
f_y = 0.6;
f_dy = -0.6;
fscale = 0.04;
lab_h = 0.01;

// Label
color("White") translate([0, 0, A]) rotate([0,0,0]) {

  /* translate([0,  0.5, 0]) scale([fscale, fscale, 1]) {
    linear_extrude(height=lab_h, center=false) {
      text("LM76003", font=font, valign="center", halign="center", $fn=2);
    }
  } */

  /* translate([0, -0.5, 0]) scale([fscale, fscale, 1]) {
    linear_extrude(height=lab_h, center=false) {
      text("Texas Instruments", font=font, valign="center", halign="center", $fn=8);
    }
  } */

  translate([-1.4, 2.3, 0]) {
    cylinder(r = 0.15, h = lab_h, $fn = 12);
  }

}
