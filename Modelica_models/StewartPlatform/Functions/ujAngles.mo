within StewartPlatform.Functions;

function ujAngles "Return the two angles of the universal joint for a given direction"
    extends StewartPlatform.Icons.Function; // Icon
  
  //Imports
    import Modelica.Math.atan2;
    import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

  //Input & Output
    input Real v[3] "Input vector";
    input SI.Angle alpha = 0 "Universal joint orientation";
    output SI.Angle angles[2] "Rotation angles around x-axis and then new y-axis";

  //Intermediate values
protected
    TM.Orientation T = TM.planarRotation(Modelica.Math.Vectors.normalizeWithAssert({0,0,1}), -alpha)
      "Transformation matrix of the first rotation around z-axis"; //DON'T remove the normalization otherwise the function 'planarRotation' doesn't work correctly
    Real v_z[3] = TM.resolve1(T,v) "First rotation around z-axis";

algorithm
  assert(Modelica.Math.Vectors.norm(v) <> 0, "Function ujAngles: input vector can't be null.");

  angles[1] := -atan2(v_z[2],v_z[3]);
  angles[2] := atan2(v_z[1],sqrt(v_z[2]^2+v_z[3]^2));

end ujAngles;
