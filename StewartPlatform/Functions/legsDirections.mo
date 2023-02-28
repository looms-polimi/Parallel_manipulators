within StewartPlatform.Functions;

function legsDirections "Return six vectors resolved in base frame that represent the orientation and length of the six legs for a given platform pose"
      extends StewartPlatform.Icons.Function; // Icon

    // Imports
      import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

    // Input & Output
      input StewartPlatform.Types.DiscParameters base "Base parameters";
      input StewartPlatform.Types.DiscParameters platform "Platform parameters";
      input SI.Position position[3] "Coordinates of the platform frame resolved in base frame";
      input Modelica.Mechanics.MultiBody.Types.RotationSequence sequence "Sequence of rotations from base frame to platform frame along axis sequence[i]";
      input SI.Angle angles[3] "Rotation angles around the axes defined in 'sequence'";
      input Boolean normalize = false "=true, if you want normalized vectors as output (loss of legs lengths info)";
      output Real legsDirections[6,3] "Legs represented as vectors resolved in base frame";

    // Intermediate parameters
      //Memo: P_p[#point,coordinate X,Y,Z]
      protected
      SI.Position B_b[6, 3] = jointsCoordinates(base) "Base joints coordinates resolved in base frame";
      SI.Position P_p[6, 3] = jointsCoordinates(platform) "Platform joints coordinates resolved in platform frame";
      TM.Orientation T_bp = TM.axesRotations(sequence, angles) "Transformation matrix from base frame to platform frame (v_b=T_bp*v_p)";
      Real legsDirections_i[3] "Temporary variable for legsDirections[i,:]";

algorithm
    for i in 1:6 loop      
      legsDirections_i := position-B_b[i]+TM.resolve1(T_bp,{P_p[i,1],P_p[i,2],P_p[i,3]});      
      
      if normalize then
        legsDirections_i := Modelica.Math.Vectors.normalize(legsDirections_i);
      end if;
      
      legsDirections[i,1] := legsDirections_i[1];
      legsDirections[i,2] := legsDirections_i[2];
      legsDirections[i,3] := legsDirections_i[3];
      
    end for;

end legsDirections;
