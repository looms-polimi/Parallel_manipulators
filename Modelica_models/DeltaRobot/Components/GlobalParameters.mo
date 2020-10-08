within DeltaRobot.Components;

model GlobalParameters "This model includes all parameters that are shared between the models of this library"
    extends DeltaRobot.Icons.GlobalParameters; // Icon

    // Parameters
    // Base and platform parameters
    parameter DeltaRobot.Types.DiscParameters base(D=0.30) "Base parameters" annotation (Dialog(group="Base and platform"));
    parameter DeltaRobot.Types.DiscParameters platform(D=0.07) "Platform parameters" annotation (Dialog(group="Base and platform"));

    // Arms
    parameter DeltaRobot.Types.ArmParameters armParameters "Arms" annotation (Dialog(group="Arms"));

    // Servo motor
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters "Servo motors parameters" annotation (Dialog(group="Servo motors"));
    parameter DeltaRobot.Types.ReducerParameters reducerParameters "Parameters of the gear reducer" annotation (Dialog(group="Servo motors"));

    // Initialization
    parameter Boolean fixInitPosition = true "=true, if you want to use the platform initial position as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitVelocity = false "=true, if you want to use the platform initial velocity as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitAcceleration = false "=true, if you want to use the platform initial acceleration as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitOrientation = true "=true, if you want to use the platform initial orientation as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitAngularVel = false "=true, if you want to use the platform initial angular velocity as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitAngularAcc = false "=true, if you want to use the platform initial angular acceleration as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _useQuaternions = false "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter SI.Position initPlatformPos[3] = {0,0,-0.543} "Coordinates of the platform frame resolved in base frame" annotation(Dialog(group="Initialization"));

    // Limit parameters for functions and external models
    parameter SI.Angle maxTheta = armParameters.maxTheta "Max actuator angle" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minTheta = armParameters.minTheta "Min actuator angle" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxElbowAngle = armParameters.maxElbowAngle "Max internal angle between the upper arm and the parallelogram (180° means allignment)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minElbowAngle = armParameters.minElbowAngle "Min internal angle between the upper arm and the parallelogram (0° means overlap)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxParallelogramAngle = armParameters.maxParallelogramAngle "Max parallelogram direction angle (0° means rectangular shape)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minParallelogramAngle = armParameters.minParallelogramAngle "Min parallelogram direction angle (0° means rectangular shape)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxPlatformAngle = armParameters.maxPlatformAngle "Max angle between parallelogram and platform (180° means allignment)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minPlatformAngle = armParameters.minPlatformAngle "Min angle between parallelogram and platform (0° means overlap)" annotation(Dialog(group="Limit parameters for functions and external models"));

  annotation (
    defaultComponentName="gp",
    defaultComponentPrefixes="inner",
    missingInnerMessage="No \"gp\" (globalParameters)component is defined. Please
    drag DeltaRobot.GlobalParameters into the top level of your model.");

end GlobalParameters;
