include <defines.scad>

font = "Liberation Sans";
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

f_x = -1.65;
f_y = -0.2;
f_dy = -0.4;
fscale = 0.05;
lab_h = 0.01;

// Label
scale(scale) color("White") rotate([0,0,0]) {

    translate([f_x, f_y, H]) {
        scale([fscale,fscale,1])
        linear_extrude(height = lab_h, center=true) {
            text("ASR418S2", font = font);
        }
    }

}
