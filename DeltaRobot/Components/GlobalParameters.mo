within DeltaRobot.Components;

model GlobalParameters "This model includes all parameters that are shared between the models of this library"
    extends DeltaRobot.Icons.GlobalParameters; // Icon

    // Imports
      import TY = Modelica.Mechanics.MultiBody.Types;
      import DeltaRobot.Types.*;
      import DeltaRobot.Functions.*;
      import ModelicaServices.Machine.eps; //this constant is used to check if two real numbers are equal

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

    // Actuator
      parameter Real actuatorParameters_Tf = 0.01 annotation (Dialog(group="Actuators")); // (simple solution to edit only this parameter in the scenarios for the model validation)
//    // Actuators (if all 'fix' parameters and 'enforceStates' in Platform model are setted to 'false')
//      parameter ActuatorParameters actuatorParameters[3] =
//      {
//        ActuatorParameters(stateSelect = StateSelect.always, initialAngleFixed = true, initialAngularVelFixed = true, initialAngularAccFixed = false, initialAngle = initTheta[1], Tf = actuatorParameters_Tf),
//        ActuatorParameters(stateSelect = StateSelect.always, initialAngleFixed = true, initialAngularVelFixed = true, initialAngularAccFixed = false, initialAngle = initTheta[2], Tf = actuatorParameters_Tf),
//        ActuatorParameters(stateSelect = StateSelect.always, initialAngleFixed = true, initialAngularVelFixed = true, initialAngularAccFixed = false, initialAngle = initTheta[3], Tf = actuatorParameters_Tf)
//      } "Parameters of the rotary actuators" annotation (Dialog(group="Actuators"));

    // Actuators (if all parameters in Platform model are setted to 'false' except for 'enforceStates', 'fix_initPlatformPos' and 'fix_initPlatformVel')
      parameter ActuatorParameters actuatorParameters[3] =
      {
        ActuatorParameters(stateSelect = StateSelect.prefer, initialAngleFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, initialAngle = initTheta[1], Tf = actuatorParameters_Tf),
        ActuatorParameters(stateSelect = StateSelect.prefer, initialAngleFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, initialAngle = initTheta[2], Tf = actuatorParameters_Tf),
        ActuatorParameters(stateSelect = StateSelect.prefer, initialAngleFixed = false, initialAngularVelFixed = false, initialAngularAccFixed = false, initialAngle = initTheta[3], Tf = actuatorParameters_Tf)
      } "Parameters of the rotary actuators" annotation (Dialog(group="Actuators"));

    // Reducers
      parameter ReducerParameters reducerParameters[3] "Parameters of the gearbox reducers" annotation (Dialog(group="Reducers"));

    // (Computation of parameters for the initialization of the arms)
      final parameter SI.Angle initTheta[3] = inverseKinematic(initPlatformPos, armParameters[1].L, armParameters[1].l, base.D, platform.D, base.beta) "Initial angles of the three actuators";
      final parameter SI.Angle parallAngles[3,3] = parallelogramAngles(initPlatformPos, armParameters[1].L, armParameters[1].l, base.D, platform.D, base.beta) "Rotation angles. In sequence: around upper revolute joint, parallelogram joint, lower revolute joint";



    // Servo motor
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters "Servo motors parameters" annotation (Dialog(group="Servo motors"));

equation
    // Asserts
    // (if the parameters 'L' and 'l' are not equal for all the arms the Inverse Kinematic cannot be computed)
    assert(abs(armParameters[1].L - armParameters[2].L)<=eps and abs(armParameters[1].L - armParameters[3].L)<=eps, "The arms do not have the same parameter 'L', upper arm length", level = AssertionLevel.error);
    assert(abs(armParameters[1].l - armParameters[2].l)<=eps and abs(armParameters[1].l - armParameters[3].l)<=eps, "The arms do not have the same parameter 'l', length of the long side of the parallelogram", level = AssertionLevel.error);

  annotation (
    defaultComponentName="gp",
    defaultComponentPrefixes="inner",
    missingInnerMessage="No \"gp\" (globalParameters)component is defined. Please
    drag DeltaRobot.GlobalParameters into the top level of your model.");

end GlobalParameters;
