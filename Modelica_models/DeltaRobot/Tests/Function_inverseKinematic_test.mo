within DeltaRobot.Tests;

model Function_inverseKinematic_test "Test of the function 'inverseKinematic'"
  import DeltaRobot.Functions.*;
     
  // Imports
  import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
  
  // Parameters
  parameter SI.Position platformPosition[3] = {0.141421,0,-0.543}  "Coordinates of the platform frame resolved in base frame";  
  parameter DeltaRobot.Types.DiscParameters base(D=0.30, beta=from_deg(-90-45)) "Base parameters";
  parameter DeltaRobot.Types.DiscParameters platform(D=0.07) "Platform parameters";
  parameter DeltaRobot.Types.ArmParameters armParameters "Arm parameters";
  
  // Function to test
  parameter SI.Angle theta[3] = inverseKinematic(platformPosition, armParameters.L, armParameters.l, base.D, platform.D, base.beta) "Angles of the three actuators";
    
  // Test the change of coordinates used in the function
  parameter TM.Orientation T = TM.axisRotation(3,base.beta-from_deg(-90)) "Transformation matrix from original base frame to a new base frame with 'beta=-90°'";
  parameter SI.Position p_new[3] = TM.resolve2(T,platformPosition); // Change platform coordinates to new base frame (beta=-90°)

end Function_inverseKinematic_test;
