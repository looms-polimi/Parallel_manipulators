within DeltaRobot;
model DeltaRobot_Scenario1
  extends Modelica.Icons.Example;

  Components.Base base annotation (Placement(transformation(extent={{0,60},{40,20}})));
  Components.Platform platform annotation (Placement(transformation(extent={{12,-36},{28,-20}})));
  Components.ThreeArms threeArms annotation (Placement(transformation(extent={{4,-16},{36,16}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1},
    animateGravity=false,
    animateWorld=false)                          annotation (Placement(transformation(extent={{-90,68},{-70,88}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r=true, get_angles=true,
    animation=false,
    get_v=true,
    get_a=true)                                                                                   annotation (Placement(transformation(extent={{42,-56},{62,-36}})));
  inner Components.GlobalParameters gp(reducerParameters(viscousCoeff_a=0.1, viscousCoeff_b=0.1)) annotation (Placement(transformation(extent={{-60,68},{-40,88}})));
  Components.Controller controller(
    controllerType=Modelica.Blocks.Types.SimpleController.PID,
    P=100,
    Td=0.01,
    preFilterTimeConstant=0.000001,
    postFilterTimeConstant=0.000001,
    Ti=0.01) annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  ReferenceSignals.LinearTrajectory linearTrajectory(
    startTime=1,
    stopPosition={0.3,0.3,-0.543},
    transitionTime=0.5) annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
equation
  connect(base.frame_b, threeArms.frame_base) annotation (Line(
      points={{20,20},{20,16}},
      color={95,95,95},
      thickness=0.5));
  connect(platform.frame_b, threeArms.frame_platform) annotation (Line(
      points={{20,-20},{20,-16},{19.84,-16}},
      color={95,95,95},
      thickness=0.5));
  connect(absoluteSensor.frame_a, platform.frame_a) annotation (Line(
      points={{42,-46},{20,-46},{20,-36}},
      color={95,95,95},
      thickness=0.5));
  connect(controller.controlBus, threeArms.controlBus) annotation (Line(
      points={{-10,0},{4,0}},
      color={255,204,51},
      thickness=0.5));
  connect(linearTrajectory.pose, controller.inputPose) annotation (Line(points={{-48,0},{-30,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=2));
end DeltaRobot_Scenario1;
