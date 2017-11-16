include <defines.scad>

p_w = 0.567;
p_h = 0.3;

p_co = 1.5 - 0.667 + p_w/2;

module Pin(x, y, z) {
color("Gold")
  translate([x,y,z])
  union() {
    sphere([-0,0,0], d=Hf, $fn=8);
  }
}

scale(scale)
  translate([0,0,Hf/2])
  union() {
    for(i = [0 : 3]) {
      for(j = [0 : 3]) {
        Pin(i*0.4-0.6, j*0.4-0.6, 0); // #1
      }
    }


  };
