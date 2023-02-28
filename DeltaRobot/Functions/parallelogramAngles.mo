within DeltaRobot.Functions;

function parallelogramAngles "Return the angles to initialize the parallelograms"
    extends DeltaRobot.Icons.Function; // Icon

    // Imports
    import Modelica.Math.atan2;
    import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

    // Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Length of the upper arms";
    input SI.Distance l "Length of the parallelograms (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    input SI.Angle beta_base "Angle from the x-axis of the base frame to the direction where the joint #1 is located";
    output SI.Angle angles[3,3] "Rotation angles. In sequence: around upper revolute joint, parallelogram joint, lower revolute joint (angles[#parallelogram,#angle])";

    // Intermediate parameters
protected
    Real temp[3] "Variable to store values temporarily";
    Real parall[3,3] = parallelogramDirections(p,L,l,Db,Dp,beta_base) "Long sides of the parallelograms represented as vectors resolved in base frame, parallelogram[#parallelogram,#component]";
    SI.Angle theta[3] = inverseKinematic(p,L,l,Db,Dp,beta_base) "Angles of the three actuators";
    TM.Orientation T "Transformation matrix from base frame to upper arm frame";
    DeltaRobot.Types.DiscParameters defautP(D=1) "Default parameters of a disc";

algorithm

    for i in 1:3 loop
        T := TM.axesRotations({3,1,3},{beta_base+defautP.alpha*(i-1),from_deg(-90),theta[i]});
        
        temp[1] := parall[i, 1];
        temp[2] := parall[i, 2];
        temp[3] := parall[i, 3];
        temp := TM.resolve2(T,temp);
        parall[i, 1] := temp[1];
        parall[i, 2] := temp[2];
        parall[i, 3] := temp[3];

        angles[i,1] := atan2(parall[i,2],parall[i,1]);
        angles[i,2] := -atan2(parall[i,3],sqrt(parall[i,1]^2+parall[i,2]^2));
        angles[i,3] := pi-theta[i]-angles[i,1];
    end for;

end parallelogramAngles;
