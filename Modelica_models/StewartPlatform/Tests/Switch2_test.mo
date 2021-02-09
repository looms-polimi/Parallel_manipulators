within StewartPlatform.Tests;

model Switch2_test
  StewartPlatform.ReferenceSignals.Switch2 switch2 annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.ReferenceSignals.LinearTrajectory linearTrajectory1(angles_start = {0, 0, 0}, angles_stop = {10, 20, 30}, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence,startPosition = {0, 0, 0}, startTime = 1, stopPosition = {1, 2, 3}, transitionTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.ReferenceSignals.LinearTrajectory linearTrajectory2(angles_start = {10, 20, 30}, angles_stop = {0, 0, 0},startPosition = {1, 2, 3}, startTime = 2, stopPosition = {0.5, 0.5, 0.5}, transitionTime = 2)  annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner StewartPlatform.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  connect(linearTrajectory1.pose,switch2.poseInput[1]);
  connect(linearTrajectory2.pose,switch2.poseInput[2]);

annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.01));
end Switch2_test;
