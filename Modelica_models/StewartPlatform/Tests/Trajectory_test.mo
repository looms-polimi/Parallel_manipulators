within StewartPlatform.Tests;

model Trajectory_test
  StewartPlatform.ReferenceSignals.LinearTrajectory linearTrajectory(angles_stop = {10, 20, 30}, startPosition = {0, 0, 0}, startTime = 1, stopPosition = {1, 2, 3}) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner StewartPlatform.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.ReferenceSignals.CubicTrajectory cubicTrajectory(angles_start = {0, 0, 0}, angles_stop = {10, 20, 30}, startPosition = {0, 0, 0}, startTime = 1, stopPosition = {1, 2, 3}, transitionTime = 2) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.ReferenceSignals.StepTrajectory stepTrajectory(angles_start = {0, 0, 0}, angles_stop = {10, 20, 30}, startPosition = {0, 0, 0}, stopPosition = {1, 2, 3}) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.ReferenceSignals.TrapezoidalTrajectory trapezoidalTrajectory(startPosition = {0, 0, 0}, startTime = 1, stopPosition = {1, 2, 3})  annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

protected
  annotation(
    experiment(StartTime = 0, StopTime = 6, Tolerance = 1e-06, Interval = 0.012));
end Trajectory_test;
