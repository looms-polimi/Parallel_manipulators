within DeltaRobot.Tests;

model Functions_jointsCoordinates_actuatorsJointsRotationAngles_test "Test of functions 'jointsCoordinates' and 'actuatorsJointsRotationAngles'"
  import DeltaRobot.Functions.*;
  
  // Parameters
  parameter DeltaRobot.Types.DiscParameters discParameters(D=1) "Parameters of the base/platform";
  parameter Modelica.Mechanics.MultiBody.Types.RotationSequence rotationSequence = {3,1,3} "Sequence of rotations relative to function 'actuatorsJointsRotationAngles'";
  
  // Computation of other parameters
  parameter SI.Position J[3, 3] = jointsCoordinates(discParameters) "Coordinates of the joints resolved in base/platform frame";  
  parameter NonSI.Angle_deg alpha[3, 3] = actuatorsJointsRotationAngles(discParameters) "Rotation angles to rotate base/platform frame into the frames of base/platform joints";

  // Models
  inner Modelica.Mechanics.MultiBody.World world annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint1(angles = {alpha[1, 1], alpha[1, 2], alpha[1, 3]}, r = {J[1, 1], J[1, 2], J[1, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence) annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint2(angles = {alpha[2, 1], alpha[2, 2], alpha[2, 3]}, r = {J[2, 1], J[2, 2], J[2, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));  
  Modelica.Mechanics.MultiBody.Parts.FixedRotation joint3(angles = {alpha[3, 1], alpha[3, 2], alpha[3, 3]}, r = {J[3, 1], J[3, 2], J[3, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence) annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1 annotation(Placement(visible = true, transformation(origin = {-70, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2 annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame3 annotation(Placement(visible = true, transformation(origin = {70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
equation
  connect(world.frame_b, joint1.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {-20, 40}, {-20, 40}}, color = {95, 95, 95}));
  connect(world.frame_b, joint2.frame_a) annotation(Line(points = {{0, 60}, {0, 20}}));
  connect(world.frame_b, joint3.frame_a) annotation(Line(points = {{0, 60}, {0, 60}, {0, 40}, {20, 40}, {20, 40}}, color = {95, 95, 95}));
  
  
  connect(joint1.frame_b, fixedFrame1.frame_a) annotation(Line(points = {{-60, 40}, {-40, 40}, {-40, 40}, {-40, 40}}));
  connect(joint2.frame_b, fixedFrame2.frame_a) annotation(Line(points = {{0, 0}, {0, 0}, {0, -20}, {0, -20}}));
  connect(joint3.frame_b, fixedFrame3.frame_a) annotation(Line(points = {{40, 40}, {60, 40}, {60, 40}, {60, 40}}));
  
end Functions_jointsCoordinates_actuatorsJointsRotationAngles_test;
