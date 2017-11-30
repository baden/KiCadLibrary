include <defines.scad>

font = "Liberation Sans";
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

f_x = -0.8;
f_y = 1.5;
f_dy = -0.4;
fscale = 0.03;
lab_h = 0.01;

// Label
scale(scale) color("White") {

    /*translate([f_x, f_y+f_dy, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("Texas", font = font);
        }
    }
    translate([f_x, f_y+2*f_dy, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("Instruments", font = font);
        }
    }*/

    translate([-1.05, 1.05, H]) {
        cylinder(r = 0.15, h = lab_h, $fn = 64);
    }

}
