within StewartPlatform.Tests;

model SpindleDrive_test
  Modelica.Blocks.Sources.Sine sine(amplitude = 1, f = 1) annotation(
    Placement(visible = true, transformation(origin = {-62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(n = {0, 0, 1}, useAxisFlange = true, v(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {10, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
    Placement(visible = true, transformation(origin = {-22, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1) annotation(
    Placement(visible = true, transformation(origin = {38, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position annotation(
    Placement(visible = true, transformation(origin = {-28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.SpindleDrive spindleDrive(spindlePitch = 1000 * 2 * 3.14)  annotation(
    Placement(visible = true, transformation(origin = {8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-12, -36}, {0, -36}}));
  connect(prismatic.frame_b, pointMass.frame_a) annotation(
    Line(points = {{20, -36}, {38, -36}}));
  connect(position.phi_ref, sine.y) annotation(
    Line(points = {{-40, 0}, {-51, 0}}, color = {0, 0, 127}));
  connect(spindleDrive.flangeT, prismatic.axis) annotation(
    Line(points = {{18, 0}, {18, -30}}, color = {0, 127, 0}));
  connect(position.flange, spindleDrive.flangeR) annotation(
    Line(points = {{-18, 0}, {-2, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end SpindleDrive_test;
