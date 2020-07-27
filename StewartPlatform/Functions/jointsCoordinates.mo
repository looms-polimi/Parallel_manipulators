within StewartPlatform.Functions;

function jointsCoordinates "Return a vector with the joints coordinates of a disc resolved in the frame of the disc to which they belong"
    extends Modelica.Icons.Function;

    // Input & Output
    input StewartPlatform.Types.DiscParameters discParameters "Disc parameters";
    output SI.Position J[6, 3] "Joints coordinates";

    // Intermediate parameters: angles where the joints are located
    protected
        SI.Angle a1 = discParameters.alpha/2;
        SI.Angle a2 = from_deg(120)-discParameters.alpha/2;
        SI.Angle a3 = from_deg(120)+discParameters.alpha/2;
        SI.Angle a4 = -a3;
        SI.Angle a5 = -a2;
        SI.Angle a6 = -a1;
        SI.Radius R = discParameters.D/2 "Radius";

algorithm
    J[1,1] := R*cos(a1);
    J[1,2] := R*sin(a1);
    J[1,3] := 0;
    
    J[2,1] := R*cos(a2);
    J[2,2] := R*sin(a2);
    J[2,3] := 0;
    
    J[3,1] := R*cos(a3);
    J[3,2] := R*sin(a3);
    J[3,3] := 0;
    
    J[4,1] := R*cos(a4);
    J[4,2] := R*sin(a4);
    J[4,3] := 0;
    
    J[5,1] := R*cos(a5);
    J[5,2] := R*sin(a5);
    J[5,3] := 0;
    
    J[6,1] := R*cos(a6);
    J[6,2] := R*sin(a6);
    J[6,3] := 0;
    
end jointsCoordinates;
