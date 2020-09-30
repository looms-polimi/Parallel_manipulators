within DeltaRobot.Components;
partial model PartialThreeArms

  //Imports
    import DeltaRobot.Functions.*;

  //Parameters

    outer DeltaRobot.Components.GlobalParameters gp;

    //Base and platform
    parameter DeltaRobot.Types.DiscParameters base = gp.base "Base parameters" annotation (Dialog(group="Base and platform"));
    parameter DeltaRobot.Types.DiscParameters platform = gp.platform "Platform parameters" annotation (Dialog(group="Base and platform"));

    //Arms
    parameter DeltaRobot.Types.ArmParameters armParameters = gp.armParameters "Arms" annotation (Dialog(group="Arms"));

    //Initialization
    parameter SI.Position platformPosition[3] = gp.platformPosition "Coordinates of the platform frame resolved in base frame"
      annotation(Dialog(group="Initialization"));

    final parameter SI.Angle initTheta[3] = inverseKinematic(platformPosition,armParameters.L,armParameters.l,base.D,platform.D) "Initial actuators angles for a given platform position";
    final parameter SI.Angle parallAngles[3,3] = parallelogramAngles(platformPosition,armParameters.L,armParameters.l,base.D,platform.D);

  //Variables
    SI.Torque motorTorqueDIS[3] "Torque applied by the morots";
    SI.AngularVelocity motorVelocityDIS[3] "Angular velocity of morots";

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_base[3] annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,100})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm1(
    r={armParameters.L,0,0},
    diameter=armParameters.D,
    density=4*armParameters.M/(armParameters.D^2*pi*armParameters.L))
                            annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,30})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm2(
    r={armParameters.L,0,0},
    density=4*armParameters.M/(armParameters.D^2*pi*armParameters.L),
    diameter=armParameters.D)
                            annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,30})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm3(
    r={armParameters.L,0,0},
    diameter=armParameters.D,
    density=4*armParameters.M/(armParameters.D^2*pi*armParameters.L))
                            annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={50,30})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, angles={-90,0,-90})
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,-44})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, angles={-90,0,150})
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,-44})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, angles={-90,0,30})
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={50,-44})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_platform[3]
    annotation (Placement(transformation(
        extent={{-17,-16},{17,16}},
        rotation=90,
        origin={-1,-100})));
  Parallelogram parall1(
    l=armParameters.l,
    h=armParameters.h,
    Dl=armParameters.Dl,
    Dh=armParameters.Dh,
    Ml=armParameters.Ml,
    Mh=armParameters.Mh,
    initUpperAngle=parallAngles[1, 1],
    initParallAngle=parallAngles[1, 2],
    initLowerAngle=parallAngles[1, 3],
    stateSelect=StateSelect.always) annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Parallelogram parall2(
    l=armParameters.l,
    h=armParameters.h,
    Dl=armParameters.Dl,
    Dh=armParameters.Dh,
    Ml=armParameters.Ml,
    Mh=armParameters.Mh,
    initUpperAngle=parallAngles[2, 1],
    initParallAngle=parallAngles[2, 2],
    initLowerAngle=parallAngles[2, 3]) annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Parallelogram parall3(
    l=armParameters.l,
    h=armParameters.h,
    Dl=armParameters.Dl,
    Dh=armParameters.Dh,
    Ml=armParameters.Ml,
    Mh=armParameters.Mh,
    initUpperAngle=parallAngles[3, 1],
    initParallAngle=parallAngles[3, 2],
    initLowerAngle=parallAngles[3, 3]) annotation (Placement(transformation(extent={{40,-20},{60,0}})));
equation
  connect(upperArm1.frame_b, parall1.frame_a) annotation (Line(
      points={{-50,20},{-50,0}},
      color={95,95,95},
      thickness=0.5));
  connect(upperArm2.frame_b, parall2.frame_a) annotation (Line(
      points={{0,20},{0,0}},
      color={95,95,95},
      thickness=0.5));
  connect(upperArm3.frame_b, parall3.frame_a) annotation (Line(
      points={{50,20},{50,0}},
      color={95,95,95},
      thickness=0.5));
  connect(parall1.frame_b, fixedRotation.frame_a) annotation (Line(
      points={{-50,-20},{-50,-34}},
      color={95,95,95},
      thickness=0.5));
  connect(parall2.frame_b, fixedRotation1.frame_a) annotation (Line(
      points={{0,-20},{0,-34}},
      color={95,95,95},
      thickness=0.5));
  connect(parall3.frame_b, fixedRotation2.frame_a) annotation (Line(
      points={{50,-20},{50,-34}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation.frame_b, frame_platform[1]) annotation (Line(
      points={{-50,-54},{-50,-111.333},{-1,-111.333}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation1.frame_b, frame_platform[2]) annotation (Line(
      points={{0,-54},{0,-78},{0,-100},{-1,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation2.frame_b, frame_platform[3]) annotation (Line(
      points={{50,-54},{50,-88.6667},{-1,-88.6667}},
      color={95,95,95},
      thickness=0.5));


  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)));
end PartialThreeArms;
