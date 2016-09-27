include <defines.scad>

pitch = 2.5;
p_w = 0.64;
p_h = 7.0;

module Pin(x, y) {
  translate([x - p_w/2, y - p_w/2, -3.4])
    cube(size = [p_w, p_w, p_h + 3.2], center = false);
}

// Pins
scale(scale) color("Silver") {
  Pin(-pitch*2, 0);
  Pin(-pitch*1, 0);
  Pin(       0, 0);
  Pin( pitch*1, 0);
  Pin( pitch*2, 0);
}
