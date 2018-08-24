include <defines.scad>

l = 36;
w = 7.2;
h = 1.0;

module body(){
  translate([-w/2, -h/2, -l/2])
   cube([w, h, l], center=false);

}

scale(scale) color([0.8, 0.8, 0.8]) body();
