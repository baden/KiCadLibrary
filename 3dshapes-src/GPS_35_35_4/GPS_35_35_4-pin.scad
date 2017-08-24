include <defines.scad>

top_h = 0.4;  // Возвышение над корпусом

scale(scale) color([0.9,0.9,0.9]) {
  translate([pin_ox, -pin_oy, H]) cylinder(r1=2.2, r2=1.9, h=top_h, center=false);
  translate([pin_ox, -pin_oy, -pin_h]) cylinder(r=pin_d/2, h=pin_h, center=false, $fn=16);
}
