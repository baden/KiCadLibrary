include <defines.scad>

d = 18.32;
b_h =  65.02;

module body(){
  rotate([90,0,0])
  translate([0,d/2,-b_h/2])
    cylinder(d = d, h = b_h);

}

scale(scale) color([0.8, 0.8, 0.8]) body();
