within DeltaRobot.ReferenceSignals;

model PickAndPlace
  extends DeltaRobot.Icons.PickAndPlace; // Icon

  // Parameters
    // Position
    parameter SI.Position P1[3] = {0.06,0.16,-0.605} "Start of the pick and place";
    parameter SI.Position P2[3] = {-0.06,-0.16,-0.605} "End of the pick and place";
    parameter SI.Position delta_z1(min = 0) = 0.035 "Up movement form P1 along z-axis";
    parameter SI.Position delta_z2(min = 0) = delta_z1 "Down movement to P2 along z-axis";

    // Limits
    parameter SI.Velocity maxSpeedVertical = 5 "Max platform speed along the two vertical trajectories";
    parameter SI.Acceleration maxAccelerationVertical = 2 "Max platform acceleration along the two vertical trajectories";
    parameter SI.Velocity maxSpeedHorizontal = maxSpeedVertical "Max platform speed along the horizontal trajectory";
    parameter SI.Acceleration maxAccelerationHorizontal = maxAccelerationVertical "Max platform acceleration along the horizontal trajectory";

    // Time
    parameter SI.Time startTime = 0;
    parameter SI.Time anticipation = 0.15;

    // Speed
    parameter SI.Velocity verticalHorizontalInitialSpeed = 0 "Speed of a trajectory that ends in the elbow";
    parameter SI.Velocity verticalHorizontalFinalSpeed = verticalHorizontalInitialSpeed "Speed of a trajectory that ends in the elbow";
    parameter SI.Velocity horizontalVerticalInitialSpeed = 0 "Speed of a trajectory that ends in the elbow";
    parameter SI.Velocity horizontalVerticalFinalSpeed = horizontalVerticalInitialSpeed "Speed of a trajectory that ends in the elbow";

    final parameter SI.Position P1_up[3] = P1+{0,0,1}*delta_z1 "Elbow point over P1";
    final parameter SI.Position P2_up[3] = P2+{0,0,1}*delta_z2 "Elbow point over P2";

    final parameter SI.Time startTime1 = startTime;
    final parameter SI.Time startTime2 = trapezoidalTrajectory1.stopTime-anticipation;
    final parameter SI.Time startTime3 = trapezoidalTrajectory2.stopTime-anticipation;
    final parameter SI.Time startTime4 = trapezoidalTrajectory3.stopTime;
    final parameter SI.Time startTime5 = trapezoidalTrajectory4.stopTime-anticipation;
    final parameter SI.Time startTime6 = trapezoidalTrajectory5.stopTime-anticipation;
    final parameter SI.Time totTime = trapezoidalTrajectory6.stopTime;

  // Variables
    SI.Velocity speed;
    Real x_for_plot "coordinate along the direction of pick and place";

  TrapezoidalTrajectory trapezoidalTrajectory1(startPosition=P1, stopPosition=P1_up,
    maxAcceleration=maxAccelerationVertical,
    maxSpeed=maxSpeedVertical,
    startTime=startTime1,
    finalSpeed=verticalHorizontalFinalSpeed)   annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  TrapezoidalTrajectory trapezoidalTrajectory2(
    startPosition=P1_up,
    stopPosition=P2_up,
    maxSpeed=maxSpeedHorizontal,
    maxAcceleration=maxAccelerationHorizontal,
    startTime=startTime2,
    initialSpeed=verticalHorizontalInitialSpeed,
    finalSpeed=horizontalVerticalFinalSpeed)   annotation (Placement(transformation(extent={{-100,52},{-80,72}})));
  TrapezoidalTrajectory trapezoidalTrajectory3(
    startTime=startTime3,
    startPosition=P2_up,
    stopPosition=P2,
    maxSpeed=maxSpeedVertical,
    maxAcceleration=maxAccelerationVertical,
    initialSpeed=horizontalVerticalInitialSpeed)
                                               annotation (Placement(transformation(extent={{-60,34},{-40,54}})));
  Junction junction1 annotation (Placement(transformation(extent={{-60,64},{-40,84}})));
  Interfaces.Pose pose annotation (Placement(transformation(extent={{70,-30},{130,30}})));
  Junction junction2 annotation (Placement(transformation(extent={{-26,48},{-6,68}})));
  TrapezoidalTrajectory trapezoidalTrajectory4(
    maxAcceleration=maxAccelerationVertical,
    maxSpeed=maxSpeedVertical,
    startPosition=P2,
    stopPosition=P2_up,
    startTime=startTime4,
    finalSpeed=verticalHorizontalFinalSpeed)   annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  TrapezoidalTrajectory trapezoidalTrajectory5(
    maxSpeed=maxSpeedHorizontal,
    maxAcceleration=maxAccelerationHorizontal,
    startPosition=P2_up,
    stopPosition=P1_up,
    startTime=startTime5,
    initialSpeed=verticalHorizontalInitialSpeed,
    finalSpeed=horizontalVerticalFinalSpeed)   annotation (Placement(transformation(extent={{-100,-48},{-80,-28}})));
  TrapezoidalTrajectory trapezoidalTrajectory6(
    maxSpeed=maxSpeedVertical,
    maxAcceleration=maxAccelerationVertical,
    startPosition=P1_up,
    stopPosition=P1,
    startTime=startTime6,
    initialSpeed=horizontalVerticalInitialSpeed)
                                               annotation (Placement(transformation(extent={{-60,-66},{-40,-46}})));
  Junction junction3 annotation (Placement(transformation(extent={{-60,-36},{-40,-16}})));
  Junction junction4 annotation (Placement(transformation(extent={{-26,-52},{-6,-32}})));
  Switch2 switch2_1(n=2) annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  Modelica.Blocks.Continuous.Derivative derivative[3](each T=0.001, each initType=Modelica.Blocks.Types.Init.SteadyState)
                                                      annotation (Placement(transformation(extent={{72,-60},{92,-40}})));
equation
  speed =  Modelica.Math.Vectors.norm(derivative.y);
  x_for_plot = 2.848*derivative[1].u;
  connect(trapezoidalTrajectory1.pose, junction1.poseIn1) annotation (Line(points={{-80,90},{-59.8,90},{-59.8,78.8}}, color={0,0,0}));

  connect(trapezoidalTrajectory2.pose, junction1.poseIn2) annotation (Line(points={{-80,62},{-59.8,62},{-59.8,71}}, color={0,0,0}));
  connect(junction1.pose, junction2.poseIn1) annotation (Line(points={{-40,74},{-25.8,74},{-25.8,62.8}}, color={0,0,0}));
  connect(trapezoidalTrajectory3.pose, junction2.poseIn2) annotation (Line(points={{-40,44},{-25.8,44},{-25.8,55}}, color={0,0,0}));
  connect(trapezoidalTrajectory4.pose,junction3. poseIn1) annotation (Line(points={{-80,-10},{-59.8,-10},{-59.8,-21.2}},
                                                                                                                      color={0,0,0}));
  connect(trapezoidalTrajectory5.pose,junction3. poseIn2) annotation (Line(points={{-80,-38},{-59.8,-38},{-59.8,-29}},
                                                                                                                    color={0,0,0}));
  connect(junction3.pose,junction4. poseIn1) annotation (Line(points={{-40,-26},{-25.8,-26},{-25.8,-37.2}},
                                                                                                         color={0,0,0}));
  connect(trapezoidalTrajectory6.pose,junction4. poseIn2) annotation (Line(points={{-40,-56},{-25.8,-56},{-25.8,-45}},
                                                                                                                    color={0,0,0}));
  connect(junction2.pose, switch2_1.poseInput[1]) annotation (Line(points={{-6,58},{29,58},{29,-1.5}}, color={0,0,0}));
  connect(junction4.pose, switch2_1.poseInput[2]) annotation (Line(points={{-6,-42},{29,-42},{29,1.5}}, color={0,0,0}));
  connect(switch2_1.poseOutput, pose) annotation (Line(points={{47,0},{100,0}}, color={0,0,0}));
  connect(derivative.u, pose.position) annotation (Line(points={{70,-50},{70,0.15},{100.15,0.15}}, color={0,0,127}));

end PickAndPlace;
