within DeltaRobot.Tests;

model Disc_test "Test of model 'Disc'"
  inner Modelica.Mechanics.MultiBody.World world(defaultBodyDiameter = 0.02, n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  DeltaRobot.Components.Disc disc(direction = DeltaRobot.Types.Units.Direction.up, discParameters(D = 0.5, beta = from_deg(10)))  annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass1(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass2(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass3(m = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame frameJoint1(color_x = {255, 0, 0}, length = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-60, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame frameJoint2(color_x = {255, 0, 0}, length = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame frameJoint3(color_x = {255, 0, 0}, length = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(disc.frame_a, world.frame_b) annotation(
    Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}));
  connect(disc.frame_b[1], pointMass1.frame_a) annotation(
    Line(points = {{0, 20}, {-30, 20}, {-30, 30}, {-30, 30}}, color = {95, 95, 95}));
  connect(disc.frame_b[2], pointMass2.frame_a) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, 50}, {0, 50}}, color = {95, 95, 95}));
  connect(disc.frame_b[3], pointMass3.frame_a) annotation(
    Line(points = {{0, 20}, {30, 20}, {30, 30}, {30, 30}}, color = {95, 95, 95}));
  connect(pointMass1.frame_a, frameJoint1.frame_a) annotation(
    Line(points = {{-30, 30}, {-50, 30}, {-50, 30}, {-50, 30}}, color = {95, 95, 95}));
  connect(pointMass2.frame_a, frameJoint2.frame_a) annotation(
    Line(points = {{0, 50}, {0, 50}, {0, 70}, {10, 70}, {10, 70}}, color = {95, 95, 95}));
  connect(pointMass3.frame_a, frameJoint3.frame_a) annotation(
    Line(points = {{30, 30}, {50, 30}, {50, 30}, {50, 30}}));
end Disc_test;
