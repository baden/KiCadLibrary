include <defines.scad>

font = "Liberation Sans";
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

lab_h = 0.01;

/*$fn = 64;*/

// Label
scale(scale) color("Gray")  {

    translate([0, 0, A]) {
      linear_extrude(height = lab_h, center=false)
      scale(0.06)
      text("HUC7", font = font, valign="center", halign="center");
    }

}
