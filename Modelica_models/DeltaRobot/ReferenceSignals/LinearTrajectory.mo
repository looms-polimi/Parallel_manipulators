within DeltaRobot.ReferenceSignals;

model LinearTrajectory "The outputs are three reference values for the three actuators of a Delta robot to follow a linear trajectory with constant speed"
  extends DeltaRobot.Icons.LinearTrajectory; // Icon
  extends PartialTrajectoryModel;

  //Constant speed
  final parameter SI.Velocity v[3] = (stopPosition-startPosition)/transitionTime
    "Constant velocity vector to go from 'startPosition' to 'stopPosition' in 'transitionTime'";
  final parameter SI.Velocity velocityModule = Modelica.Math.Vectors.norm(v)
    "Module of the velocity vector";

equation
  if time<startTime then
     position=startPosition;
  elseif time<startTime+transitionTime then
     position=startPosition+v*(time-startTime);
  else
     position=stopPosition;
  end if;

end LinearTrajectory;
