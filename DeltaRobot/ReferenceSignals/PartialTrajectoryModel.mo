within DeltaRobot.ReferenceSignals;

model PartialTrajectoryModel "This model collects all the common parameters and interfaces of the trajectory models"

  // Imports
  import Modelica.Math.Vectors.*;

  // Parameters
  outer DeltaRobot.Components.GlobalParameters gp "Object with all global parameters";

  // Position
  parameter SI.Position startPosition[3] = gp.initPlatformPos "Initial platform position resolved in base frame" annotation(Dialog(group="Position"));
  parameter SI.Position stopPosition[3] = startPosition "Final platform position resolved in base frame" annotation(Dialog(group="Position"));
  final parameter Real direction[3] = normalize(stopPosition-startPosition) "Unit vector that indicates the direction of motion";
  final parameter SI.Distance totalDistance = norm(stopPosition-startPosition) "Distance from initial point to final point";

  // Time
  parameter SI.Time startTime(min=0) = 0 "output = startPosition  for  time<=startTime" annotation(Dialog(group="Time"));
  parameter SI.Time transitionTime(min=0) = 1 "Time required for the motion" annotation(Dialog(group="Time"));
  final parameter SI.Time stopTime = startTime + transitionTime "output = stopPosition  for  time>=stopTime";

  // Variables
  SI.Position position[3] "Current position vector";
  SI.Position distance "Current distance from 'startPosition' to the current position";

  // Models
  Interfaces.Pose pose annotation (Placement(transformation(extent={{70,-30},{130,30}})));
  Interfaces.PoseMux mux annotation (Placement(transformation(extent={{20,-10},{40,10}})));

  Modelica.Blocks.Sources.Constant const_startTime(k=startTime) annotation (Placement(visible = true, transformation(extent = {{-40, -20}, {-20, 0}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_stopTime(k=stopTime) annotation (Placement(visible = true, transformation(extent = {{-40, -52}, {-20, -32}}, rotation = 0)));

equation
  assert(transitionTime>=0,"PartialTrajectoryModel: Invalid parameter.");

  distance= if (direction*(position-startPosition))>0 then norm(position-startPosition) else -norm(position-startPosition);
  mux.positionIn=position;
  
  connect(mux.poseOut, pose) annotation(Line(points = {{40, 0}, {92, 0}, {92, 0}, {100, 0}}, thickness = 0.5));
  connect(const_startTime.y, mux.startTimeIn) annotation(Line(points = {{20, 0}, {0, 0}, {0, -10}, {-18, -10}, {-18, -10}}, color = {0, 0, 127}));
  connect(const_stopTime.y, mux.stopTimeIn) annotation(Line(points = {{20, -6}, {10, -6}, {10, -42}, {-18, -42}, {-18, -42}}, color = {0, 0, 127}));  

end PartialTrajectoryModel;
