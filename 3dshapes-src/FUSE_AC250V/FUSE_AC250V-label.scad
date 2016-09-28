include <defines.scad>

/*font = "Liberation Sans";*/
/*font = "Analecta";*/
/*font = "Noto Color Emoji";*/
/*font = "OpenSymbol";*/
font = "Ubuntu";
/*font = "DejaVu Sans Mono";*/
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

H = 4.25;

f_x = -2.6;
f_y = 0.3;
f_dy = -1.3;
fscale = 0.08;
lab_h = 0.01;

// Label
scale(scale) color("Black") rotate([0,0,0]) {

    translate([f_x + 1, f_y, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("F FIAL", font = font);
            translate([-2,-2,0]) text("L", font = font);
        }
    }
    translate([f_x, f_y+f_dy, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("AC250V  U", font = font);
        }
    }

    /*translate([-0.95, -0.95, H]) {
        cylinder(r = 0.15, h = lab_h, $fn = 64);
    }*/

}
