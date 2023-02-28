within DeltaRobot.Functions;

function upperArmsDirections "Return three vectors resolved in base frame that represent the three upper arms for a given platform position"
    extends DeltaRobot.Icons.Function; // Icon
    
    // Imports
    import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

    // Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Length of the upper arms";
    input SI.Distance l "Length of the parallelograms (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    input SI.Angle beta_base "Angle from the x-axis of the base frame to the direction where the joint #1 is located";
    output Real arm[3,3] "Upper arms represented as vectors, arm[#arm,#component]]";

    // Intermediate parameters
protected
    Real temp[3] "Variable to store values temporarily";   
    SI.Angle theta[3] = inverseKinematic(p,L,l,Db,Dp,beta_base)"Angles of the three actuators for the given platform position";
    TM.Orientation T = TM.axisRotation(3,beta_base-from_deg(-90)) "Transformation matrix from original base frame to a new base frame with 'beta=-90°'";

algorithm

    // Compute the output vector in the new base frame (beta=-90°)
    arm[1,1] := 0;
    arm[1,2] := -L*cos(theta[1]);
    arm[1,3] := -L*sin(theta[1]);

    arm[2,1] := sqrt(3)/2*L*cos(theta[2]);
    arm[2,2] := 0.5*L*cos(theta[2]);
    arm[2,3] := -L*sin(theta[2]);

    arm[3,1] := -sqrt(3)/2*L*cos(theta[3]);
    arm[3,2] := 0.5*L*cos(theta[3]);
    arm[3,3] := -L*sin(theta[3]);
    
    // Change reference frame from new base frame to original base frame
    for i in 1:3 loop
        temp[1] := arm[i, 1];
        temp[2] := arm[i, 2];
        temp[3] := arm[i, 3];
        temp := TM.resolve1(T,temp);
        arm[i, 1] := temp[1];
        arm[i, 2] := temp[2];
        arm[i, 3] := temp[3];
    end for;
    
end upperArmsDirections;
