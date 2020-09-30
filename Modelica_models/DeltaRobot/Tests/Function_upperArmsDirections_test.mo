within DeltaRobot.Tests;

model Function_upperArmsDirections_test "Test of function 'upperArmsDirections'"
  import DeltaRobot.Functions.*;
  
  // Parameters
  parameter SI.Position platformPosition[3] = {0.141421,0,-0.543}  "Coordinates of the platform frame resolved in base frame";  
  parameter DeltaRobot.Types.DiscParameters base(D=0.30, beta=from_deg(-90-45)) "Base parameters";
  parameter DeltaRobot.Types.DiscParameters platform(D=0.07) "Platform parameters";
  parameter DeltaRobot.Types.ArmParameters armParameters "Arm parameters";
  
  // Computation of other parameters
  parameter SI.Position J[3, 3] = jointsCoordinates(base) "Coordinates of the actuators' joints resolved in base frame";  
  parameter Real upperArm[3,3] = upperArmsDirections(platformPosition, armParameters.L, armParameters.l, base.D, platform.D,base.beta) "Upper arms represented as vectors resolved in base frame";

  // Models
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}, nominalLength = 0.2)  annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint1(r = {J[1, 1], J[1, 2], J[1, 3]}) annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint2(r = {J[2, 1], J[2, 2], J[2, 3]}) annotation(Placement(visible = true, transformation(origin = {0, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint3(r = {J[3, 1], J[3, 2], J[3, 3]}) annotation(Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm1(r = {upperArm[1, 1], upperArm[1, 2], upperArm[1, 3]})  annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm2(r = {upperArm[2, 1], upperArm[2, 2], upperArm[2, 3]}) annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm3(r = {upperArm[3, 1], upperArm[3, 2], upperArm[3, 3]}) annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(world.frame_b, joint1.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {-20, 40}, {-20, 40}}, color = {95, 95, 95}));
  connect(world.frame_b, joint2.frame_a) annotation(Line(points = {{0, 60}, {0, 20}}));
  connect(world.frame_b, joint3.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {20, 40}, {20, 40}}, color = {95, 95, 95}));

  connect(joint1.frame_b, upperArm1.frame_a) annotation(Line(points = {{-40, 40}, {-60, 40}, {-60, 40}, {-60, 40}}));
  connect(joint2.frame_b, upperArm2.frame_a) annotation(Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}, color = {95, 95, 95}));
  connect(joint3.frame_b, upperArm3.frame_a) annotation(Line(points = {{40, 40}, {60, 40}, {60, 40}, {60, 40}}));

end Function_upperArmsDirections_test;
