within DeltaRobot.Functions;

function parallelogramDirections "Return three vectors resolved in base frame that represent the three long sides of the parallelograms for a given platform position"
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
    output Real parallelogram[3,3] "Long sides of the parallelograms represented as vectors, parallelogram[#parallelogram,#component]";

    // Intermediate parameters
protected
    Real temp[3] "Variable to store values temporarily";
    Real a,b,c;
    SI.Radius Rb = Db/2 "Base radius";
    SI.Radius Rp = Dp/2 "Platform radius";
    TM.Orientation T = TM.axisRotation(3,beta_base-from_deg(-90)) "Transformation matrix from original base frame to a new base frame with 'beta=-90°'";
    SI.Position p_new[3] = TM.resolve2(T,p) "Platform coordinates in new base frame (beta=-90°)";    
    Real arm_new[3,3] = upperArmsDirections(p_new,L,l,Db,Dp,from_deg(-90)) "Upper arms represented as vectors in new base frame (beta=-90°)";

algorithm
    
    // Compute vectors in the new base frame (beta=-90°)
    a := Rb-Rp;
    b := (3/sqrt(3)*Rp)/2-sqrt(3)/2*Rb;
    c := Rp/2-Rb/2;

    parallelogram[1,1] := p_new[1];
    parallelogram[1,2] := p_new[2]-arm_new[1,2]+a;
    parallelogram[1,3] := p_new[3]-arm_new[1,3];

    parallelogram[2,1] := p_new[1]-arm_new[2,1]+b;
    parallelogram[2,2] := p_new[2]-arm_new[2,2]+c;
    parallelogram[2,3] := p_new[3]-arm_new[2,3];

    parallelogram[3,1] := p_new[1]-arm_new[3,1]-b;
    parallelogram[3,2] := p_new[2]-arm_new[3,2]+c;
    parallelogram[3,3] := p_new[3]-arm_new[3,3];
    
    // Change reference frame from new base frame to original base frame
    for i in 1:3 loop
        temp[1] := parallelogram[i, 1];
        temp[2] := parallelogram[i, 2];
        temp[3] := parallelogram[i, 3];
        temp := TM.resolve1(T,temp);
        parallelogram[i, 1] := temp[1];
        parallelogram[i, 2] := temp[2];
        parallelogram[i, 3] := temp[3];
    end for;
        
end parallelogramDirections;
