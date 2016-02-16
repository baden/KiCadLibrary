include <defines.scad>

font = "Liberation Sans";
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

fscale = 0.08;

// Label
scale(scale) color("White") rotate([0,0,0]) {
  translate([lab_mark/2, 0, C]) {
    scale([fscale,fscale*1.4,1])
    linear_extrude(height = 0.01, center=false) {
      text("FB", font = font, valign="center", halign="center");
    }
  }
}
