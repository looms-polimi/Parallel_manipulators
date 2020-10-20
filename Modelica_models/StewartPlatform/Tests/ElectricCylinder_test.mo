within StewartPlatform.Tests;

model ElectricCylinder_test
  parameter Types.ElectricCylinderParameters electricCylinderParameters "Electric cylinder parameters";
  
  StewartPlatform.Components.ElectricCylinder electricCylinder(electricCylinderParameters(initialVelFixed = true))  annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Position position annotation(
    Placement(visible = true, transformation(origin = {-94, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio = 1 / electricCylinder.electricCylinderParameters.ratio) annotation(
    Placement(visible = true, transformation(origin = {-58, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = electricCylinderParameters.workingStroke / 2,f = 1, offset = electricCylinderParameters.minLength + electricCylinderParameters.workingStroke / 2) annotation(
    Placement(visible = true, transformation(origin = {-126, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear1(ratio = 1 / electricCylinder.spindleDrive.ratio) annotation(
    Placement(visible = true, transformation(origin = {-30, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, electricCylinder.frame_a) annotation(
    Line(points = {{-40, 0}, {-8, 0}, {-8, 0}, {-8, 0}}));
  connect(electricCylinder.frame_b, pointMass.frame_a) annotation(
    Line(points = {{12, 0}, {40, 0}, {40, 0}, {40, 0}}));
  connect(position.flange, idealGear.flange_a) annotation(
    Line(points = {{-84, 34}, {-68, 34}, {-68, 34}, {-68, 34}}));
  connect(sine.y, position.phi_ref) annotation(
    Line(points = {{-115, 34}, {-109, 34}, {-109, 34}, {-107, 34}}, color = {0, 0, 127}));
  connect(idealGear.flange_b, idealGear1.flange_a) annotation(
    Line(points = {{-48, 34}, {-40, 34}, {-40, 34}, {-40, 34}}));
  connect(idealGear1.flange_b, electricCylinder.flange_a) annotation(
    Line(points = {{-20, 34}, {-8, 34}, {-8, 8}, {-8, 8}, {-8, 6}}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
end ElectricCylinder_test;
