within StewartPlatform.Tests;

model Platform_test
  StewartPlatform.Components.Platform platform(fix_initPlatformAngularVel = true, fix_initPlatformOrientation = true, fix_initPlatformPos = true, fix_initPlatformVel = true, platform(D = 2), useGlobalParameters = false) annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner StewartPlatform.Components.GlobalParameters gp(rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence) annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
    Placement(visible = true, transformation(origin = {-78, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass4(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass3(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass6(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass5(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass2(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass1(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(pointMass1.frame_a, platform.frame_b[1]) annotation(
    Line(points = {{-40, 20}, {0, 20}, {0, 2}, {0, 2}}));
  connect(pointMass2.frame_a, platform.frame_b[2]) annotation(
    Line(points = {{-40, 40}, {0, 40}, {0, 2}, {0, 2}}, color = {95, 95, 95}));
  connect(pointMass3.frame_a, platform.frame_b[3]) annotation(
    Line(points = {{-40, 60}, {0, 60}, {0, 2}, {0, 2}}));
  connect(pointMass4.frame_a, platform.frame_b[4]) annotation(
    Line(points = {{40, 60}, {0, 60}, {0, 2}, {0, 2}}));
  connect(pointMass5.frame_a, platform.frame_b[5]) annotation(
    Line(points = {{40, 40}, {0, 40}, {0, 2}, {0, 2}}, color = {95, 95, 95}));
  connect(pointMass6.frame_a, platform.frame_b[6]) annotation(
    Line(points = {{40, 20}, {0, 20}, {0, 2}, {0, 2}}));
  connect(fixedFrame.frame_a, pointMass1.frame_a) annotation(
    Line(points = {{-60, 20}, {-40, 20}, {-40, 20}, {-40, 20}}));
end Platform_test;
