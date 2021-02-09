within DeltaRobot.ReferenceSignals;

model StepTrajectory "Instant switch from initial position to final position"
  extends DeltaRobot.Icons.StepTrajectory; // Icon
  extends PartialTrajectoryModel(final transitionTime=0,startTime=1);

equation
  if time<startTime then
    position=startPosition;
  else
    position=stopPosition;
  end if;

end StepTrajectory;
