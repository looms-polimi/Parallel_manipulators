within DeltaRobot.Functions;

function inverseKinematic "Return the angles of the three actuators for a given platform position"
    extends DeltaRobot.Icons.Function; // Icon
    
    // Imports
    import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

    // Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Length of the upper arms";
    input SI.Distance l "Length of the parallelograms (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    input SI.Angle beta_base "Angle from the x-axis of the base frame to the direction where the joint #1 is located";
    output SI.Angle theta[3] "Angles of the three actuators";

    // Intermediate parameters
protected
    Real a,b,c,E[3],F[3],G[3],t[3,2];
    SI.Radius Rb = Db/2 "Base radius";
    SI.Radius Rp = Dp/2 "Platform radius";
    TM.Orientation T = TM.axisRotation(3,beta_base-from_deg(-90)) "Transformation matrix from original base frame to a new base frame with 'beta=-90°'";
    SI.Position p_new[3] = TM.resolve2(T,p) "Platform coordinates in new base frame (beta=-90°)";
    
algorithm

    a := Rb-Rp;
    b := 3*Rp/sqrt(3)/2-sqrt(3)*Rb/2;
    c := Rp/2-Rb/2;

    E[1] := 2*L*(p_new[2]+a);
    F[1] := 2*L*p_new[3];
    G[1] := p_new[1]^2+p_new[2]^2+p_new[3]^2+a^2+L^2+2*p_new[2]*a-l^2;

    E[2] := -L*(sqrt(3)*(p_new[1]+b)+p_new[2]+c);
    F[2] := 2*p_new[3]*L;
    G[2] := p_new[1]^2+p_new[2]^2+p_new[3]^2+b^2+c^2+L^2+2*(p_new[1]*b+p_new[2]*c)-l^2;

    E[3] := L*(sqrt(3)*(p_new[1]-b)-p_new[2]-c);
    F[3] := 2*p_new[3]*L;
    G[3] := p_new[1]^2+p_new[2]^2+p_new[3]^2+b^2+c^2+L^2+2*(-p_new[1]*b+p_new[2]*c)-l^2;

    for i in 1:3 loop
        assert((E[i]^2+F[i]^2-G[i]^2)>=0, "inverseKinematic(): negative square root, the inputs are invalid.", level = AssertionLevel.error);
        t[i,1] := (-F[i]+sqrt(E[i]^2+F[i]^2-G[i]^2))/(G[i]-E[i]);
        t[i,2] := (-F[i]-sqrt(E[i]^2+F[i]^2-G[i]^2))/(G[i]-E[i]);
        theta[i] := 2*Modelica.Math.atan(t[i,2]);
    end for;

end inverseKinematic;
