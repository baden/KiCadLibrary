include <defines.scad>

b = 2;
s_h = 0.01;

scale(scale) color([0.85,0.85,0.85]) {

  translate([-L/2 + b, -W/2 + b, H]) {
    cube(size=[L-2*b, W-2*b, 0.01], center=false);
  }
}
