within StewartPlatform.Scenarios;

model IdealStewartPlatform_Scenario1
  extends StewartPlatform.Icons.Scenario; // Icon

  inner StewartPlatform.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-78, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.Base base annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, -48}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.IdealSixLegs idealSixLegs(ila_initialLengthFixed = fill(true, 6), ila_initialVelFixed = fill(true, 6), ila_stateSelect = fill(StateSelect.always, 6), uj_stateSelect = fill(StateSelect.never, 6)) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, -4}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.Platform platform(fixInitOrientation = false, fixInitPosition = false, useGlobalParameters = true) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const[6](each k = 1.4) annotation(
    Placement(visible = true, transformation(origin = {-62, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor annotation(
    Placement(visible = true, transformation(origin = {50, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine[6](each amplitude = 0.2, each offset = 1.47333, each startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-62, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(platform.frame_b, idealSixLegs.frame_platform) annotation(
    Line(points = {{0, 26}, {0, 26}, {0, 16}, {0, 16}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base.frame_b, idealSixLegs.frame_base) annotation(
    Line(points = {{0, -34}, {0, -34}, {0, -24}, {0, -24}}, color = {95, 95, 95}, thickness = 0.5));
  connect(absoluteSensor.frame_a, platform.frame_a) annotation(
    Line(points = {{40, 64}, {0, 64}, {0, 54}, {0, 54}}));
  connect(sine.y, idealSixLegs.lengthRef) annotation(
    Line(points = {{-50, -4}, {-26, -4}, {-26, -4}, {-24, -4}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end IdealStewartPlatform_Scenario1;
