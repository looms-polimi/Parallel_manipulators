within StewartPlatform.Tests;

model Leg_test
  StewartPlatform.Components.Leg leg(ec_initialLengthFixed = true, ec_initialVelFixed = true, sj_enforceStates = true, uj_initialAnglesFixed = true, uj_initialAngularVelFixed = true)  annotation(
    Placement(visible = true, transformation(origin = {2, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.1, f = 0.1, offset = leg.ec_initialLength, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-168, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(g = 0, n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {-44, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(m = 1, r_CM = {0, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {34, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.RefToBus refToBus annotation(
    Placement(visible = true, transformation(origin = {-38, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-132, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1 / leg.electricCylinder.ECparameters.ratio)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / leg.electricCylinder.spindleDrive.ratio) annotation(
    Placement(visible = true, transformation(origin = {-106, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PID pid(Nd = 100, Td = 1, Ti = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-78, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(leg.frame_b, body.frame_a) annotation(
    Line(points = {{15.8, -18}, {23.8, -18}, {23.8, -18}, {23.8, -18}}, color = {95, 95, 95}));
  connect(world.frame_b, leg.frame_a) annotation(
    Line(points = {{-34, -18}, {-14, -18}, {-14, -18}, {-14, -18}}, color = {95, 95, 95}));
  connect(sine.y, feedback.u1) annotation(
    Line(points = {{-157, 44}, {-141, 44}, {-141, 44}, {-141, 44}}, color = {0, 0, 127}));
  connect(refToBus.axisControlBus, leg.axisControlBus) annotation(
    Line(points = {{-28, 44}, {-8, 44}, {-8, -11.5}}, color = {255, 204, 51}, thickness = 0.5));
  connect(gain.u, leg.axisControlBus.encoder) annotation(
    Line(points = {{-58, 10}, {-8, 10}, {-8, -12}, {-8, -12}}, color = {0, 0, 127}));
  connect(gain1.u, gain.y) annotation(
    Line(points = {{-94, 10}, {-82, 10}, {-82, 10}, {-80, 10}}, color = {0, 0, 127}));
  connect(gain1.y, feedback.u2) annotation(
    Line(points = {{-116, 10}, {-132, 10}, {-132, 36}, {-132, 36}}, color = {0, 0, 127}));
  connect(pid.y, refToBus.torqueRef) annotation(
    Line(points = {{-66, 44}, {-50, 44}, {-50, 44}, {-50, 44}}, color = {0, 0, 127}));
  connect(feedback.y, pid.u) annotation(
    Line(points = {{-122, 44}, {-92, 44}, {-92, 44}, {-90, 44}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.12));
end Leg_test;
