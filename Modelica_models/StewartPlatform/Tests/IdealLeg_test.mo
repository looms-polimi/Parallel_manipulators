within StewartPlatform.Tests;

model IdealLeg_test
  StewartPlatform.Components.IdealLeg idealLeg(ila_stateSelect = StateSelect.always, initialLengthFixed = true, initialVelFixed = true, sj_EnforceStates = true, uj_initialAnglesFixed = true, uj_initialAngularVelFixed = true, uj_stateSelect = StateSelect.always)   annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 1, f = 0.25, offset = idealLeg.idealLinearActuator.ECparameters.boxLength + idealLeg.idealLinearActuator.ECparameters.minPistonLength + idealLeg.idealLinearActuator.ECparameters.workingStroke / 2, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-46, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(m = 1, r_CM = {0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine.y, idealLeg.lengthRef) annotation(
    Line(points = {{-18, 40}, {0, 40}, {0, 10}, {0, 10}}, color = {0, 0, 127}));
  connect(world.frame_b, idealLeg.frame_a) annotation(
    Line(points = {{-36, 0}, {-16, 0}, {-16, 0}, {-16, 0}}, color = {95, 95, 95}));
  connect(idealLeg.frame_b, body.frame_a) annotation(
    Line(points = {{14, 0}, {22, 0}, {22, 0}, {22, 0}}, color = {95, 95, 95}));

annotation(experiment(StartTime = 0, StopTime = 14));
end IdealLeg_test;
