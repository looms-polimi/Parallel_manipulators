within DeltaRobot.Tests;

model Switch2_test
  DeltaRobot.ReferenceSignals.Switch2 switch2 annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.ReferenceSignals.LinearTrajectory linearTrajectory1(startPosition = {0, 0, 0}, startTime = 1, stopPosition = {1, 2, 3}, transitionTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.ReferenceSignals.LinearTrajectory linearTrajectory2(startPosition = {1, 2, 3}, startTime = 2, stopPosition = {0.5, 0.5, 0.5}, transitionTime = 2)  annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner DeltaRobot.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

  connect(linearTrajectory1.pose,switch2.poseInput[1]);
  connect(linearTrajectory2.pose,switch2.poseInput[2]);

annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.01));
end Switch2_test;
