within DeltaRobot.Components;
model Parallelogram "Lower arm with parallelogram shape for a Delta robot"
  extends DeltaRobot.Icons.Parallelogram;

  //Parameters
    parameter SI.Distance l = 1.244 "Parallelogram length (long side)";
    parameter SI.Distance h = 0.131 "Parallelogram width (short side)";
    parameter SI.Diameter Dl = 0.01 "Diameter of the parallelogram long side";
    parameter SI.Diameter Dh = 0.01 "Diameter of the parallelogram short side";
    parameter SI.Mass Ml = 0.131 "Mass of the parallelogram long side";
    parameter SI.Mass Mh = 0.131 "Mass of the parallelogram short side";

    //Initialization
    parameter Boolean initialAnglesFixedUJ = false "=true, if you want to use initial angles of universal joint as initial eqation" annotation(Dialog(group="Initialization"));
    parameter Boolean initialAnglesFixedSJ = false "=true, if you want to use initial angles of spherical joint as initial eqation" annotation(Dialog(group="Initialization"));
    parameter SI.Angle initUpperAngle = 0 "Initial angle of the first rotation around z-axis of frame_a" annotation(Dialog(group="Initialization"));
    parameter SI.Angle initParallAngle = 0 "Inner angle of the parallelogram (=0 means a rectangle), second rotation around new y-axis" annotation(Dialog(group="Initialization"));
    parameter SI.Angle initLowerAngle = 0 "Initial angle of the last rotation around z-axis of frame_a" annotation(Dialog(group="Initialization"));
    parameter StateSelect stateSelect = StateSelect.prefer "Priority to use universal joint angles and their derivatives as states" annotation(Dialog(group="Initialization"));
    parameter Boolean sphericalJointEnforceStates = false
      "=true, if the variables of the spherical joint have to be selected as states" annotation(Dialog(group="Initialization"));

    //Animation
    parameter SI.Distance cylinderLength = 1/30 "Length of cylinder representing the joint axis" annotation(Dialog(group="Animation"));
    parameter SI.Diameter cylinderDiameter = 1/30 "Diameter of cylinder representing the joint axis" annotation(Dialog(group="Animation"));
    parameter SI.Diameter sphereDiameter=1/30 "Diameter of sphere representing the spherical joints" annotation(Dialog(group="Animation"));

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,100})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false, r={0,0,h/2})
                                                                 annotation (Placement(transformation(extent={{0,70},{20,90}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(r={0,0,-h},
    diameter=Dh,
    density=4*Mh/(Dh^2*pi*h))                                              annotation (Placement(transformation(extent={{12,48},{-12,72}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(
                                                               r={0,0,-h},
    diameter=Dh,
    density=4*Mh/(Dh^2*pi*h))                                              annotation (Placement(transformation(extent={{12,-72},{-12,-48}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(
                                                                 animation=false, r={0,0,h/2})
                                                                 annotation (Placement(transformation(extent={{0,-90},{20,-70}})));
  Modelica.Mechanics.MultiBody.Joints.Universal universal(n_a={0,0,1}, stateSelect=stateSelect,
    cylinderLength=cylinderLength,
    phi_a(fixed=initialAnglesFixedUJ, start=initUpperAngle),
    phi_b(fixed=initialAnglesFixedUJ, start=initParallAngle),
    cylinderDiameter=cylinderDiameter)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,50})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder2(r={l,0,0},
    diameter=Dl,
    density=4*Ml/(Dl^2*pi*l))
    annotation (Placement(transformation(
        extent={{12,-12},{-12,12}},
        rotation=90,
        origin={-40,0})));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(                                           useQuaternions=false,
    sphereDiameter=sphereDiameter,
    angles_start={0,-initParallAngle,initLowerAngle},
    enforceStates=sphericalJointEnforceStates,
    angles_fixed=initialAnglesFixedSJ)                                    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,-50})));
  Modelica.Mechanics.MultiBody.Joints.UniversalSpherical universalSpherical(rRod_ia={l*cos(initParallAngle),0,-l*sin(initParallAngle)},
    sphereDiameter=sphereDiameter,
    rodWidth=0,
    cylinderLength=cylinderLength,
    cylinderDiameter=cylinderDiameter,
    computeRodLength=true)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-2})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder3(
    diameter=Dl,
    density=4*Ml/(Dl^2*pi*l),
    r={l*cos(initParallAngle),0,-l*sin(initParallAngle)})
    annotation (Placement(transformation(
        extent={{12,-12},{-12,12}},
        rotation=90,
        origin={16,2})));
equation
  connect(frame_a, fixedRotation.frame_a) annotation (Line(
      points={{0,100},{0,80},{-8.88178e-016,80}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyCylinder.frame_a, fixedRotation.frame_b) annotation (Line(
      points={{12,60},{20,60},{20,80}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation1.frame_a, frame_b) annotation (Line(
      points={{0,-80},{0,-100}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyCylinder1.frame_a, fixedRotation1.frame_b) annotation (Line(
      points={{12,-60},{20,-60},{20,-80}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyCylinder.frame_b, universal.frame_a) annotation (Line(
      points={{-12,60},{-40,60}},
      color={95,95,95},
      thickness=0.5));
  connect(universal.frame_b, bodyCylinder2.frame_a) annotation (Line(
      points={{-40,40},{-40,12}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyCylinder2.frame_b, spherical.frame_a) annotation (Line(
      points={{-40,-12},{-40,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(spherical.frame_b, bodyCylinder1.frame_b) annotation (Line(
      points={{-40,-60},{-12,-60}},
      color={95,95,95},
      thickness=0.5));
  connect(universalSpherical.frame_a, bodyCylinder.frame_a) annotation (Line(
      points={{40,8},{40,60},{12,60}},
      color={95,95,95},
      thickness=0.5));
  connect(universalSpherical.frame_b, bodyCylinder1.frame_a) annotation (Line(
      points={{40,-12},{40,-54},{12,-54},{12,-60}},
      color={95,95,95},
      thickness=0.5));
  connect(universalSpherical.frame_ia, bodyCylinder3.frame_a) annotation (Line(
      points={{30,2},{24,2},{24,14},{16,14}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true), graphics={
        Line(points={{-88,92},{-52,92},{-56,94},{-56,90},{-52,92}}, color={28,108,200}),
        Text(
          extent={{-50,96},{-36,88}},
          lineColor={28,108,200},
          textString="Z"),
        Line(points={{-88,92},{-88,70},{-88,66},{-90,72},{-84,72},{-88,66}}, color={28,108,200}),
        Text(
          extent={{-84,78},{-70,68}},
          lineColor={28,108,200},
          textString="Y")}),
    __Dymola_LockedEditing="Finito");
end Parallelogram;
