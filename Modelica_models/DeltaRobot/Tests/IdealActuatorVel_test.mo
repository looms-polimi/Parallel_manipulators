within DeltaRobot.Tests;

model IdealActuatorVel_test "Test of model 'IdealActuatorVel'"
  Components.IdealActuatorVel idealActuatorVel  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(m = 1, r_CM = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = 1, offset = 0, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, idealActuatorVel.frame_a) annotation(
    Line(points = {{-40, 0}, {-10, 0}}, color = {95, 95, 95}));
  connect(idealActuatorVel.frame_b, body.frame_a) annotation(
    Line(points = {{10, 0}, {38, 0}, {38, 0}, {40, 0}}));
  connect(ramp.y, idealActuatorVel.angleVelRef) annotation(
    Line(points = {{-18, 50}, {0, 50}, {0, 12}, {0, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));

end IdealActuatorVel_test;
