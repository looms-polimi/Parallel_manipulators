within StewartPlatform.Components;

model Platform "Model of a the platform of a Stewart platform"
  extends Disc(final direction=StewartPlatform.Types.Direction.up, final discParameters = if useGlobalParameters == true then gp.platform else platform,
      bodyCylinder(
      final r_0(each fixed=fixInitPosition, start=if useGlobalParameters == true then gp.initPlatformPos else initPosition),
      final v_0(each fixed=fixInitVelocity),
      final a_0(each fixed=fixInitAcceleration),
      final angles_fixed=fixInitOrientation,
      final w_0_fixed=fixInitAngularVel,
      final z_0_fixed=fixInitAngularAcc,
      final angles_start=initAngles,
      final sequence_start=initSequence,
      final enforceStates=_enforceStates,
      final useQuaternions=_useQuaternions));

// Imports
    import Modelica.Mechanics.MultiBody.Frames;

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true
      "=true, if you want to use the platform parameters, initial position and orientation defined in 'gp' (GlobalParameters) object"
      annotation (choices(checkBox=true));
    parameter StewartPlatform.Types.DiscParameters platform(D=0.44, alpha=1.7453292519943) "Platform parameters";         
        
       
// Initialization
    parameter Boolean fixInitPosition = true "=true, if you want to use platform position as initial eqation"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitVelocity = false "=true, if you want to use the platform initial velocity as initial eqations"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitAcceleration = false "=true, if you want to use the platform initial acceleration as initial eqations"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitOrientation = true "=true, if you want to use the platform orientation as initial eqations"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitAngularVel = false "=true, if you want to use the initial angular velocity of the platform as initial eqations"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitAngularAcc = false "=true, if you want to use the initial angular acceleration of the platform as initial eqations"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean _useQuaternions = false "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));

    parameter SI.Position initPosition[3] = {0,0,1} "Coordinates of the platform frame resolved in base frame"
      annotation (Dialog(group="Initialization"));
    parameter Modelica.Mechanics.MultiBody.Types.RotationTypes
      rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis
      "Type of rotation description" annotation (Dialog(group="Initialization"), Evaluate = true);
    parameter Modelica.Mechanics.MultiBody.Types.Axis n={1,0,0}
      "Axis of rotation in base frame (= same as in base frame and platform frame)" annotation (
      Evaluate=true, Dialog(group="if rotationType = RotationAxis"));
    parameter NonSI.Angle_deg angle=0
      "Angle to rotate base frame around axis n into platform frame" annotation (Dialog(
        group="if rotationType = RotationAxis"));

    parameter Modelica.Mechanics.MultiBody.Types.Axis n_x={1,0,0}
      "Vector along x-axis of platform frame resolved in base frame" annotation (
      Evaluate=true, Dialog(group="if rotationType = TwoAxesVectors"));
    parameter Modelica.Mechanics.MultiBody.Types.Axis n_y={0,1,0}
      "Vector along y-axis of platform frame resolved in base frame" annotation (
      Evaluate=true, Dialog(group="if rotationType = TwoAxesVectors"));

    parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence(
      min={1,1,1},
      max={3,3,3}) = {1,2,3} "Sequence of rotations" annotation (Evaluate=true,
      Dialog(group="if rotationType = PlanarRotationSequence"));
    parameter NonSI.Angle_deg angles[3]={0,0,0}
      "Rotation angles around the axes defined in 'sequence'" annotation (
      Dialog(group="if rotationType = PlanarRotationSequence"));

    //Conversion of the orientation in a sequence of rotations
    final parameter Frames.Orientation R_rel=if useGlobalParameters == true
                                             then Frames.nullRotation()
                                             else if rotationType == Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis
                                             then
                                             Frames.planarRotation(Modelica.Math.Vectors.normalizeWithAssert(n),Cv.from_deg(angle),0)
                                             else if rotationType == Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors
                                             then
                                             Frames.from_nxy(n_x, n_y) else Frames.axesRotations(sequence, Cv.from_deg(angles),zeros(3))
                                             "Fixed rotation object from base frame to platform frame";

    final parameter Modelica.Mechanics.MultiBody.Types.RotationSequence initSequence=if useGlobalParameters == true then gp.initSequence else {1,2,3}
    "Sequence of rotations to rotate base frame into platform frame at initial time used for initialize bodyCylinder";

    final parameter SI.Angle initAngles[3]=if useGlobalParameters == true then gp.initAngles else Frames.axesRotationsAngles(R_rel,initSequence)
    "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame used for initialize bodyCylinder";

  annotation (Icon(graphics={Text(
          extent={{-100,-50},{-50,-100}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textStyle={TextStyle.Bold},
          textString="P")}));
end Platform;
