within DeltaRobot.Components;

model Platform "Platform of a Delta robot"
    extends Disc(final direction=DeltaRobot.Types.Units.Direction.down, final discParameters=if useGlobalParameters then gp.platform else platform,
      bodyCylinder(
      final r_0(each fixed=if useGlobalParameters then gp.fixInitPosition else fixInitPosition, start=if useGlobalParameters then gp.initPlatformPos else initPlatformPos),
      final v_0(each fixed=if useGlobalParameters then gp.fixInitVelocity else fixInitVelocity, start=initPlatformVel),
      final a_0(each fixed=if useGlobalParameters then gp.fixInitAcceleration else fixInitAcceleration, start=initPlatformAcc),
      final angles_fixed=if useGlobalParameters then gp.fixInitOrientation else fixInitOrientation,
      final angles_start=initAngles,
      final sequence_start=initSequence,
      final w_0_fixed=if useGlobalParameters then gp.fixInitAngularVel else fixInitAngularVel,
      final w_0_start=initPlatformAngularVel,
      final z_0_fixed=if useGlobalParameters then gp.fixInitAngularAcc else fixInitAngularAcc,
      final z_0_start=initPlatformAngularAcc,
      final enforceStates=if useGlobalParameters then gp._enforceStates else _enforceStates,
      final useQuaternions=if useGlobalParameters then gp._useQuaternions else _useQuaternions,
      final sequence_angleStates=_sequence_angleStates));

    // Parameters
    outer DeltaRobot.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the base parameters defined in the 'gp' (GlobalParameters) object" annotation (choices(checkBox=true));
    parameter DeltaRobot.Types.DiscParameters base(D=0.30) "Base parameters";
    parameter DeltaRobot.Types.DiscParameters platform(D=0.07) "Platform parameters";    

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
    
    final parameter SI.Velocity initPlatformVel[3] = {0,0,0} "Initial platform velocity";
    final parameter SI.Acceleration initPlatformAcc[3] = {0,0,0} "Initial platform acceleration";
    final parameter SI.AngularVelocity initPlatformAngularVel[3]={0,0,0} "Initial platform angular velocity";
    final parameter SI.AngularAcceleration initPlatformAngularAcc[3]={0,0,0} "Initial platform angular acceleration";
    final parameter Modelica.Mechanics.MultiBody.Types.RotationSequence _sequence_angleStates={1,2,3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";

    final parameter Modelica.Mechanics.MultiBody.Types.RotationSequence initSequence={1,2,3} "Sequence of rotations to rotate base frame into platform frame at initial time. Used to initialize bodyCylinder";
    final parameter SI.Angle initAngles[3]={0,0,0} "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame. Used to initialize bodyCylinder"; //Platform and base are always parallel

end Platform;
