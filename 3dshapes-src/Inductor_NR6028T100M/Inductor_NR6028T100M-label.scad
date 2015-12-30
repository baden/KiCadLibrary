include <defines.scad>

/*font = "Liberation Sans";*/
/*font = "DejaVu";*/
font = "Abyssinica SIL";

// Label
scale(scale) color("White") {

    translate([-L/2.5, -W/20, H]) {
        scale(0.2)
        linear_extrude(height = 0.1, center=false) {
            text("100", font = font);
        }

    }
    translate([-L/3, -W/4, H]) {
        cube(size = [4, 1, 0.02], center = false);
    }

}
