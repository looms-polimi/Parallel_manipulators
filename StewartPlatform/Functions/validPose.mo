within StewartPlatform.Functions;

function validPose "Return true if the input pose belongs to the operativity region"
    extends StewartPlatform.Icons.Function; // Icon

  //Input & Output
    input StewartPlatform.Types.DiscParameters base "Base parameters";
    input StewartPlatform.Types.DiscParameters platform "Platform parameters";
    input SI.Position position[3] "Coordinates of the platform frame resolved in base frame";
    input Modelica.Mechanics.MultiBody.Types.RotationSequence sequence "Sequence of rotations from base frame to platform frame along axis sequence[i]";
    input SI.Angle angles[3] "Rotation angles around the axes defined in 'sequence'";
    input SI.Length maxLength "Max leg length";
    input SI.Length minLength "Min leg length";
    output Boolean valid "=true, if the input pose is in the operativity region";

  protected
    SI.Length legLength[6] = legsLength(base,platform,position,sequence,angles) "Lengths of the legs";

algorithm
  valid:=true;

  for i in 1:6 loop
    if legLength[i]>maxLength or legLength[i]<minLength then
      valid:=false;
    end if;
  end for;

end validPose;
