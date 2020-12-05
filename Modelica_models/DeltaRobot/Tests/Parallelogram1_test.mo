within DeltaRobot.Tests;

model Parallelogram1_test
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DeltaRobot.Components.Parallelogram1 parallelogram1  annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(m = 1, r_0(each fixed = true, start = {0.7, 0, 0}), r_CM = {0.1, 0, 0}, v_0(each fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(world.frame_b, parallelogram1.frame_a) annotation(
    Line(points = {{0, 40}, {0, 40}, {0, 20}, {0, 20}}));
  connect(parallelogram1.frame_b, body.frame_a) annotation(
    Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}, color = {95, 95, 95}));
end Parallelogram1_test;
