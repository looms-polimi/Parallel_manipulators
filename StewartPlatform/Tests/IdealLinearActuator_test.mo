within StewartPlatform.Tests;

model IdealLinearActuator_test
  StewartPlatform.Components.IdealLinearActuator idealLinearActuator(initialAccFixed = false,initialLengthFixed = true, initialVelFixed = true)   annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 1,f = 0.2, offset = idealLinearActuator.ECparameters.boxLength+idealLinearActuator.ECparameters.minPistonLength+idealLinearActuator.ECparameters.workingStroke/2, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, idealLinearActuator.frame_a) annotation(
    Line(points = {{-36, 0}, {-10, 0}, {-10, 0}, {-10, 0}}));
  connect(sine.y, idealLinearActuator.lengthRef) annotation(
    Line(points = {{-18, 50}, {0, 50}, {0, 10}, {0, 10}}, color = {0, 0, 127}));

annotation(experiment(StartTime = 0, StopTime = 7),
    Diagram);
end IdealLinearActuator_test;
