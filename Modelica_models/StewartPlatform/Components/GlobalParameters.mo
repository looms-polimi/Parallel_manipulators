within StewartPlatform.Components;

model GlobalParameters "This model includes all parameters that are shared between the models of this library"
        extends StewartPlatform.Icons.GlobalParameters; // Icon

    // Imports
        import Modelica.Mechanics.MultiBody.Frames;
        import TY = Modelica.Mechanics.MultiBody.Types;

    // Parameters
        // Default
        parameter Modelica.Mechanics.MultiBody.Types.RotationSequence defaultSequence={1,2,3} "Default sequence of rotations to define an orientation" annotation (Dialog(group="Default"));

        // Base and platform parameters
        parameter StewartPlatform.Types.DiscParameters base(D=0.74, alpha=from_deg(12)) "Base parameters" annotation (Dialog(group="Base and platform"));
        parameter StewartPlatform.Types.DiscParameters platform(D=0.44, alpha=from_deg(100)) "Platform parameters" annotation (Dialog(group="Base and platform"));

        // Servo motor
        parameter StewartPlatform.Types.ServoMotorParameters SMparameters "Servo motors parameters" annotation (Dialog(group="Servo motors"));
        
        // Electric cylinders
        parameter Types.ElectricCylinderParameters ECparameters "Electric cylinders parameters" annotation (Dialog(group="Electric cylinders"));

        // Universal joints
        parameter SI.Angle alpha[6] = {0,0,0,0,0,0} "Universal joints orientations" annotation (Dialog(group="Universal joints"));

        // Limits
        parameter SI.Distance maxLength = ECparameters.maxLength "Max legs length (linear actuators have ECparameters.maxLength as max length)"
            annotation(Dialog(group="Limit parameters for functions and external models"));
        parameter SI.Distance minLength = ECparameters.minLength "Min legs length (linear actuators have ECparameters.minLength as min length)"
            annotation(Dialog(group="Limit parameters for functions and external models"));

        // Initialization
        parameter SI.Position initPlatformPos[3] = {0,0,1.45} "Coordinates of the platform frame resolved in base frame" annotation(Dialog(tab="Initialization", group="Initial platform position and orientation"));
        
        parameter TY.RotationTypes rotationType=TY.RotationTypes.RotationAxis "Type of rotation description" annotation (Dialog(tab="Initialization", group="Initial platform position and orientation"), Evaluate=true);
        
        parameter TY.Axis n={1,0,0} "Axis of rotation in base frame (= same as in platform frame)" annotation(Evaluate=true, Dialog(tab="Initialization", group="if rotationType = RotationAxis"));
        parameter NonSI.Angle_deg angle=0 "Angle to rotate base frame around axis n into platform frame" annotation(Dialog(tab="Initialization", group="if rotationType = RotationAxis"));

        parameter TY.Axis n_x={1,0,0} "Vector along x-axis of platform frame resolved in base frame" annotation(Evaluate=true, Dialog(tab="Initialization", group="if rotationType = TwoAxesVectors"));
        parameter TY.Axis n_y={0,1,0} "Vector along y-axis of platform frame resolved in base frame" annotation(Evaluate=true, Dialog(tab="Initialization", group="if rotationType = TwoAxesVectors"));

        parameter TY.RotationSequence sequence(min={1,1,1}, max={3,3,3}) = {1,2,3} "Sequence of rotations" annotation (Evaluate=true, Dialog(tab="Initialization", group="if rotationType = PlanarRotationSequence"));
        parameter NonSI.Angle_deg angles[3]={0,0,0} "Rotation angles around the axes defined in 'sequence'" annotation (Dialog(tab="Initialization", group="if rotationType = PlanarRotationSequence"));

        // Conversion of the orientation in a sequence of rotations
        final parameter Frames.Orientation R_rel=if rotationType == TY.RotationTypes.RotationAxis
                                                then
                                                Frames.planarRotation(Modelica.Math.Vectors.normalizeWithAssert(n),Cv.from_deg(angle),0)
                                                else if rotationType == TY.RotationTypes.TwoAxesVectors
                                                then
                                                Frames.from_nxy(n_x, n_y) else Frames.axesRotations(sequence, Cv.from_deg(angles),zeros(3))
                                                "Fixed rotation object from base frame to platform frame";

        final parameter TY.RotationSequence initSequence={1,2,3} "Sequence of rotations to rotate base frame into platform frame; used to initialize the model";

        final parameter SI.Angle initAngles[3]=Frames.axesRotationsAngles(R_rel,initSequence) "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame; used to initialize the model";

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
