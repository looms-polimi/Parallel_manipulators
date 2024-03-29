within DeltaRobot.Components;

model Platform "Platform of a Delta Robot"
    extends DeltaRobot.Icons.Platform; // Icon
    extends Disc(final direction=DeltaRobot.Types.Units.Direction.down, final discParameters=if useGlobalParameters then gp.platform else platform,
      bodyCylinder(
      final r_0(each fixed=fix_initPlatformPos, start = if useGlobalParameters then gp.initPlatformPos+gp.basePos else initPlatformPos+basePos),
      final v_0(each fixed=fix_initPlatformVel),
      final a_0(each fixed=fix_initPlatformAcc),
      final angles_fixed=fix_initPlatformOrientation,
      final angles_start=initAngles,
      final sequence_start=initSequence,
      final w_0_fixed=fix_initPlatformAngularVel,
      final w_0_start=initPlatformAngularVel,
      final z_0_fixed=fix_initPlatformAngularAcc,      
      final z_0_start=initPlatformAngularAcc,
      final enforceStates=_enforceStates,
      final useQuaternions=_useQuaternions,
      final sequence_angleStates=_sequence_angleStates));

    // Imports
    import TY = Modelica.Mechanics.MultiBody.Types;

    // Parameters
    outer DeltaRobot.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the parameters defined in the 'gp' (GlobalParameters) object" annotation (choices(checkBox=true));
    parameter DeltaRobot.Types.DiscParameters platform(D=0.07) "Platform parameters";    

    // Initialization
    parameter Boolean fix_initPlatformPos = false "=true, if you want to use the platform initial position as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformVel = false "=true, if you want to use the platform initial velocity as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformAcc = false "=true, if you want to use the platform initial acceleration as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformOrientation = false "=true, if you want to use the platform initial orientation as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformAngularVel = false "=true, if you want to use the platform initial angular velocity as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformAngularAcc = false "=true, if you want to use the platform initial angular acceleration as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _useQuaternions = false "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation (Dialog(group="Initialization"), choices(checkBox=true));

    parameter SI.Position basePos[3] = {0,0,0} "Vector from world frame to base.frame_a resolved in world frame" annotation(Dialog(group="Initialization"));
    parameter SI.Position initPlatformPos[3] = {0,0,-0.543} "Coordinates of the platform frame resolved in base frame" annotation(Dialog(group="Initialization"));    
    final parameter SI.Velocity initPlatformVel[3] = {0,0,0} "Initial platform velocity";
    final parameter SI.Acceleration initPlatformAcc[3] = {0,0,0} "Initial platform acceleration";
    final parameter SI.AngularVelocity initPlatformAngularVel[3]={0,0,0} "Initial platform angular velocity";
    final parameter SI.AngularAcceleration initPlatformAngularAcc[3]={0,0,0} "Initial platform angular acceleration";
    final parameter Modelica.Mechanics.MultiBody.Types.RotationSequence _sequence_angleStates={1,2,3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";

    // (the orientation of the platform is parallel to the base and it is fixed)
    final parameter TY.RotationSequence initSequence=if useGlobalParameters then gp.initSequence else {1,2,3} "Sequence of rotations to rotate base frame into platform frame; used to initialize the model";
    final parameter SI.Angle initAngles[3]=if useGlobalParameters then gp.initAngles else {0,0,0} "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame; used to initialize the model";

end Platform;
