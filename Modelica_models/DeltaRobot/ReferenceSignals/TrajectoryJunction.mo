within DeltaRobot.ReferenceSignals;
model TrajectoryJunction "MEGLIO NON UTILIZZARE"

  //Parameters
    //Position
    parameter SI.Position startPosition1[3] = gp.platformPosition "Initial point of first trajectory" annotation(Dialog(group="First trajectory"));
    parameter SI.Position stopPosition1[3] = startPosition1 "Final point of first trajectory" annotation(Dialog(group="First trajectory"));
    parameter SI.Velocity finalSpeed1 = 0 "Final speed of first trajectory (direction = stopPosition1-startPosition1)" annotation(Dialog(group="First trajectory"));
    parameter SI.Time stopTime1 "Stop time of first trajectory" annotation(Dialog(group="First trajectory"));

    parameter SI.Position startPosition2[3] = gp.platformPosition "Initial point of second trajectory" annotation(Dialog(group="Second trajectory"));
    parameter SI.Position stopPosition2[3] = startPosition2 "Final point of second trajectory" annotation(Dialog(group="Second trajectory"));
    parameter SI.Velocity initialSpeed2 = 0 "Initial speed of first trajectory (direction = stopPosition1-startPosition1)" annotation(Dialog(group="Second trajectory"));
    parameter SI.Time startTime2 "Start time of second trajectory" annotation(Dialog(group="Second trajectory"));

    parameter SI.Position intersectionPoint[3] "Point where the two linear trajectories that define the junction intersect each other";
    parameter SI.Velocity intermediateVelocity "Velocity in the intermediate pont";


  //Varaible
  Real alpha "Weight for the switch";

  Interfaces.Pose pose annotation (Placement(transformation(extent={{70,-30},{130,30}})));
  Modelica.Blocks.Routing.RealPassThrough realPassThrough[3] annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.Constant const_startTime(k=stopTime1) annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Modelica.Blocks.Sources.Constant const_stopTime(k=startTime2)
                                                              annotation (Placement(transformation(extent={{40,-72},{60,-52}})));
  Interfaces.PoseDeMux poseDeMux1 annotation (Placement(transformation(extent={{-16,20},{4,40}})));
  Interfaces.PoseDeMux poseDeMux2 annotation (Placement(transformation(extent={{-16,-40},{4,-20}})));
  CubicTrajectory cubicTrajectory1(
    stopPosition=intersectionPoint,
    startPosition=stopPosition1,
    initialSpeed=finalSpeed1,
    startTime=stopTime1,
    finalSpeed=initialSpeed2,
    transitionTime=startTime2 - stopTime1)
                              annotation (Placement(transformation(extent={{-58,20},{-38,40}})));
  CubicTrajectory cubicTrajectory2(
    startPosition=intersectionPoint,
    stopPosition=startPosition2,
    startTime=stopTime1,
    initialSpeed=finalSpeed1,
    finalSpeed=initialSpeed2,
    transitionTime=startTime2 - stopTime1)
                                annotation (Placement(transformation(extent={{-58,-40},{-38,-20}})));
equation
  realPassThrough.u = (1-alpha)*poseDeMux1.position+alpha*poseDeMux2.position;

  if time<stopTime1 then
    alpha = 0;
  elseif time>startTime2 then
    alpha=1;
  else
    alpha = (time-stopTime1)/(startTime2-stopTime1);
  end if;


  connect(realPassThrough.y, pose.position) annotation (Line(points={{61,0},{82,0},{82,0.15},{100.15,0.15}}, color={0,0,127}));
  connect(const_startTime.y, pose.startTime) annotation (Line(points={{61,-30},{100.15,-30},{100.15,0.15}}, color={0,0,127}));
  connect(const_stopTime.y, pose.stopTime) annotation (Line(points={{61,-62},{100.15,-62},{100.15,0.15}}, color={0,0,127}));
  connect(cubicTrajectory1.pose, poseDeMux1.pose) annotation (Line(points={{-38,30},{-16,30}}, color={0,0,0}));
  connect(cubicTrajectory2.pose, poseDeMux2.pose) annotation (Line(points={{-38,-30},{-16,-30}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="NON_UTILIZZARE");
end TrajectoryJunction;
