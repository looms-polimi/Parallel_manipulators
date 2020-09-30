within DeltaRobot.Functions;
function parallelogramAngles "Returns the angles to initialize the parallelograms"
  extends Modelica.Icons.Function;

   //Imports
    import Modelica.Math.Vectors.norm;
    import Modelica.Math.atan2;
    import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

  //Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Upper arms length";
    input SI.Distance l "Parallelograms length (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    output SI.Angle angles[3,3] "Rotation angles. In sequence: around upper revolute joint, parallelogram joint, lower revolute joint. (angles[#parallelogram,#angle])";

  //Intermediate values
protected
    Real parall[3,3] = parallelogramDirection(p,L,l,Db,Dp) "Directions of the parallelograms resolved in base frame, parall[#parallelogram,#component]";
    SI.Angle theta[3] = inverseKinematic(p,L,l,Db,Dp) "Angles of the three actuators' joints";

    TM.Orientation T "Transformation matrix from base frame to upper arm frame";
    DeltaRobot.Types.DiscParameters defautP(D=1) "Default values of angles for a disc";

algorithm

  for i in 1:3 loop
    T := TM.axesRotations({3,1,3},{defautP.beta+defautP.alpha*(i-1),defautP.beta,theta[i]});
    parall[i] := TM.resolve2(T,parall[i]);

    angles[i,1] := atan2(parall[i,2],parall[i,1]);
    angles[i,2] := -atan2(parall[i,3],sqrt(parall[i,1]^2+parall[i,2]^2));
    angles[i,3] := pi-theta[i]-angles[i,1];
  end for;

  annotation (__Dymola_LockedEditing="Controllato");
end parallelogramAngles;
