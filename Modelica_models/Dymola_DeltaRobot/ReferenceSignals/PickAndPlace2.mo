within DeltaRobot.ReferenceSignals;
model PickAndPlace2
  //Parameters
    //Position
    parameter SI.Position P1[3] = {0.06,0.16,-0.605} "Start of the pick and place";
    parameter SI.Position P2[3] = {-0.06,-0.16,-0.605} "End of the pick and place";
    parameter SI.Position delta_z1(min = 0) = 0.035 "Up movement form P1 along z-axis";
    parameter SI.Position delta_z2(min = 0) = delta_z1 "Down movement to P2 along z-axis";

    //Limits
    parameter SI.Velocity maxSpeedVertical = 5 "Max platform speed along the two vertical trajectories";
    parameter SI.Acceleration maxAccelerationVertical = 2 "Max platform acceleration along the two vertical trajectories";
    parameter SI.Velocity maxSpeedHorizontal = maxSpeedVertical "Max platform speed along the horizontal trajectory";
    parameter SI.Acceleration maxAccelerationHorizontal = maxAccelerationVertical "Max platform acceleration along the horizontal trajectory";

    //Time
    parameter SI.Time startTime = 0;
    parameter SI.Time anticipation = 0.5;

    //Speed
    parameter SI.Velocity verticalHorizontalInitialSpeed = 0 "Speed of a trajectory that ends in the elbow";
    parameter SI.Velocity verticalHorizontalFinalSpeed = verticalHorizontalInitialSpeed "Speed of a trajectory that ends in the elbow";
    parameter SI.Velocity horizontalVerticalInitialSpeed = 0 "Speed of a trajectory that ends in the elbow";
    parameter SI.Velocity horizontalVerticalFinalSpeed = horizontalVerticalInitialSpeed "Speed of a trajectory that ends in the elbow";

    final parameter SI.Position P1_up[3] = P1+{0,0,1}*delta_z1 "Elbow point over P1";
    final parameter SI.Position P2_up[3] = P2+{0,0,1}*delta_z2 "Elbow point over P2";



  TrapezoidalTrajectory trapezoidalTrajectoryZUP(
    maxSpeed=100,
    maxAcceleration=5.35,
    stopPosition={0,0,-0.605 + 0.035},
    finalSpeed=0.6127,
    startTime=startTime,
    startPosition={0,0,-0.605}) annotation (Placement(transformation(extent={{-144,68},{-124,88}})));
  Interfaces.PoseDeMux poseDeMuxZUP annotation (Placement(transformation(extent={{-110,68},{-90,88}})));
  TrapezoidalTrajectory trapezoidalTrajectoryZDOWN(
    maxSpeed=100,
    maxAcceleration=5.35,
    initialSpeed=0.6127,
    startTime=trapezoidalTrajectoryZUP.stopTime,
    startPosition={0,0,0},
    stopPosition={0,0,-0.035}) annotation (Placement(transformation(extent={{-144,38},{-124,58}})));
  Interfaces.PoseDeMux poseDeMuxZDOWN annotation (Placement(transformation(extent={{-110,38},{-90,58}})));
  TrapezoidalTrajectory trapezoidalTrajectoryAB(
    startPosition={0.06,0.16,0},
    stopPosition={-0.06,-0.16,0},
    startTime=startTime,
    maxSpeed=2.25,
    maxAcceleration=29.19) annotation (Placement(transformation(extent={{-144,8},{-124,28}})));
  Interfaces.PoseDeMux poseDeMuxAB annotation (Placement(transformation(extent={{-110,8},{-90,28}})));
  Interfaces.Pose pose annotation (Placement(transformation(extent={{18,18},{78,78}})));
  Modelica.Blocks.Math.Sum sum[3](nin=3) annotation (Placement(transformation(extent={{-42,38},{-22,58}})));
  TrapezoidalTrajectory trapezoidalTrajectoryZUP1(
    maxSpeed=100,
    maxAcceleration=5.35,
    stopPosition={0,0,-0.605 + 0.035},
    finalSpeed=0.6127,
    startPosition={0,0,-0.605},
    startTime=trapezoidalTrajectoryAB.stopTime) annotation (Placement(transformation(extent={{-144,-26},{-124,-6}})));
  Interfaces.PoseDeMux poseDeMuxZUP1 annotation (Placement(transformation(extent={{-110,-26},{-90,-6}})));
  TrapezoidalTrajectory trapezoidalTrajectoryZDOWN1(
    maxSpeed=100,
    maxAcceleration=5.35,
    initialSpeed=0.6127,
    startPosition={0,0,0},
    stopPosition={0,0,-0.035},
    startTime=trapezoidalTrajectoryZUP1.stopTime) annotation (Placement(transformation(extent={{-144,-56},{-124,-36}})));
  Interfaces.PoseDeMux poseDeMuxZDOWN1 annotation (Placement(transformation(extent={{-110,-56},{-90,-36}})));
  TrapezoidalTrajectory trapezoidalTrajectoryAB1(
    maxSpeed=2.25,
    maxAcceleration=29.19,
    startTime=trapezoidalTrajectoryAB.stopTime,
    startPosition={-0.06,-0.16,0},
    stopPosition={0.06,0.16,0}) annotation (Placement(transformation(extent={{-144,-86},{-124,-66}})));
  Interfaces.PoseDeMux poseDeMuxAB1 annotation (Placement(transformation(extent={{-110,-86},{-90,-66}})));
  Modelica.Blocks.Math.Sum sum1[3](nin=3) annotation (Placement(transformation(extent={{-42,-56},{-22,-36}})));
  Interfaces.Pose pose1 annotation (Placement(transformation(extent={{18,-76},{78,-16}})));
  Interfaces.Pose pose2 annotation (Placement(transformation(extent={{72,-28},{132,32}})));
  Switch2 switch2_1(n=2) annotation (Placement(transformation(extent={{62,-8},{82,12}})));
equation
  connect(trapezoidalTrajectoryZUP.pose, poseDeMuxZUP.pose) annotation (Line(points={{-124,78},{-110,78}}, color={0,0,0}));
  connect(trapezoidalTrajectoryZDOWN.pose, poseDeMuxZDOWN.pose) annotation (Line(points={{-124,48},{-110,48}}, color={0,0,0}));
  connect(trapezoidalTrajectoryAB.pose, poseDeMuxAB.pose) annotation (Line(points={{-124,18},{-110,18}}, color={0,0,0}));
  connect(poseDeMuxZUP.position[1], sum[1].u[1]) annotation (Line(points={{-89,77.3333},{-44,77.3333},{-44,46.6667}}, color={0,0,127}));
  connect(poseDeMuxZDOWN.position[1], sum[1].u[2]) annotation (Line(points={{-89,47.3333},{-66,47.3333},{-66,48},{-44,48}}, color={0,0,127}));
  connect(poseDeMuxAB.position[1], sum[1].u[3]) annotation (Line(points={{-89,17.3333},{-44,17.3333},{-44,49.3333}}, color={0,0,127}));
  connect(poseDeMuxZUP.position[2], sum[2].u[1]) annotation (Line(points={{-89,78},{-44,78},{-44,46.6667}}, color={0,0,127}));
  connect(poseDeMuxZDOWN.position[2], sum[2].u[2]) annotation (Line(points={{-89,48},{-44,48}}, color={0,0,127}));
  connect(poseDeMuxAB.position[2], sum[2].u[3]) annotation (Line(points={{-89,18},{-44,18},{-44,49.3333}}, color={0,0,127}));
  connect(poseDeMuxZUP.position[3], sum[3].u[1]) annotation (Line(points={{-89,78.6667},{-70,78.6667},{-70,58},{-44,58},{-44,46.6667}}, color={0,0,127}));
  connect(poseDeMuxZDOWN.position[3], sum[3].u[2]) annotation (Line(points={{-89,48.6667},{-66,48.6667},{-66,48},{-44,48}}, color={0,0,127}));
  connect(poseDeMuxAB.position[3], sum[3].u[3]) annotation (Line(points={{-89,18.6667},{-44,18.6667},{-44,49.3333}}, color={0,0,127}));
  connect(sum.y, pose.position)
    annotation (Line(points={{-21,48},{10,48},{10,48.15},{48.15,48.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(poseDeMuxZUP.startTime, pose.startTime)
    annotation (Line(points={{-89,84},{48.15,84},{48.15,48.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(poseDeMuxAB.stopTime, pose.stopTime)
    annotation (Line(points={{-89,12},{48.15,12},{48.15,48.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(trapezoidalTrajectoryZUP1.pose, poseDeMuxZUP1.pose) annotation (Line(points={{-124,-16},{-110,-16}}, color={0,0,0}));
  connect(trapezoidalTrajectoryZDOWN1.pose, poseDeMuxZDOWN1.pose) annotation (Line(points={{-124,-46},{-110,-46}}, color={0,0,0}));
  connect(trapezoidalTrajectoryAB1.pose, poseDeMuxAB1.pose) annotation (Line(points={{-124,-76},{-110,-76}}, color={0,0,0}));
  connect(poseDeMuxZUP1.position[1], sum1[1].u[1]) annotation (Line(points={{-89,-16.6667},{-44,-16.6667},{-44,-47.3333}}, color={0,0,127}));
  connect(poseDeMuxZDOWN1.position[1], sum1[1].u[2]) annotation (Line(points={{-89,-46.6667},{-66,-46.6667},{-66,-46},{-44,-46}}, color={0,0,127}));
  connect(poseDeMuxAB1.position[1], sum1[1].u[3]) annotation (Line(points={{-89,-76.6667},{-44,-76.6667},{-44,-44.6667}}, color={0,0,127}));
  connect(poseDeMuxZUP1.position[2], sum1[2].u[1]) annotation (Line(points={{-89,-16},{-44,-16},{-44,-47.3333}}, color={0,0,127}));
  connect(poseDeMuxZDOWN1.position[2], sum1[2].u[2]) annotation (Line(points={{-89,-46},{-44,-46}}, color={0,0,127}));
  connect(poseDeMuxAB1.position[2], sum1[2].u[3]) annotation (Line(points={{-89,-76},{-44,-76},{-44,-44.6667}}, color={0,0,127}));
  connect(poseDeMuxZUP1.position[3], sum1[3].u[1]) annotation (Line(points={{-89,-15.3333},{-70,-15.3333},{-70,-36},{-44,-36},{-44,-47.3333}}, color={0,0,127}));
  connect(poseDeMuxZDOWN1.position[3], sum1[3].u[2]) annotation (Line(points={{-89,-45.3333},{-66,-45.3333},{-66,-46},{-44,-46}}, color={0,0,127}));
  connect(poseDeMuxAB1.position[3], sum1[3].u[3]) annotation (Line(points={{-89,-75.3333},{-44,-75.3333},{-44,-44.6667}}, color={0,0,127}));
  connect(sum1.y, pose1.position)
    annotation (Line(points={{-21,-46},{10,-46},{10,-45.85},{48.15,-45.85}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(poseDeMuxZUP1.startTime, pose1.startTime)
    annotation (Line(points={{-89,-10},{48.15,-10},{48.15,-45.85}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(poseDeMuxAB1.stopTime, pose1.stopTime)
    annotation (Line(points={{-89,-82},{48.15,-82},{48.15,-45.85}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(switch2_1.poseInput[1], pose) annotation (Line(points={{63,0.5},{63,22},{48,22},{48,48}}, color={0,0,0}));
  connect(switch2_1.poseInput[2], pose1) annotation (Line(points={{63,3.5},{63,-20},{48,-20},{48,-46}}, color={0,0,0}));
  connect(switch2_1.poseOutput, pose2) annotation (Line(points={{81,2},{102,2}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PickAndPlace2;
