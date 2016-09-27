include <defines.scad>

W = 5.75;
W_O = 2.35;
H = 7.0;

th = 0.7; // Walls

scale(scale) color("White") {

difference() {
// Base

  translate([-B/2, -W_O, 0])
    cube(size = [B, W, H], center = false);

  translate([-B/2 + th, -W_O + th, th])
    cube(size = [B - th*2, W - th*2, H], center = false);

    translate([-B/2-1 , -W_O + th, H-3.8])
      cube(size = [2, 1, 3.9], center = false);

    translate([ B/2-1 , -W_O + th, H-3.8])
      cube(size = [2, 1, 3.9], center = false);

    translate([ -5.3-1.5, -W_O - 1, H-4.0])
      cube(size = [1.5, 2, 4.1], center = false);

    translate([ 5.3, -W_O - 1, H-4.0])
      cube(size = [1.5, 2, 4.1], center = false);
}


}
