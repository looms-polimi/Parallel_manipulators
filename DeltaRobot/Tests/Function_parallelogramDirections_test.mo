within DeltaRobot.Tests;

model Function_parallelogramDirections_test "Test of function 'parallelogramDirections'"
   import DeltaRobot.Functions.*;
   
  // Parameters
  parameter SI.Position platformPosition[3] = {0.141421,0,-0.543}  "Coordinates of the platform frame resolved in base frame";  
  parameter DeltaRobot.Types.DiscParameters base(D=0.30, beta=from_deg(-90-45)) "Base parameters";
  parameter DeltaRobot.Types.DiscParameters platform(D=0.07, beta=base.beta) "Platform parameters";
  parameter DeltaRobot.Types.ArmParameters armParameters "Arm parameters";

  // Computation of other parameters
  parameter SI.Position J[3, 3] = jointsCoordinates(base) "Coordinates of the actuators' joints resolved in base frame";  
  parameter SI.Position Jp[3, 3] = jointsCoordinates(platform) "Coordinates of the platform joints resolved in platform frame";
  parameter Real upperArm[3,3] = upperArmsDirections(platformPosition, armParameters.L, armParameters.l, base.D, platform.D,base.beta) "Upper arms represented as vectors resolved in base frame";
  parameter Real parallDir[3,3] = parallelogramDirections(platformPosition, armParameters.L, armParameters.l, base.D, platform.D,base.beta) "Long sides of the parallelograms represented as vectors resolved in base frame";

  // Models
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}, nominalLength = 0.2)  annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint1(r = {J[1, 1], J[1, 2], J[1, 3]}) annotation(Placement(visible = true, transformation(origin = {-30, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint2(r = {J[2, 1], J[2, 2], J[2, 3]}) annotation(Placement(visible = true, transformation(origin = {0, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint3(r = {J[3, 1], J[3, 2], J[3, 3]}) annotation(Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm1(r = {upperArm[1, 1], upperArm[1, 2], upperArm[1, 3]}, width = armParameters.D) annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm2(r = {upperArm[2, 1], upperArm[2, 2], upperArm[2, 3]}, width = armParameters.D) annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm3(r = {upperArm[3, 1], upperArm[3, 2], upperArm[3, 3]}, width = armParameters.D) annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation parallelogram1(r = {parallDir[1, 1], parallDir[1, 2], parallDir[1, 3]}, width = armParameters.Dl) annotation(Placement(visible = true, transformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation parallelogram2(r = {parallDir[2, 1], parallDir[2, 2], parallDir[2, 3]}, width = armParameters.Dl) annotation(Placement(visible = true, transformation(origin = {0, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation parallelogram3(r = {parallDir[3, 1], parallDir[3, 2], parallDir[3, 3]}, width = armParameters.Dl) annotation(Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Parts.Fixed platformFrameOrigin(animation = false, r = platformPosition)  annotation(Placement(visible = true, transformation(origin = {80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformJoint1(r = {Jp[1, 1], Jp[1, 2], Jp[1, 3]}) annotation(Placement(visible = true, transformation(origin = {50, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformJoint2(r = {Jp[2, 1], Jp[2, 2], Jp[2, 3]}) annotation(Placement(visible = true, transformation(origin = {80, -10}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformJoint3(r = {Jp[3, 1], Jp[3, 2], Jp[3, 3]}) annotation(Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(world.frame_b, joint1.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {-20, 40}, {-20, 40}}));
  connect(world.frame_b, joint2.frame_a) annotation(Line(points = {{0, 60}, {0, 20}}));
  connect(world.frame_b, joint3.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {20, 40}, {20, 40}}));

  connect(joint1.frame_b, upperArm1.frame_a) annotation(Line(points = {{-40, 40}, {-60, 40}, {-60, 40}, {-60, 40}}));
  connect(joint2.frame_b, upperArm2.frame_a) annotation(Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}));
  connect(joint3.frame_b, upperArm3.frame_a) annotation(Line(points = {{40, 40}, {60, 40}, {60, 40}, {60, 40}}, color = {95, 95, 95}));

  connect(upperArm1.frame_b, parallelogram1.frame_a) annotation(Line(points = {{-80, 40}, {-100, 40}, {-100, 40}, {-100, 40}}));
  connect(upperArm2.frame_b, parallelogram2.frame_a) annotation(Line(points = {{0, -40}, {0, -40}, {0, -60}, {0, -60}}, color = {95, 95, 95}));
  connect(upperArm3.frame_b, parallelogram3.frame_a) annotation(Line(points = {{80, 40}, {100, 40}, {100, 40}, {100, 40}}));
  
  connect(platformFrameOrigin.frame_b, platformJoint1.frame_a) annotation(Line(points = {{80, -60}, {80, -60}, {80, -40}, {60, -40}, {60, -40}}, color = {95, 95, 95}));
  connect(platformFrameOrigin.frame_b, platformJoint2.frame_a) annotation(Line(points = {{80, -60}, {80, -60}, {80, -20}, {80, -20}}));
  connect(platformFrameOrigin.frame_b, platformJoint3.frame_a) annotation(Line(points = {{80, -60}, {80, -60}, {80, -40}, {100, -40}, {100, -40}}));
  
end Function_parallelogramDirections_test;
