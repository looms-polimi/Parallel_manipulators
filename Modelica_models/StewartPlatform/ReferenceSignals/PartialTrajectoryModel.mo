within StewartPlatform.ReferenceSignals;

partial model PartialTrajectoryModel "This model collects all the common parameters and interfaces of the trajectory models"

  //Imports
    import Modelica.Mechanics.MultiBody.Frames;
    import Modelica.Math.Vectors.*;

  //Parameters
    outer StewartPlatform.Components.GlobalParameters gp "Object with all global parameters";

    parameter Modelica.Mechanics.MultiBody.Types.RotationSequence outputSequence=gp.defaultSequence
    "Sequence of rotations in which the output pose is defined";

    //Position
    parameter SI.Position startPosition[3] = gp.initPlatformPos "Initial platform position resolved in base frame" annotation(Dialog(group="Position"));
    parameter SI.Position stopPosition[3] = startPosition "Final platform position resolved in base frame" annotation(Dialog(group="Position"));
    final parameter Real direction[3] = normalize(stopPosition-startPosition) "Unit vector that indicates the direction of motion";
    final parameter SI.Distance totalDistance = norm(stopPosition-startPosition) "Distance from initial point to final point";

    //Orientation (the user can insert the orientations in the form he prefers, then they are converted in a sequence of rotations around 'outputSequence' axes)
    //Initial orientation

    parameter Modelica.Mechanics.MultiBody.Types.RotationTypes
      rotationType_start=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence
      "Start: type of rotation description" annotation(Dialog(group="Initial orientation", tab="Orientation"), Evaluate=true);

    parameter Modelica.Mechanics.MultiBody.Types.Axis n_start={1,0,0}
      "Start: axis of rotation in base frame (= same as in platform frame)"
      annotation(Evaluate=true, Dialog(group="if rotationType_start = RotationAxis", tab="Orientation"));
    parameter NonSI.Angle_deg angle_start=0
      "Start: angle to rotate base frame around axis n_start into platform frame"
      annotation(Dialog(group="if rotationType_start = RotationAxis", tab="Orientation"));

    parameter Modelica.Mechanics.MultiBody.Types.Axis n_x_start={1,0,0}
      "Start: vector along x-axis of platform frame resolved in base frame"
      annotation(Evaluate=true, Dialog(group="if rotationType_start = TwoAxesVectors", tab="Orientation"));
    parameter Modelica.Mechanics.MultiBody.Types.Axis n_y_start={0,1,0}
      "Start: vector along y-axis of platform frame resolved in base frame"
      annotation(Evaluate=true, Dialog(group="if rotationType_start = TwoAxesVectors", tab="Orientation"));

    parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_start(min={1,1,1},max={3,3,3}) = gp.initSequence "Start: sequence of rotation axes"
      annotation (Evaluate=true,Dialog(group="if rotationType_start = PlanarRotationSequence", tab="Orientation"));
    parameter NonSI.Angle_deg angles_start[3]=to_deg(gp.initAngles)
      "Start: rotation angles around the axes defined in 'sequence_start'" annotation (Dialog(group="if rotationType_start = PlanarRotationSequence", tab="Orientation"));

    //Final orientation
    parameter Modelica.Mechanics.MultiBody.Types.RotationTypes
      rotationType_stop=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence
      "Stop: type of rotation description" annotation (Dialog(group="Final orientation", tab="Orientation"), Evaluate=true);

    parameter Modelica.Mechanics.MultiBody.Types.Axis n_stop=n_start
      "Stop: axis of rotation in base frame (= same as in platform frame)"
      annotation(Evaluate=true, Dialog(group="if rotationType_stop = RotationAxis", tab="Orientation"));
    parameter NonSI.Angle_deg angle_stop=angle_start
      "Stop: angle to rotate base frame around axis n_stop into platform frame"
      annotation(Dialog(group="if rotationType_stop = RotationAxis", tab="Orientation"));

    parameter Modelica.Mechanics.MultiBody.Types.Axis n_x_stop=n_x_start
      "Stop: vector along x-axis of platform frame resolved in base frame"
      annotation(Evaluate=true, Dialog(group="if rotationType_stop = TwoAxesVectors", tab="Orientation"));
    parameter Modelica.Mechanics.MultiBody.Types.Axis n_y_stop=n_y_start
      "Stop: vector along y-axis of platform frame resolved in base frame"
      annotation(Evaluate=true, Dialog(group="if rotationType_stop = TwoAxesVectors", tab="Orientation"));

    parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_stop(min={1,1,1},max={3,3,3}) = sequence_start "Stop: sequence of rotation axes"
      annotation (Evaluate=true,Dialog(group="if rotationType_stop = PlanarRotationSequence", tab="Orientation"));
    parameter NonSI.Angle_deg angles_stop[3]=angles_start
      "Stop: rotation angles around the axes defined in 'sequence_stop'" annotation (Dialog(group="if rotationType_stop = PlanarRotationSequence", tab="Orientation"));

    //(Orientation conversion)
    final parameter Frames.Orientation R_rel_start=if rotationType_start == Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis
                                                   then
                                                   Frames.planarRotation(Modelica.Math.Vectors.normalizeWithAssert(n_start),from_deg(angle_start),0)
                                                   else if rotationType_start == Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors
                                                   then
                                                   Frames.from_nxy(n_x_start, n_y_start) else Frames.axesRotations(sequence_start, from_deg(angles_start),zeros(3))
                                                   "Start: fixed rotation object from base frame to platform frame";

    final parameter Frames.Orientation R_rel_stop=if rotationType_stop == Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis
                                                  then
                                                  Frames.planarRotation(Modelica.Math.Vectors.normalizeWithAssert(n_stop),from_deg(angle_stop),0)
                                                  else if rotationType_stop == Modelica.Mechanics.MultiBody.Types.RotationTypes.TwoAxesVectors
                                                  then
                                                  Frames.from_nxy(n_x_stop, n_y_stop) else Frames.axesRotations(sequence_stop, from_deg(angles_stop),zeros(3))
                                                  "Stop: fixed rotation object from base frame to platform frame";


    final parameter SI.Angle startAngles[3]=Frames.axesRotationsAngles(R_rel_start,outputSequence)
      "Start: initial values of angles to rotate base frame around 'Sequence' axes into platform frame";
    final parameter SI.Angle stopAngles[3]=Frames.axesRotationsAngles(R_rel_stop,outputSequence)
      "Stop: initial values of angles to rotate base frame around 'Sequence' axes into platform frame";

    //Time
    parameter SI.Time startTime(min=0) = 0 "output = startPosition  for  time<=startTime" annotation(Dialog(group="Time"));
    parameter SI.Time transitionTime(min=0) = 1 "Time required for the motion" annotation(Dialog(group="Time"));
    final parameter SI.Time stopTime = startTime + transitionTime "output = stopPosition  for  time>=stopTime";

    //Variables
    SI.Position position[3] "Current position vector";
    SI.Position distance "Current distance from 'startPosition' to the current position";
    SI.Angle angles[3] "Current angles";

  Interfaces.Pose pose annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));
  Interfaces.PoseMux mux(sequenceIn=outputSequence) annotation (Placement(transformation(extent={{28,-10},{48,10}})));

  Modelica.Blocks.Sources.Constant const_startTime(k=startTime) annotation (Placement(transformation(extent={{28,-46},{48,-26}})));
  Modelica.Blocks.Sources.Constant const_stopTime(k=stopTime) annotation (Placement(transformation(extent={{28,-80},{48,-60}})));
equation
  assert(transitionTime>=0,"PartialTrajectoryModel: Invalid parameter.");

  distance= if (direction*(position-startPosition))>0 then norm(position-startPosition) else -norm(position-startPosition);
  mux.positionIn=position;
  mux.orientationIn=angles;

  connect(mux.poseOut, pose) annotation (Line(points={{47,0},{90,0}}, color={0,0,0}));
  connect(const_startTime.y, pose.startTime)
    annotation (Line(points={{49,-36},{90.15,-36},{90.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(const_stopTime.y, pose.stopTime)
    annotation (Line(points={{49,-70},{90.15,-70},{90.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
      
end PartialTrajectoryModel;
