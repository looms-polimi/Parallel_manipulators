within StewartPlatform.Components;

model Platform "Platform of a Stewart Platform"
  extends StewartPlatform.Icons.Platform; // Icon
  extends Disc(final direction=StewartPlatform.Types.Units.Direction.up, final discParameters = if useGlobalParameters then gp.platform else platform,
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
    import Modelica.Mechanics.MultiBody.Frames;
    import TY = Modelica.Mechanics.MultiBody.Types;

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the parameters defined in the 'gp' (GlobalParameters) object" annotation (choices(checkBox=true));
    parameter StewartPlatform.Types.DiscParameters platform(D=0.44, alpha=from_deg(100)) "Platform parameters";         
               
// Initialization
    parameter Boolean fix_initPlatformPos = false "=true, if you want to use the platform initial position as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformVel = false "=true, if you want to use the platform initial velocity as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformAcc = false "=true, if you want to use the platform initial acceleration as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformOrientation = false "=true, if you want to use the platform initial orientation as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformAngularVel = false "=true, if you want to use the platform initial angular velocity as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fix_initPlatformAngularAcc = false "=true, if you want to use the platform initial angular acceleration as initial equation" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _useQuaternions = false "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation (Dialog(group="Initialization"), choices(checkBox=true));

    parameter SI.Position basePos[3] = {0,0,0} "Vector from world frame to base.frame_a resolved in world frame" annotation (Dialog(group="Initialization"));
    parameter SI.Position initPlatformPos[3] = {0,0,1.45} "Coordinates of the platform frame resolved in base frame" annotation (Dialog(group="Initialization"));
    final parameter SI.Velocity initPlatformVel[3] = {0,0,0} "Initial platform velocity";
    final parameter SI.Acceleration initPlatformAcc[3] = {0,0,0} "Initial platform acceleration";
    final parameter SI.AngularVelocity initPlatformAngularVel[3]={0,0,0} "Initial platform angular velocity";
    final parameter SI.AngularAcceleration initPlatformAngularAcc[3]={0,0,0} "Initial platform angular acceleration";
    final parameter Modelica.Mechanics.MultiBody.Types.RotationSequence _sequence_angleStates={1,2,3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states";
    
    parameter TY.RotationTypes rotationType=TY.RotationTypes.RotationAxis "Type of rotation description" annotation (Dialog(group="Initialization"));
    
    parameter TY.Axis n={1,0,0} "Axis of rotation in base frame (= same as in base frame and platform frame)" annotation (Dialog(group="if rotationType = RotationAxis"));
    parameter NonSI.Angle_deg angle=0 "Angle to rotate base frame around axis n into platform frame" annotation (Dialog(group="if rotationType = RotationAxis"));

    parameter TY.Axis n_x={1,0,0} "Vector along x-axis of platform frame resolved in base frame" annotation (Dialog(group="if rotationType = TwoAxesVectors"));
    parameter TY.Axis n_y={0,1,0} "Vector along y-axis of platform frame resolved in base frame" annotation (Dialog(group="if rotationType = TwoAxesVectors"));

    parameter TY.RotationSequence sequence(min={1,1,1},max={3,3,3}) = {1,2,3} "Sequence of rotations" annotation (Dialog(group="if rotationType = PlanarRotationSequence"));
    parameter NonSI.Angle_deg angles[3]={0,0,0} "Rotation angles around the axes defined in 'sequence'" annotation (Dialog(group="if rotationType = PlanarRotationSequence"));

    //Conversion of the orientation in a sequence of rotations
    final parameter Frames.Orientation R_rel=if useGlobalParameters
                                             then Frames.nullRotation()
                                             else if rotationType == TY.RotationTypes.RotationAxis
                                             then
                                             Frames.planarRotation(Modelica.Math.Vectors.normalizeWithAssert(n),from_deg(angle),0)
                                             else if rotationType == TY.RotationTypes.TwoAxesVectors
                                             then
                                             Frames.from_nxy(n_x, n_y) else Frames.axesRotations(sequence, from_deg(angles),zeros(3))
                                             "Fixed rotation object from base frame to platform frame";

    final parameter TY.RotationSequence initSequence=if useGlobalParameters then gp.initSequence else {1,2,3} "Sequence of rotations to rotate base frame into platform frame; used to initialize the model";

    final parameter SI.Angle initAngles[3]=if useGlobalParameters then gp.initAngles else Frames.axesRotationsAngles(R_rel,initSequence) "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame; used to initialize the model";

end Platform;
