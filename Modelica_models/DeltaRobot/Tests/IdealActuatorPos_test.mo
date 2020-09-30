within DeltaRobot.Tests;

model IdealActuatorPos_test "Test of model 'IdealActuatorPos'"
  Components.IdealActuatorPos idealActuatorPos( initAngle = 0.7853981633974483, initAngleFixed = true, initAngularVelFixed = true)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Body body(m = 1, r_CM = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 1, height = pi, offset = from_deg(45), startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, idealActuatorPos.frame_a) annotation(
    Line(points = {{-40, 0}, {-10, 0}}, color = {95, 95, 95}));
  connect(idealActuatorPos.frame_b, body.frame_a) annotation(
    Line(points = {{10, 0}, {38, 0}, {38, 0}, {40, 0}}));
  connect(ramp.y, idealActuatorPos.angleRef) annotation(
    Line(points = {{-18, 50}, {0, 50}, {0, 12}, {0, 12}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end IdealActuatorPos_test;
