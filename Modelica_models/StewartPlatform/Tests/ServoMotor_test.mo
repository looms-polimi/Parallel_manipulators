within StewartPlatform.Tests;

model ServoMotor_test
  Components.ServoMotor servoMotor annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(extent = {{-68, -10}, {-48, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step1(height = -5, startTime = 15) annotation(
    Placement(visible = true, transformation(extent = {{-114, -24}, {-94, -4}}, rotation = 0)));
  Modelica.Blocks.Sources.Step step(height = 3, startTime = 1) annotation(
    Placement(visible = true, transformation(extent = {{-114, 6}, {-94, 26}}, rotation = 0)));
  StewartPlatform.Interfaces.RefToBus refToBus annotation(
    Placement(visible = true, transformation(extent = {{-40, -10}, {-20, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.TorqueStep torqueStep(offsetTorque = 0, startTime = 45, stepTorque = 5) annotation(
    Placement(visible = true, transformation(extent = {{84, -10}, {64, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.1, phi(fixed = true), w(fixed = true)) annotation(
    Placement(visible = true, transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
equation
  connect(add.y, refToBus.torqueRef) annotation(
    Line(points = {{-47, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(step1.y, add.u2) annotation(
    Line(points = {{-93, -14}, {-70, -14}, {-70, -6}}, color = {0, 0, 127}));
  connect(step.y, add.u1) annotation(
    Line(points = {{-93, 16}, {-70, 16}, {-70, 6}}, color = {0, 0, 127}));
  connect(servoMotor.axisControlBus, refToBus.axisControlBus) annotation(
    Line(points = {{-20, 0}, {-8, 0}, {-8, 0}, {-8, 0}}, color = {255, 204, 51}, thickness = 0.5));
  connect(inertia.flange_a, servoMotor.flange) annotation(
    Line(points = {{20, 0}, {8, 0}, {8, 0}, {8, 0}}));
  connect(inertia.flange_b, torqueStep.flange) annotation(
    Line(points = {{40, 0}, {64, 0}, {64, 0}, {64, 0}}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.002));
end ServoMotor_test;
