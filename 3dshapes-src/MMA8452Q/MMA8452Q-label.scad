include <defines.scad>

font = "Liberation Sans";
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

f_x = -1.1;
f_y = 0.6;
f_dy = -0.6;
fscale = 0.05;
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
            text("8452", font = font);
        }
    }
    translate([f_x, f_y+2*f_dy, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=false) {
            text("3WZR", font = font);
        }
    }

    translate([-0.95, -0.95, H]) {
        cylinder(r = 0.15, h = lab_h, $fn = 64);
    }

}
