within DeltaRobot.Functions;

function actuatorsJointsRotationAngles "Return the rotation angles in degrees with axes sequence {3,1,3} to rotate the base/platform frame into the frames of the actuators joints"
    extends DeltaRobot.Icons.Function; // Icon

    // Input & Output
    input DeltaRobot.Types.DiscParameters discParameters;    
    output NonSI.Angle_deg alpha[3, 3] "Rotation angles around axes sequence {3, 1, 3} to rotate base/platform frame into the frames of the actuators joints";

algorithm

    alpha[1, 1] := to_deg(discParameters.beta + 0*discParameters.alpha);
    alpha[1, 2] := -90;
    alpha[1, 3] := 0;
    
    alpha[2, 1] := to_deg(discParameters.beta + 1*discParameters.alpha);
    alpha[2, 2] := -90;
    alpha[2, 3] := 0;
    
    alpha[3, 1] := to_deg(discParameters.beta + 2*discParameters.alpha);
    alpha[3, 2] := -90;
    alpha[3, 3] := 0;
    
end actuatorsJointsRotationAngles;
