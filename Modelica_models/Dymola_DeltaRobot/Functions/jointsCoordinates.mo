within DeltaRobot.Functions;
function jointsCoordinates "Returns a vector with the joints coordinates of a disc resolved in in the frame of the disc to which they belong"
  extends Modelica.Icons.Function;

  //Input & Output
  input DeltaRobot.Types.DiscParameters discParameters "Disc parameters";
  output SI.Position J[3, 3] "Joints coordinates";

  //Intermediate parameters: angles where the joints are located
protected
  SI.Angle a1 = discParameters.beta;
  SI.Angle a2 = discParameters.beta+discParameters.alpha;
  SI.Angle a3 = discParameters.beta+2*discParameters.alpha;
  SI.Radius R = discParameters.D/2 "Radius";

algorithm
    J[1] := {R*cos(a1),R*sin(a1),0};
    J[2] := {R*cos(a2),R*sin(a2),0};
    J[3] := {R*cos(a3),R*sin(a3),0};

  annotation (__Dymola_LockedEditing="Controllato");
end jointsCoordinates;
