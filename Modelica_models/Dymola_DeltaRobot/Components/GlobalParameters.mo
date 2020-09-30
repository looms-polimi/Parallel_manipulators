within DeltaRobot.Components;
model GlobalParameters "Inside this model all shared parameters are defined so that multiple declarations are no more necessary"
  extends DeltaRobot.Icons.GlobalParameters;

  //Parameters
    //Base and platform parameters
    parameter DeltaRobot.Types.DiscParameters base(D=0.15*2) "Base parameters" annotation (Dialog(group="Base and platform"));
    parameter DeltaRobot.Types.DiscParameters platform(D=0.07) "Platform parameters" annotation (Dialog(group="Base and platform"));

    //Arms
    parameter DeltaRobot.Types.ArmParameters armParameters "Arms" annotation (Dialog(group="Arms"));

    //Servo motor
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters "Servo motors parameters" annotation (Dialog(group="Servo motors"));
    parameter DeltaRobot.Types.ReducerParameters reducerParameters "Parameters of the gear reducer" annotation (Dialog(group="Servo motors"));

    //Initialization
    parameter SI.Position platformPosition[3] = {0,0,-0.543} "Coordinates of the platform frame resolved in base frame"
      annotation(Dialog(group="Initial platform position"));

    //Limit parameters for functions and external models
    parameter SI.Angle maxTheta = armParameters.maxTheta "Max actuator angle" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minTheta = armParameters.minTheta "Min actuator angle" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxElbowAngle = armParameters.maxElbowAngle "Max internal angle between the upper arm and the parallelogram (=180 are aligned)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minElbowAngle = armParameters.minElbowAngle "Min internal angle between the upper arm and the parallelogram (=0 are overlap)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxParallelogramAngle = armParameters.maxParallelogramAngle "Max parallelogram direction angle (ParallelogramAngle=0->rectangle)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minParallelogramAngle = armParameters.minParallelogramAngle "Min parallelogram direction angle" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxPlatformAngle = armParameters.maxPlatformAngle "Max angle between parallelogram and platform" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minPlatformAngle = armParameters.minPlatformAngle "Min angle between parallelogram and platform" annotation(Dialog(group="Limit parameters for functions and external models"));

  annotation (
    defaultComponentName="gp",
    defaultComponentPrefixes="inner",
    missingInnerMessage="No \"gp\" (globalParameters)component is defined. Please
    drag DeltaRobot.GlobalParameters into the top level of your model.",
    Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)));
end GlobalParameters;
