within DeltaRobot;
model IdealDeltaRobot_Scenario2
  extends Modelica.Icons.Example;

  SI.Velocity platformSpeedModule;

  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1},
    animateGravity=false,
    animateWorld=false)                          annotation (Placement(transformation(extent={{-90,68},{-70,88}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r=true, get_angles=true,
    animation=false,
    get_v=true,
    get_a=true)                                                                                   annotation (Placement(transformation(extent={{38,-62},{58,-42}})));
  inner Components.GlobalParameters gp(platformPosition={0.06,0.16,-0.605})
                                       annotation (Placement(transformation(extent={{-58,68},{-38,88}})));
  Components.IdealThreeArmsVel idealThreeArmsVel(Tf=0.001) annotation (Placement(transformation(extent={{4,-16},{36,16}})));
  ReferenceSignals.SpeedCommand speedCommand(n=3) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  ReferenceSignals.TorqueCommand torqueCommand(n=3) annotation (Placement(transformation(extent={{-40,-42},{-20,-22}})));
  Components.Base base annotation (Placement(transformation(extent={{0,60},{40,20}})));
  Components.Platform platform annotation (Placement(transformation(extent={{12,-36},{28,-20}})));
equation
  platformSpeedModule = Modelica.Math.Vectors.norm(absoluteSensor.v);
  connect(base.frame_b, idealThreeArmsVel.frame_base) annotation (Line(
      points={{20,20},{20,16}},
      color={95,95,95},
      thickness=0.5));
  connect(idealThreeArmsVel.frame_platform, platform.frame_b) annotation (Line(
      points={{19.84,-16},{20,-16},{20,-20}},
      color={95,95,95},
      thickness=0.5));
  connect(platform.frame_a, absoluteSensor.frame_a) annotation (Line(
      points={{20,-36},{20,-52},{38,-52}},
      color={95,95,95},
      thickness=0.5));
  connect(speedCommand.speedRef, idealThreeArmsVel.speedRef) annotation (Line(points={{-19,0},{0.8,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=1.4));
end IdealDeltaRobot_Scenario2;
