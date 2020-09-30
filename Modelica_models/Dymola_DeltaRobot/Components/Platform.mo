within DeltaRobot.Components;
model Platform "Platform of a Delta robot"

  extends Disc(final direction=DeltaRobot.Types.Direction.down, final discParameters = if useGlobalParameters == true then gp.platform else platform,
      bodyCylinder(
      final r_0(fixed=fixInitPosition, start=if useGlobalParameters == true then gp.platformPosition else initPosition),
      final angles_fixed=fixInitOrientation,
      final angles_start=initAngles,
      final sequence_start=initSequence));

  //Parameters
    outer DeltaRobot.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true
      "=true, if you want to use the platform parameters and its initial position as defined in the 'gp' (GlobalParameters) object"
      annotation (choices(checkBox=true));
    parameter DeltaRobot.Types.DiscParameters platform(D=0.044*2) "Platform parameters"
      annotation (Dialog(enable = not useGlobalParameters));

    parameter Boolean fixInitPosition = true "=true, if you want to use platform position as initial eqation"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean fixInitOrientation = true "=true, if you want to use the platform orientation as initial eqations"
      annotation (Dialog(group="Initialization"), choices(checkBox=true));

    parameter SI.Position initPosition[3] = {0,0,-1} "Coordinates of the platform frame resolved in base frame"
      annotation (Dialog(group="Initialization", enable = not useGlobalParameters));

    final parameter Modelica.Mechanics.MultiBody.Types.RotationSequence initSequence={1,2,3}
    "Sequence of rotations to rotate base frame into platform frame at initial time. Used to initialize bodyCylinder";

    final parameter SI.Angle initAngles[3]={0,0,0}
    "Initial values of angles to rotate base frame around 'initSequence' axes into platform frame. Used to initialize bodyCylinder"; //Platform and base are always parallel

  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="Finito");
end Platform;
