within DeltaRobot.Tests;

model Trajectory_test
  DeltaRobot.ReferenceSignals.LinearTrajectory linearTrajectory( startPosition = {0, 0, 0},startTime = 1, stopPosition = {1, 2, 3}, transitionTime = 2)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner DeltaRobot.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.ReferenceSignals.CubicTrajectory cubicTrajectory(startPosition = {0, 0, 0}, startTime = 1, stopPosition = {1, 2, 3}, transitionTime = 2)  annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.ReferenceSignals.StepTrajectory stepTrajectory(startPosition = {0, 0, 0}, stopPosition = {1, 2, 3})  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.ReferenceSignals.TrapezoidalTrajectory trapezoidalTrajectory(maxSpeed = 10, stopPosition = {1, 1, 1})  annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

annotation(
    experiment(StartTime = 0, StopTime = 4, Tolerance = 1e-6, Interval = 0.008));
end Trajectory_test;
