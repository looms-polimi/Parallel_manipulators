within DeltaRobot.Tests;

model InverseKinematic_test "Test of the complete inverse kinematic"
   import DeltaRobot.Functions.*;
  // Parameters
  parameter SI.Position platformPosition[3] = {0,0,-0.543}  "Coordinates of the platform frame resolved in base frame";  
  parameter DeltaRobot.Types.DiscParameters base(D=0.30, beta=from_deg(-90)) "Base parameters";
  parameter DeltaRobot.Types.DiscParameters platform(D=0.07, beta=base.beta) "Platform parameters";
  parameter DeltaRobot.Types.ArmParameters armParameters "Arm parameters";
  parameter Modelica.Mechanics.MultiBody.Types.RotationSequence rotationSequence = {3,1,3} "Sequence of rotations relative to function 'actuatorsJointsRotationAngles'";

  // Computation of other parameters
  parameter SI.Position J[3, 3] = jointsCoordinates(base) "Coordinates of the actuators' joints resolved in base frame";
  parameter SI.Position Jp[3, 3] = jointsCoordinates(platform) "Coordinates of the platform joints resolved in platform frame";
  parameter NonSI.Angle_deg alpha[3, 3] = actuatorsJointsRotationAngles(base) "Rotation angles to rotate base frame into the frames of base joints";
  parameter SI.Angle theta[3] = inverseKinematic(platformPosition, armParameters.L, armParameters.l, base.D, platform.D, base.beta) "Angles of the three actuators";
  parameter SI.Angle parallAngles[3,3] = parallelogramAngles(platformPosition, armParameters.L, armParameters.l, base.D, platform.D, base.beta) "Rotation angles. In sequence: around upper revolute joint, parallelogram joint, lower revolute joint";
 
  // Models
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}, nominalLength = 0.2)  annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint1(angles = {alpha[1, 1], alpha[1, 2], alpha[1, 3]}, r = {J[1, 1], J[1, 2], J[1, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint2(angles = {alpha[2, 1], alpha[2, 2], alpha[2, 3]}, r = {J[2, 1], J[2, 2], J[2, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint3(angles = {alpha[3, 1], alpha[3, 2], alpha[3, 3]}, r = {J[3, 1], J[3, 2], J[3, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence) annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm1(angles = {to_deg(parallAngles[1, 1]), to_deg(parallAngles[1, 2]), 0}, r = {armParameters.L, 0, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = {3, 2, 3}, width = armParameters.D) annotation(Placement(visible = true, transformation(origin = {-110, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm2(angles = {to_deg(parallAngles[2, 1]), to_deg(parallAngles[2, 2]), 0}, r = {armParameters.L, 0, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = {3, 2, 3}, width = armParameters.D) annotation(Placement(visible = true, transformation(origin = {0, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation upperArm3(angles = {to_deg(parallAngles[3, 1]), to_deg(parallAngles[3, 2]), 0}, r = {armParameters.L, 0, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = {3, 2, 3}, width = armParameters.D) annotation(Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation actuator1(angle = to_deg(theta[1]), n = {0, 0, 1})  annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation actuator2(angle = to_deg(theta[2]), n = {0, 0, 1})  annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation actuator3(angle = to_deg(theta[3]), n = {0, 0, 1})  annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation parallelogram1(angles = {-to_deg(parallAngles[1, 2]), to_deg(parallAngles[1, 3]), 0},r = {armParameters.l, 0, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = {2, 3, 1}, width = armParameters.Dl) annotation(Placement(visible = true, transformation(origin = {-150, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation parallelogram2(angles = {-to_deg(parallAngles[2, 2]), to_deg(parallAngles[2, 3]), 0},r = {armParameters.l, 0, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = {2, 3, 1}, width = armParameters.Dl) annotation(Placement(visible = true, transformation(origin = {0, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation parallelogram3(angles = {-to_deg(parallAngles[3, 2]), to_deg(parallAngles[3, 3]), 0},r = {armParameters.l, 0, 0}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = {2, 3, 1}, width = armParameters.Dl) annotation(Placement(visible = true, transformation(origin = {150, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformRadius1(r = {platform.D / 2, 0, 0}) annotation(Placement(visible = true, transformation(origin = {-190, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformRadius2(r = {platform.D / 2, 0, 0}) annotation(Placement(visible = true, transformation(origin = {40, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformRadius3(r = {platform.D / 2, 0, 0}) annotation(Placement(visible = true, transformation(origin = {192, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Mechanics.MultiBody.Parts.Fixed platformFrameOrigin(animation = false, r = platformPosition)  annotation(Placement(visible = true, transformation(origin = {80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformJoint1(r = {Jp[1, 1], Jp[1, 2], Jp[1, 3]}) annotation(Placement(visible = true, transformation(origin = {50, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformJoint2(r = {Jp[2, 1], Jp[2, 2], Jp[2, 3]}) annotation(Placement(visible = true, transformation(origin = {80, -10}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformJoint3(r = {Jp[3, 1], Jp[3, 2], Jp[3, 3]}) annotation(Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1, sphereDiameter = 0.01)  annotation(Placement(visible = true, transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(world.frame_b, joint1.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {-20, 40}, {-20, 40}}));
  connect(world.frame_b, joint2.frame_a) annotation(Line(points = {{0, 60}, {0, 20}}));
  connect(world.frame_b, joint3.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {20, 40}, {20, 40}}));
  
  connect(joint1.frame_b, actuator1.frame_a) annotation(Line(points = {{-40, 40}, {-60, 40}, {-60, 40}, {-60, 40}}));
  connect(joint2.frame_b, actuator2.frame_a) annotation(Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}));
  connect(joint3.frame_b, actuator3.frame_a) annotation(Line(points = {{40, 40}, {58, 40}, {58, 40}, {60, 40}}));
  
  connect(actuator1.frame_b, upperArm1.frame_a) annotation(Line(points = {{-80, 40}, {-100, 40}, {-100, 40}, {-100, 40}}));
  connect(actuator2.frame_b, upperArm2.frame_a) annotation(Line(points = {{0, -40}, {0, -40}, {0, -60}, {0, -60}}));
  connect(actuator3.frame_b, upperArm3.frame_a) annotation(Line(points = {{80, 40}, {100, 40}, {100, 40}, {100, 40}}));
  
  connect(upperArm1.frame_b, parallelogram1.frame_a) annotation(Line(points = {{-120, 40}, {-138, 40}, {-138, 40}, {-140, 40}}));
  connect(upperArm2.frame_b, parallelogram2.frame_a) annotation(Line(points = {{0, -80}, {0, -80}, {0, -100}, {0, -100}}));
  connect(upperArm3.frame_b, parallelogram3.frame_a) annotation(Line(points = {{120, 40}, {140, 40}, {140, 40}, {140, 40}}, color = {95, 95, 95}));
  
  connect(parallelogram1.frame_b, platformRadius1.frame_a) annotation(Line(points = {{-160, 40}, {-180, 40}, {-180, 40}, {-180, 40}}));
  connect(parallelogram2.frame_b, platformRadius2.frame_a) annotation(Line(points = {{0, -120}, {20, -120}, {20, -100}, {40, -100}, {40, -100}}, color = {95, 95, 95}));
  connect(parallelogram3.frame_b, platformRadius3.frame_a) annotation(Line(points = {{160, 40}, {182, 40}, {182, 40}, {182, 40}}));

  connect(platformFrameOrigin.frame_b, platformJoint1.frame_a) annotation(Line(points = {{80, -60}, {80, -60}, {80, -40}, {60, -40}, {60, -40}}, color = {95, 95, 95}));
  connect(platformFrameOrigin.frame_b, platformJoint2.frame_a) annotation(Line(points = {{80, -60}, {80, -60}, {80, -20}, {80, -20}}));
  connect(platformFrameOrigin.frame_b, platformJoint3.frame_a) annotation(Line(points = {{80, -60}, {80, -60}, {80, -40}, {100, -40}, {100, -40}}));

  connect(pointMass.frame_a, platformFrameOrigin.frame_b) annotation(Line(points = {{90, -50}, {80, -50}, {80, -60}, {80, -60}}));

end InverseKinematic_test;
