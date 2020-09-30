within DeltaRobot.Functions;

function jointsCoordinates "Return a vector with the coordinates of the disc's joints resolved in the disc frame"
    extends DeltaRobot.Icons.Function; // Icon

    // Input & Output
    input DeltaRobot.Types.DiscParameters discParameters "Disc parameters";
    output SI.Position J[3, 3] "Coordinates of the joints, J[#joint, #coordinate]";

    // Intermediate parameters
protected
    SI.Angle a1 = discParameters.beta + 0*discParameters.alpha "Angle that defines where the joint #1 is located";
    SI.Angle a2 = discParameters.beta + 1*discParameters.alpha "Angle that defines where the joint #2 is located";
    SI.Angle a3 = discParameters.beta + 2*discParameters.alpha "Angle that defines where the joint #3 is located";
    SI.Radius R = discParameters.D/2 "Radius";

algorithm
    assert(abs(discParameters.alpha - from_deg(120)) <= Modelica.Constants.eps, "jointsCoordinates(): the disc parameter 'alpha' must be 120°, no other configurations are allowed for a Delta Robot.", level = AssertionLevel.error);
    
    J[1,1] := R*cos(a1);
    J[1,2] := R*sin(a1);
    J[1,3] := 0;

    J[2,1] := R*cos(a2);
    J[2,2] := R*sin(a2);
    J[2,3] := 0;

    J[3,1] := R*cos(a3);
    J[3,2] := R*sin(a3);
    J[3,3] := 0;
    
end jointsCoordinates;
