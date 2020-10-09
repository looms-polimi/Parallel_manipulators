within StewartPlatform.ReferenceSignals;

model StepTrajectory "Instant switch from initial pose to final pose"
  extends StewartPlatform.Icons.StepTrajectory; // Icon
  extends PartialTrajectoryModel(final transitionTime=0,startTime=1);

equation
    if time<startTime then
      position=startPosition;
      angles=startAngles;
    else
      position=stopPosition;
      angles=stopAngles;
    end if;

end StepTrajectory;