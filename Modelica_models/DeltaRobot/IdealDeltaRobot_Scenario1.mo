within DeltaRobot;
model IdealDeltaRobot_Scenario1
  extends Modelica.Icons.Example;

  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1},
    animateGravity=false,
    animateWorld=false)                          annotation (Placement(transformation(extent={{-90,68},{-70,88}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r=true, get_angles=true,
    animation=false,
    get_v=true,
    get_a=true)                                                                                   annotation (Placement(transformation(extent={{42,-56},{62,-36}})));
  inner Components.GlobalParameters gp(platformPosition={0.06,0.16,-0.605})
                                       annotation (Placement(transformation(extent={{-58,68},{-38,88}})));
  Components.Base base annotation (Placement(transformation(extent={{0,60},{40,20}})));
  Components.Platform platform annotation (Placement(transformation(extent={{12,-36},{28,-20}})));
  Components.IdealThreeArmsPos idealThreeArms(Tf=0.01)
                                              annotation (Placement(transformation(extent={{4,-16},{36,16}})));
  ReferenceSignals.InverseKinematic inverseKinematic annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  ReferenceSignals.PickAndPlace pickAndPlace1(
    maxSpeedVertical=100,
    horizontalVerticalFinalSpeed=0,
    verticalHorizontalInitialSpeed=0,
    maxSpeedHorizontal=2.277,
    maxAccelerationHorizontal=29.19,
    verticalHorizontalFinalSpeed=0,
    horizontalVerticalInitialSpeed=0,
    maxAccelerationVertical=5.36,
    anticipation=0.15) annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  ReferenceSignals.TorqueCommand torqueCommand(n=3, startTime=0.035)
                                                    annotation (Placement(transformation(extent={{-64,-46},{-44,-26}})));
  ReferenceSignals.SpeedCommand speedCommand(n=3, startTime=0.035)
                                                  annotation (Placement(transformation(extent={{-34,-46},{-14,-26}})));
  ReferenceSignals.PickAndPlace pickAndPlace2(
    maxSpeedVertical=100,
    maxAccelerationVertical=17.5,
    anticipation=0.04,
    verticalHorizontalInitialSpeed=1.1068,
    horizontalVerticalInitialSpeed=1.1068) annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
equation
  connect(base.frame_b, idealThreeArms.frame_base) annotation (Line(
      points={{20,20},{20,16}},
      color={95,95,95},
      thickness=0.5));
  connect(idealThreeArms.frame_platform, platform.frame_b) annotation (Line(
      points={{19.84,-16},{20,-16},{20,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(inverseKinematic.theta, idealThreeArms.angleRef) annotation (Line(points={{-13.4,0},{0.8,0}}, color={0,0,127}));
  connect(absoluteSensor.frame_a, platform.frame_a) annotation (Line(
      points={{42,-46},{20,-46},{20,-36}},
      color={95,95,95},
      thickness=0.5));
  connect(pickAndPlace2.pose, inverseKinematic.pose) annotation (Line(points={{-48,30},{-40,30},{-40,0},{-34,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end IdealDeltaRobot_Scenario1;
