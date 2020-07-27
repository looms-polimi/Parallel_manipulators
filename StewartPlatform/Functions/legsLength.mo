within StewartPlatform.Functions;

function legsLength "Return the lengths of all six legs for a given platform pose"
    extends Modelica.Icons.Function;

    // Input & Output
        input StewartPlatform.Types.DiscParameters base "Base parameters";
        input StewartPlatform.Types.DiscParameters platform "Platform parameters";
        input SI.Position position[3] "Coordinates of the platform frame resolved in base frame";
        input Modelica.Mechanics.MultiBody.Types.RotationSequence sequence "Sequence of rotations from base frame to platform frame along axis sequence[i]";
        input SI.Angle angles[3] "Rotation angles around the axes defined in 'sequence'";
        output SI.Length legsLength[6] "Legs length for the given configuration";

    protected
        Real legs_Directions[6,3] = legsDirections(base,platform,position,sequence,angles,false) "Legs represented as vectors resolved in base frame";
        
algorithm
    for i in 1:6 loop
      legsLength[i] := Modelica.Math.Vectors.norm({legs_Directions[i,1], legs_Directions[i,2], legs_Directions[i,3]});
    end for;

end legsLength;
