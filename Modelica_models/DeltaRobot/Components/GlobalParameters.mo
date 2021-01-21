within DeltaRobot.Components;

model GlobalParameters "This model includes all parameters that are shared between the models of this library"
    extends DeltaRobot.Icons.GlobalParameters; // Icon

    // Imports
      import TY = Modelica.Mechanics.MultiBody.Types;
      import DeltaRobot.Types.*;
      import DeltaRobot.Functions.*;

    // Parameters
      // Base and platform parameters
      parameter DiscParameters base(D=0.30) "Parameters of the base" annotation(Dialog(group="Base and platform"));
      parameter DiscParameters platform(D=0.07) "Parameters of the platform" annotation(Dialog(group="Base and platform"));

      // Base and platform initial position and orientation
      parameter SI.Position basePos[3] = {0,0,0} "Vector from world frame to base.frame_a resolved in world frame" annotation(Dialog(tab="Initialization"));
      parameter SI.Position initPlatformPos[3] = {0,0,-0.543} "Coordinates of the platform frame resolved in base frame" annotation(Dialog(tab="Initialization"));

      // (the orientation of the platform is parallel to the base and it is fixed)
      final parameter TY.RotationSequence initSequence={1,2,3} "Sequence of rotations to rotate base frame into platform frame; used to initialize the model";
      final parameter SI.Angle initAngles[3]={0,0,0} "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame; used to initialize the model";
              
    // Arms
      parameter ArmParameters armParameters[3] =
      {
        ArmParameters(computeParallelogramLength = false),
        ArmParameters(computeParallelogramLength = false),
        ArmParameters(computeParallelogramLength = false)
      } "Parameters of the arms" annotation (Dialog(group="Arms"));    

//    // Actuators (if all 'fix' parameters and 'enforceStates' in Platform model are setted to 'false')
//      parameter ActuatorParameters actuatorParameters[3] =
//      {
//        ActuatorParameters(stateSelect = StateSelect.always, initialAngleFixed = true, initialAngularVelFixed = true, initialAngularAccFixed = false, initialAngle = initTheta[1]),
//        ActuatorParameters(stateSelect = StateSelect.always, initialAngleFixed = true, initialAngularVelFixed = true, initialAngularAccFixed = false, initialAngle = initTheta[2]),
//        ActuatorParameters(stateSelect = StateSelect.always, initialAngleFixed = true, initialAngularVelFixed = true, initialAngularAccFixed = false, initialAngle = initTheta[3])
//      } "Parameters of the rotary actuators" annotation (Dialog(group="Actuators"));

    // Actuators (if all parameters in Platform model are setted to 'false' except for 'enforceStates', 'fix_initPlatformPos' and 'fix_initPlatformVel')
      parameter ActuatorParameters actuatorParameters[3] =
      {
        ActuatorParameters(stateSelect = StateSelect.prefer, initialAngleFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, initialAngle = initTheta[1]),
        ActuatorParameters(stateSelect = StateSelect.prefer, initialAngleFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, initialAngle = initTheta[2]),
        ActuatorParameters(stateSelect = StateSelect.prefer, initialAngleFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, initialAngle = initTheta[3])
      } "Parameters of the rotary actuators" annotation (Dialog(group="Actuators"));

    // Reducers
      parameter ReducerParameters reducerParameters[3] "Parameters of the gearbox reducers" annotation (Dialog(group="Reducers"));

    // (Computation of parameters for the initialization of the arms)
      final parameter SI.Angle initTheta[3] = inverseKinematic(initPlatformPos, armParameters[1].L, armParameters[1].l, base.D, platform.D, base.beta) "Initial angles of the three actuators";
      final parameter SI.Angle parallAngles[3,3] = parallelogramAngles(initPlatformPos, armParameters[1].L, armParameters[1].l, base.D, platform.D, base.beta) "Rotation angles. In sequence: around upper revolute joint, parallelogram joint, lower revolute joint";



    // Servo motor
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters "Servo motors parameters" annotation (Dialog(group="Servo motors"));

    // Limit parameters for functions and external models
    parameter SI.Angle maxTheta = armParameters[1].maxTheta "Max actuator angle" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minTheta = armParameters[1].minTheta "Min actuator angle" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxElbowAngle = armParameters[1].maxElbowAngle "Max internal angle between the upper arm and the parallelogram (180° means allignment)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minElbowAngle = armParameters[1].minElbowAngle "Min internal angle between the upper arm and the parallelogram (0° means overlap)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxParallelogramAngle = armParameters[1].maxParallelogramAngle "Max parallelogram direction angle (0° means rectangular shape)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minParallelogramAngle = armParameters[1].minParallelogramAngle "Min parallelogram direction angle (0° means rectangular shape)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle maxPlatformAngle = armParameters[1].maxPlatformAngle "Max angle between parallelogram and platform (180° means allignment)" annotation(Dialog(group="Limit parameters for functions and external models"));
    parameter SI.Angle minPlatformAngle = armParameters[1].minPlatformAngle "Min angle between parallelogram and platform (0° means overlap)" annotation(Dialog(group="Limit parameters for functions and external models"));

  annotation (
    defaultComponentName="gp",
    defaultComponentPrefixes="inner",
    missingInnerMessage="No \"gp\" (globalParameters)component is defined. Please
    drag DeltaRobot.GlobalParameters into the top level of your model.");

end GlobalParameters;
