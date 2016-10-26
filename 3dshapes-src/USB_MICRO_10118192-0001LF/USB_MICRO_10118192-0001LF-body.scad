include <defines.scad>

// Толщина металла.
Wh = 0.3;

// Внутренний размер
Win = 6.9;
Hin = 1.85;

// Длина ровной части
L = 5.05;

// Смещение относительно оси координат
Loff = 2.15;

scale(scale) color("Gray") {
  /*cube([7.5, 5.05, 2.80], center = true);*/

  /*translate([0,0,-Loff])
  linear_extrude(height = L, center = false)
    polygon([
      [-Win/2, Hin/2],
      [ Win/2, Hin/2],
      [ Win/2, -Hin/2],
      [-Win/2, -Hin/2]
    ]);*/
  rotate([90, 0, 180])
  translate([-7.5/2, 0, -Loff])
  linear_extrude(height = L, center = false, convexity = 10)
    import (file = "cover-shape1.dxf");


  translate([-7.90/2, -0.9/2, 0]) cube([2.0, 0.9, 0.3], center=false);
  mirror([1,0,0]) translate([-7.90/2, -0.9/2, 0]) cube([2.0, 0.9, 0.3], center=false);

}
