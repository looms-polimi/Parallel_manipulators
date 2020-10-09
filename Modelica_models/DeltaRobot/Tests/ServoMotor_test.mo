within DeltaRobot.Tests;

model ServoMotor_test "Test of model 'ServoMotor'"
  DeltaRobot.Components.ServoMotor servoMotor(sm_initType = Modelica.Blocks.Types.Init.InitialOutput)  annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Interfaces.RefToBus refToBus annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 10, offset = 1, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1, phi(displayUnit = "rad", fixed = true, start = 0), w(fixed = true, start = 0))  annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(refToBus.axisControlBus, servoMotor.axisControlBus) annotation(
    Line(points = {{-40, 0}, {-18, 0}, {-18, 0}, {-16, 0}}, color = {255, 204, 51}, thickness = 0.5));
  connect(ramp.y, refToBus.torqueRef) annotation(
    Line(points = {{-78, 0}, {-62, 0}, {-62, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(servoMotor.flange, inertia.flange_a) annotation(
    Line(points = {{0, 0}, {18, 0}, {18, 0}, {20, 0}}));
annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.01));
end ServoMotor_test;
