within DeltaRobot.Functions;
function upperArmsDirections "Returns 3 vectors resolved in base frame that represent the 3 upper arms for a given platform position"
  extends Modelica.Icons.Function;

  //Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Upper arms length";
    input SI.Distance l "Parallelograms length";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    output Real arm[3,3] "Upper arms represented as vectors, arm[#arm,#component]]";

protected
  SI.Angle theta[3] = inverseKinematic(p,L,l,Db,Dp) "Angles of the three actuators' joints";

algorithm
  arm[1] := {0, -L*cos(theta[1]), -L*sin(theta[1])};
  arm[2] := {sqrt(3)/2*L*cos(theta[2]), 0.5*L*cos(theta[2]), -L*sin(theta[2])};
  arm[3] := {-sqrt(3)/2*L*cos(theta[3]), 0.5*L*cos(theta[3]), -L*sin(theta[3])};

  annotation (__Dymola_LockedEditing="Controllato");
end upperArmsDirections;
