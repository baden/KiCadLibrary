include <defines.scad>

/*font = "Liberation Sans";*/
/*font = "DejaVu";*/
/*font = "Abyssinica SIL";*/

/*$fn = 64;*/

// Label
scale(scale) color("White")  {

    translate([-0.3, 0, A]) {
        /*cylinder(r = 0.12, h = 0.02);*/
        cube([0.1,0.4,0.02], center = true);
    }

}
