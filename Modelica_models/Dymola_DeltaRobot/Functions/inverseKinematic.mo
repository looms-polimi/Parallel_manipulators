within DeltaRobot.Functions;
function inverseKinematic "Returns the angles of the 3 actuators' joints for a given platform position"
  extends Modelica.Icons.Function;

  //Imports
    import Modelica.Math.atan;

  //Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Upper arms length";
    input SI.Distance l "Parallelograms length (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    output SI.Angle theta[3] "Angles of the three actuators' joints";

protected
  Real a,b,c,E[3],F[3],G[3],t[3,2];
  SI.Radius Rb = Db/2 "Base radius";
  SI.Radius Rp = Dp/2 "Platform radius";

algorithm
  a := Rb-Rp;
  b := 3*Rp/sqrt(3)/2-sqrt(3)*Rb/2;
  c := Rp/2-Rb/2;

  E[1] := 2*L*(p[2]+a);
  F[1] := 2*L*p[3];
  G[1] := p[1]^2+p[2]^2+p[3]^2+a^2+L^2+2*p[2]*a-l^2;

  E[2] := -L*(sqrt(3)*(p[1]+b)+p[2]+c);
  F[2] := 2*p[3]*L;
  G[2] := p[1]^2+p[2]^2+p[3]^2+b^2+c^2+L^2+2*(p[1]*b+p[2]*c)-l^2;

  E[3] := L*(sqrt(3)*(p[1]-b)-p[2]-c);
  F[3] := 2*p[3]*L;
  G[3] := p[1]^2+p[2]^2+p[3]^2+b^2+c^2+L^2+2*(-p[1]*b+p[2]*c)-l^2;

  for i in 1:3 loop
      assert((E[i]^2+F[i]^2-G[i]^2)>=0, "inverseKinematic(): negative square root, inputs not valid.");
      t[i,1] := (-F[i]+sqrt(E[i]^2+F[i]^2-G[i]^2))/(G[i]-E[i]);
      t[i,2] := (-F[i]-sqrt(E[i]^2+F[i]^2-G[i]^2))/(G[i]-E[i]);
      theta[i] := 2*atan(t[i,2]);
  end for;

  annotation (__Dymola_LockedEditing="Controllato");
end inverseKinematic;
