within DeltaRobot.Functions;
function parallelogramDirection "Returns 3 vectors resolved in base frame that represent the 3 long sides of the parallelograms for a given platform position"
  extends Modelica.Icons.Function;

  //Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Upper arms length";
    input SI.Distance l "Parallelograms length (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    output Real parallelogram[3,3] "Parallelograms' long sides represented as vectors, parallelogram[#parallelogram,#component]]";

protected
  Real a,b,c;
  SI.Radius Rb = Db/2 "Base radius";
  SI.Radius Rp = Dp/2 "Platform radius";
  Real arm[3,3] = upperArmsDirections(p,L,l,Db,Dp) "Upper arms represented as vectors, arm[#arm,#component]]";

algorithm
  a := Rb-Rp;
  b := (3/sqrt(3)*Rp)/2-sqrt(3)/2*Rb;
  c := Rp/2-Rb/2;

  parallelogram[1] := {p[1], p[2]-arm[1,2]+a, p[3]-arm[1,3]};
  parallelogram[2] := {p[1]-arm[2,1]+b, p[2]-arm[2,2]+c, p[3]-arm[2,3]};
  parallelogram[3] := {p[1]-arm[3,1]-b, p[2]-arm[3,2]+c, p[3]-arm[3,3]};

  annotation (__Dymola_LockedEditing="Controllato");
end parallelogramDirection;
