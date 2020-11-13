within StewartPlatform.Tests;

model Base_test
  inner StewartPlatform.Components.GlobalParameters gp(angles_base = {10, 0, 0}, base(D = 2, alpha = pi / 4), basePos = {-1, -1, 0}, rotationType_base = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence)  annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {-78, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.Base base(base(D = 0.9), basePos = {0, 1, 1}, useGlobalParameters = false)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass3(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass1(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass2(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass4(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass6(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass5(m = 1, sphereColor = {255, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(pointMass1.frame_a, base.frame_b[1]) annotation(
    Line(points = {{-40, 20}, {0, 20}, {0, 8}, {0, 8}}, color = {95, 95, 95}));
  connect(pointMass2.frame_a, base.frame_b[2]) annotation(
    Line(points = {{-40, 40}, {0, 40}, {0, 8}, {0, 8}}));
  connect(pointMass3.frame_a, base.frame_b[3]) annotation(
    Line(points = {{-40, 60}, {0, 60}, {0, 8}, {0, 8}}));
  connect(pointMass4.frame_a, base.frame_b[4]) annotation(
    Line(points = {{40, 60}, {0, 60}, {0, 8}, {0, 8}}, color = {95, 95, 95}));
  connect(pointMass5.frame_a, base.frame_b[5]) annotation(
    Line(points = {{40, 40}, {0, 40}, {0, 8}, {0, 8}}, color = {95, 95, 95}));
  connect(pointMass6.frame_a, base.frame_b[6]) annotation(
    Line(points = {{40, 20}, {0, 20}, {0, 8}, {0, 8}}));
  connect(fixedFrame.frame_a, pointMass1.frame_a) annotation(
    Line(points = {{-60, 20}, {-40, 20}, {-40, 20}, {-40, 20}}));
end Base_test;
