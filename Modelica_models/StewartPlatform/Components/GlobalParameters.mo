within StewartPlatform.Components;

model GlobalParameters "This model includes all parameters that are shared between the models of this library"
        extends StewartPlatform.Icons.GlobalParameters; // Icon

    // Imports
        import Modelica.Mechanics.MultiBody.Frames;
        import TY = Modelica.Mechanics.MultiBody.Types;
        import StewartPlatform.Types.*;
        import StewartPlatform.Functions.*;

    // Parameters
        // Default
        parameter TY.RotationSequence defaultSequence={1,2,3} "Default sequence of rotations to define an orientation" annotation (Dialog(group="Default"));

        // Base and platform parameters
        parameter DiscParameters base(D=0.74, alpha=from_deg(12)) "Parameters of the base" annotation(Dialog(group="Base and platform"));
        parameter DiscParameters platform(D=0.44, alpha=from_deg(100)) "Parameters of the platform" annotation(Dialog(group="Base and platform"));

        // Initial platform position and orientation
        parameter SI.Position initPlatformPos[3] = {0,0,1.45} "Coordinates of the platform frame resolved in base frame" annotation(Dialog(tab="Initialization", group="Initial platform position and orientation"));
        
        parameter TY.RotationTypes rotationType=TY.RotationTypes.RotationAxis "Type of rotation description" annotation (Dialog(tab="Initialization", group="Initial platform position and orientation"), Evaluate=true);
        
        parameter TY.Axis n={1,0,0} "Axis of rotation in base frame (= same as in platform frame)" annotation(Evaluate=true, Dialog(tab="Initialization", group="if rotationType = RotationAxis"));
        parameter NonSI.Angle_deg angle=0 "Angle to rotate base frame around axis n into platform frame" annotation(Dialog(tab="Initialization", group="if rotationType = RotationAxis"));

        parameter TY.Axis n_x={1,0,0} "Vector along x-axis of platform frame resolved in base frame" annotation(Evaluate=true, Dialog(tab="Initialization", group="if rotationType = TwoAxesVectors"));
        parameter TY.Axis n_y={0,1,0} "Vector along y-axis of platform frame resolved in base frame" annotation(Evaluate=true, Dialog(tab="Initialization", group="if rotationType = TwoAxesVectors"));

        parameter TY.RotationSequence sequence = {1,2,3} "Sequence of rotations" annotation (Evaluate=true, Dialog(tab="Initialization", group="if rotationType = PlanarRotationSequence"));
        parameter NonSI.Angle_deg angles[3]={0,0,0} "Rotation angles around the axes defined in 'sequence'" annotation (Dialog(tab="Initialization", group="if rotationType = PlanarRotationSequence"));

        // Conversion of the orientation in a sequence of rotations
        final parameter Frames.Orientation R_rel=if rotationType == TY.RotationTypes.RotationAxis
                                                then
                                                Frames.planarRotation(Modelica.Math.Vectors.normalizeWithAssert(n),from_deg(angle),0)
                                                else if rotationType == TY.RotationTypes.TwoAxesVectors
                                                then
                                                Frames.from_nxy(n_x, n_y) else Frames.axesRotations(sequence, from_deg(angles),zeros(3))
                                                "Fixed rotation object from base frame to platform frame";

        final parameter TY.RotationSequence initSequence={1,2,3} "Sequence of rotations to rotate base frame into platform frame; used to initialize the model";

        final parameter SI.Angle initAngles[3]=Frames.axesRotationsAngles(R_rel,initSequence) "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame; used to initialize the model";

        // (Computation of parameters for the initialization of the legs)
        final parameter Real leg[6,3]=legsDirections(base,platform,initPlatformPos,initSequence,initAngles,true) "Initial legs direction resolved in base frame";
        final parameter SI.Length ec_initialLength[6] = legsLength(base,platform,initPlatformPos,initSequence,initAngles) "Initial legs length";
        final parameter SI.Angle uj_angles[6,2] = {ujAngles(leg[i],alpha[i]) for i in 1:6} "Initial rotation angles of the universal joints";

        // Universal joints
        // (Note: universalJointParameters[] needs uj_angles[] and alpha[], uj_angles[] needs alpha[]. alpha[] must be defined separately otherwise the system crashed).
        parameter SI.Angle alpha[6] = {from_deg(0), from_deg(0), from_deg(0), from_deg(0), from_deg(0), from_deg(0)} "Orientation of the universal joint: fix rotation around z-axis from frame_a" annotation (Dialog(group="Universal joints"));
        parameter UniversalJointParameters universalJointParameters[6] = 
        {
            UniversalJointParameters(stateSelect = StateSelect.never, initialAnglesFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, alpha = alpha[1], angles = uj_angles[1]),
            UniversalJointParameters(stateSelect = StateSelect.never, initialAnglesFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, alpha = alpha[2], angles = uj_angles[2]),
            UniversalJointParameters(stateSelect = StateSelect.never, initialAnglesFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, alpha = alpha[3], angles = uj_angles[3]),
            UniversalJointParameters(stateSelect = StateSelect.never, initialAnglesFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, alpha = alpha[4], angles = uj_angles[4]),
            UniversalJointParameters(stateSelect = StateSelect.never, initialAnglesFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, alpha = alpha[5], angles = uj_angles[5]),
            UniversalJointParameters(stateSelect = StateSelect.never, initialAnglesFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, alpha = alpha[6], angles = uj_angles[6])
        } "Parameters of the universal joints" annotation (Dialog(group="Universal joints"));

        // Electric Cylinders
        parameter ElectricCylinderParameters electricCylinderParameters[6] = 
        {
            ElectricCylinderParameters(stateSelect = StateSelect.always, initialLengthFixed = true, initialVelFixed = true, initialAccFixed = false, initialLength = ec_initialLength[1]),
            ElectricCylinderParameters(stateSelect = StateSelect.always, initialLengthFixed = true, initialVelFixed = true, initialAccFixed = false, initialLength = ec_initialLength[2]),
            ElectricCylinderParameters(stateSelect = StateSelect.always, initialLengthFixed = true, initialVelFixed = true, initialAccFixed = false, initialLength = ec_initialLength[3]),
            ElectricCylinderParameters(stateSelect = StateSelect.always, initialLengthFixed = true, initialVelFixed = true, initialAccFixed = false, initialLength = ec_initialLength[4]),
            ElectricCylinderParameters(stateSelect = StateSelect.always, initialLengthFixed = true, initialVelFixed = true, initialAccFixed = false, initialLength = ec_initialLength[5]),
            ElectricCylinderParameters(stateSelect = StateSelect.always, initialLengthFixed = true, initialVelFixed = true, initialAccFixed = false, initialLength = ec_initialLength[6])
        } "Parameters of the electric cylinders" annotation (Dialog(group="Electric cylinders"));     

        // Servo Motors
        parameter ServoMotorParameters servoMotorParameters[6] "Parameters of the servo motors" annotation (Dialog(group="Servo motors"));

        // Spherical joints
        parameter SphericalJointParameters sphericalJointParameters[6] = 
            fill(SphericalJointParameters(enforceStates = false, useQuaternions = false, initialAngularVelFixed = false, initialAngularAccFixed = false),6)
            "Parameters of the spherical joints" annotation (Dialog(group="Spherical joints"));

        // Limits
        parameter SI.Distance maxLength = electricCylinderParameters[1].maxLength "Max legs length (linear actuators have ECparameters.maxLength as max length)" annotation(Dialog(group="Limit parameters for functions and external models"));
        parameter SI.Distance minLength = electricCylinderParameters[1].minLength "Min legs length (linear actuators have ECparameters.minLength as min length)" annotation(Dialog(group="Limit parameters for functions and external models"));        

    equation
        assert(StewartPlatform.Functions.validPose(base,platform,initPlatformPos,initSequence,initAngles,maxLength,minLength),
                "GlobalParameters: Initial platform pose outside the operativity region",
                level = AssertionLevel.warning);

    annotation (
        defaultComponentName="gp",
        defaultComponentPrefixes="inner",
        missingInnerMessage="No \"gp\" (globalParameters)component is defined. Please
        drag StewartPlatform.GlobalParameters into the top level of your model.");

end GlobalParameters;
