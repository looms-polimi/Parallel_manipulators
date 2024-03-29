within DeltaRobot.ReferenceSignals;

model Junction "Junction between two trajectories"
  extends DeltaRobot.Icons.Junction; // Icon

  // Varaible
  Real alpha "Weight for the switch";

  // Models
  Interfaces.Pose poseIn1 annotation (Placement(transformation(extent={{-128,18},{-68,78}})));
  Interfaces.Pose poseIn2 annotation (Placement(transformation(extent={{-128,-60},{-68,0}})));
  Interfaces.PoseDeMux poseDeMux1 annotation (Placement(transformation(extent={{-60,38},{-40,58}})));
  Interfaces.PoseDeMux poseDeMux2 annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Interfaces.Pose pose annotation (Placement(transformation(extent={{70,-30},{130,30}})));
  Modelica.Blocks.Routing.RealPassThrough posOut[3] annotation (Placement(transformation(extent={{42,-10},{62,10}})));

equation
  assert(poseDeMux1.startTimeOut<=poseDeMux2.startTimeOut,
  "Junction: the second trajectory starts before the start of the first one. It must be pose1.startTime<=pose2.startTime",
  level = AssertionLevel.error);

  assert(poseDeMux2.startTimeOut<=poseDeMux1.stopTimeOut,
  "Junction: the second trajectory starts after the end the first one. It must be pose2.startTime<=pose1.stopTime",
  level = AssertionLevel.error);

  assert(poseDeMux1.stopTimeOut<=poseDeMux2.stopTimeOut,
  "Junction: the second trajectory ends before the end the first one. It must be pose1.stopTime<=pose2.stopTime",
  level = AssertionLevel.error);

  posOut.u = (1-alpha)*poseDeMux1.positionOut+alpha*poseDeMux2.positionOut;

  if time<=poseDeMux2.startTimeOut then
    alpha = 0;
  elseif time>=poseDeMux1.stopTimeOut then
    alpha=1;
  else
    alpha = (time-poseDeMux2.startTimeOut)/(poseDeMux1.stopTimeOut-poseDeMux2.startTimeOut);
  end if;


  connect(poseIn1, poseDeMux1.poseIn) annotation (Line(points={{-98,48},{-60,48}}, color={0,0,0}));
  connect(poseDeMux2.poseIn, poseIn2) annotation (Line(points={{-60,-30},{-98,-30}}, color={0,0,0}));
  connect(posOut.y, pose.position)
    annotation (Line(points={{63,0},{82,0},{82,0.15},{100.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(poseDeMux1.startTimeOut, pose.startTime)
    annotation (Line(points={{-39,54},{100.15,54},{100.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(poseDeMux2.stopTimeOut, pose.stopTime)
    annotation (Line(points={{-39,-36},{100.15,-36},{100.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

end Junction;
