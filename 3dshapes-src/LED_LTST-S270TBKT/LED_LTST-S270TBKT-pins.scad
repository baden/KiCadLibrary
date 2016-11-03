include <defines.scad>

module Pin()
{
  linear_extrude(height = 0.60, center = false)
    polygon([
      [ Wb/2 - 0.33,  Hb/2],
      [ Wb/2 - 0.33,  Hb/2 + Ph],
      [ Wb/2 + Ph,  Hb/2 + Ph],
      [ Wb/2 + Ph, -Hb/2 - Ph],
      [ Wb/2 - 0.18, -Hb/2 - Ph],
      [ Wb/2 - 0.18, -Hb/2],
      [ Wb/2, -Hb/2],
      [ Wb/2,  Hb/2]
    ]);
}

Ph = 0.05;


scale(scale) color("Gold") {
  Pin();
  mirror([1, 0, 0]) Pin();

}
