within DeltaRobot.ReferenceSignals;
model PickAndPlaceOld

  parameter SI.Time startTime = 0;
  parameter SI.Position y_module = 0.225 "Motion from -y to y and back";
  parameter SI.Position z_low = -0.600 "";
  parameter SI.Position z_high = -0.58 "";
  parameter SI.Velocity maxSpeed = 17 "Max platform speed (direction = stopPosition-startPosition, in base frame)";
  parameter SI.Acceleration maxAcceleration = 50 "Max platform acceleration (direction = stopPosition-startPosition, in base frame)";

  final parameter SI.Time time1 = trapezoidalTrajectory1.transitionTime;
  final parameter SI.Time time2 = trapezoidalTrajectory2.transitionTime;
  final parameter SI.Time time3 = trapezoidalTrajectory3.transitionTime;
  final parameter SI.Time time4 = trapezoidalTrajectory4.transitionTime;
  final parameter SI.Time time5 = trapezoidalTrajectory5.transitionTime;
  final parameter SI.Time time6 = trapezoidalTrajectory6.transitionTime;
  final parameter SI.Time totTime = startTime+time1+time2+time3+time4+time5+time6;

  TrapezoidalTrajectory trapezoidalTrajectory1(maxSpeed=maxSpeed, maxAcceleration=maxAcceleration,
    startPosition={0,-y_module,z_low},
    stopPosition={0,-y_module,z_high},
    startTime=startTime)                       annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  TrapezoidalTrajectory trapezoidalTrajectory2(maxSpeed=maxSpeed, maxAcceleration=maxAcceleration,
    startPosition={0,-y_module,z_high},
    stopPosition={0,y_module,z_high},
    startTime=startTime + time1)               annotation (Placement(transformation(extent={{-80,32},{-60,52}})));
  TrapezoidalTrajectory trapezoidalTrajectory3(maxSpeed=maxSpeed, maxAcceleration=maxAcceleration,
    startPosition={0,y_module,z_high},
    stopPosition={0,y_module,z_low},
    startTime=startTime + time1 + time2)       annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  TrapezoidalTrajectory trapezoidalTrajectory4(maxSpeed=maxSpeed, maxAcceleration=maxAcceleration,
    startPosition={0,y_module,z_low},
    stopPosition={0,y_module,z_high},
    startTime=startTime + time1 + time2 + time3)
                                               annotation (Placement(transformation(extent={{-80,-28},{-60,-8}})));
  TrapezoidalTrajectory trapezoidalTrajectory5(maxSpeed=maxSpeed, maxAcceleration=maxAcceleration,
    startPosition={0,y_module,z_high},
    stopPosition={0,-y_module,z_high},
    startTime=startTime + time1 + time2 + time3 + time4)
                                               annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  TrapezoidalTrajectory trapezoidalTrajectory6(maxSpeed=maxSpeed, maxAcceleration=maxAcceleration,
    startPosition={0,-y_module,z_high},
    stopPosition={0,-y_module,z_low},
    startTime=startTime + time1 + time2 + time3 + time4 + time5)
                                               annotation (Placement(transformation(extent={{-80,-88},{-60,-68}})));
  Interfaces.Pose pose annotation (Placement(transformation(extent={{68,-30},{128,30}})));
  Modelica.Blocks.Routing.RealPassThrough Position[3] annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  if time<startTime then
    Position.u=trapezoidalTrajectory1.position;
  elseif time<startTime+time1 then
    Position.u=trapezoidalTrajectory1.position;
  elseif time<startTime+time1+time2 then
    Position.u=trapezoidalTrajectory2.position;
  elseif time<startTime+time1+time2+time3 then
    Position.u=trapezoidalTrajectory3.position;
  elseif time<startTime+time1+time2+time3+time4 then
    Position.u=trapezoidalTrajectory4.position;
  elseif time<startTime+time1+time2+time3+time4+time5 then
    Position.u=trapezoidalTrajectory5.position;
  else
    Position.u=trapezoidalTrajectory6.position;
  end if;


  connect(pose.position, Position.y) annotation (Line(points={{98.15,0.15},{81,0.15},{81,0},{61,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)));
end PickAndPlaceOld;
