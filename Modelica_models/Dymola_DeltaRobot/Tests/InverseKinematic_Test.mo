within DeltaRobot.Tests;
model InverseKinematic_Test

  parameter Real arm[3,3]= DeltaRobot.Functions.upperArmsDirections(gp.platformPosition,gp.L,gp.l,gp.base.D,gp.platform.D)
    "Upper arm represented as vector, arm[#arm,#component]]";
  parameter Real parallelogram[3,3] = DeltaRobot.Functions.parallelogramDirection(gp.platformPosition,gp.L,gp.l,gp.base.D,gp.platform.D)
    "Parallelograms long sides represented as vector, parallelogram[#parallelogram,#component]]";
  parameter SI.Position Jp[3,3] =  DeltaRobot.Functions.jointsCoordinates(gp.platform) "Coordinates of the platform joints";

  inner Modelica.Mechanics.MultiBody.World world(defaultWidthFraction=80)
                                                 annotation (Placement(transformation(extent={{-90,68},{-70,88}})));
  Components.Base base annotation (Placement(transformation(extent={{-10,60},{10,40}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(r=arm[1])
                                                                 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,20})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(r=arm[2])
                                                                  annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,20})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(r=arm[3])
                                                                  annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,20})));
  inner Components.GlobalParameters gp(platformPosition={0.3,0.3,-1.25})
                                       annotation (Placement(transformation(extent={{-88,30},{-68,50}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(r=parallelogram[1])
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,-8})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation4(r=parallelogram[2])
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,-10})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation5(r=parallelogram[3])
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={40,-10})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r=gp.platformPosition, animation=false)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-84})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation6(r=Jp[1])
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-24,-74})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation7(r=Jp[2])
                                                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-58})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation8(r=Jp[3])
                                                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={22,-74})));
  Components.Platform platform(fixInitPosition=false, fixInitOrientation=false) annotation (Placement(transformation(extent={{8,-50},{28,-30}})));
equation
  connect(base.frame_b[1], fixedRotation.frame_a) annotation (Line(
      points={{0,41.0667},{-22,41.0667},{-22,30},{-40,30}},
      color={95,95,95},
      thickness=0.5));
  connect(base.frame_b[2], fixedRotation1.frame_a) annotation (Line(
      points={{0,40},{0,30}},
      color={95,95,95},
      thickness=0.5));
  connect(base.frame_b[3], fixedRotation2.frame_a) annotation (Line(
      points={{0,38.9333},{20,38.9333},{20,30},{40,30}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation.frame_b, fixedRotation3.frame_a) annotation (Line(
      points={{-40,10},{-40,2}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation1.frame_b, fixedRotation4.frame_a) annotation (Line(
      points={{-5.55112e-016,10},{0,10},{0,0}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation2.frame_b, fixedRotation5.frame_a) annotation (Line(
      points={{40,10},{40,0}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame_b, fixedRotation6.frame_a) annotation (Line(
      points={{5.55112e-016,-74},{-14,-74}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation7.frame_a, fixed.frame_b) annotation (Line(
      points={{0,-68},{0,-74}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame_b, fixedRotation8.frame_a) annotation (Line(
      points={{5.55112e-016,-74},{12,-74}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame_b, platform.frame_a) annotation (Line(
      points={{5.55112e-016,-74},{10,-74},{10,-50},{18,-50}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end InverseKinematic_Test;
