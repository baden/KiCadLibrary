include <defines.scad>

font = "Liberation Sans";
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

f_x = -0.7;
f_y = 0.4;
f_dy = -0.4;
fscale = 0.03;
lab_h = 0.01;

// Label
scale(scale) color("White") rotate([0,0,-90]) {

    translate([f_x, f_y, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("263", font = font);
        }
    }
    translate([f_x, f_y+f_dy, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("8652FC", font = font);
        }
    }
    translate([f_x, f_y+2*f_dy, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("3WZR", font = font);
        }
    }

    translate([-0.75, -0.75, H]) {
        cylinder(r = 0.15, h = lab_h, $fn = 64);
    }

}
