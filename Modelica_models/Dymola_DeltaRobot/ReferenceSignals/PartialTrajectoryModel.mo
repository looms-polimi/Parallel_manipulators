within DeltaRobot.ReferenceSignals;
model PartialTrajectoryModel "This model collects all the common parameters and interfaces of the trajectory models"

  //Imports
    import Modelica.Math.Vectors.*;

  //Parameters
    outer DeltaRobot.Components.GlobalParameters gp "Object with all global parameters";

    //Position
    parameter SI.Position startPosition[3] = gp.platformPosition "Initial platform position resolved in base frame" annotation(Dialog(group="Position"));
    parameter SI.Position stopPosition[3] = startPosition "Final platform position resolved in base frame" annotation(Dialog(group="Position"));
    final parameter Real direction[3] = normalize(stopPosition-startPosition) "Unit vector that indicates the direction of motion";
    final parameter SI.Distance totalDistance = norm(stopPosition-startPosition) "Distance from initial point to final point";

    //Time
    parameter SI.Time startTime(min=0) = 0 "output = startPosition  for  time<=startTime" annotation(Dialog(group="Time"));
    parameter SI.Time transitionTime(min=0) = 1 "Time required for the motion" annotation(Dialog(group="Time"));
    final parameter SI.Time stopTime = startTime + transitionTime "output = stopPosition  for  time>=stopTime";

    //Variables
    SI.Position position[3] "Current position vector";
    SI.Position distance "Current distance from 'startPosition' to the current position";

  Interfaces.Pose pose annotation (Placement(transformation(extent={{70,-30},{130,30}})));
  Modelica.Blocks.Routing.RealPassThrough realPassThrough[3] annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Sources.Constant const_startTime(k=startTime) annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Blocks.Sources.Constant const_stopTime(k=stopTime) annotation (Placement(transformation(extent={{20,-72},{40,-52}})));
equation
  assert(transitionTime>=0,"PartialTrajectoryModel: Invalid parameter.");
  realPassThrough.u=position;
  distance= if (direction*(position-startPosition))>0 then norm(position-startPosition) else -norm(position-startPosition);

  connect(realPassThrough.y, pose.position)
    annotation (Line(points={{41,0},{70,0},{70,0.15},{100.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(const_startTime.y, pose.startTime)
    annotation (Line(points={{41,-30},{100.15,-30},{100.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(const_stopTime.y, pose.stopTime)
    annotation (Line(points={{41,-62},{100.15,-62},{100.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="CopiatoDaSP");
end PartialTrajectoryModel;
