within DeltaRobot.ReferenceSignals;
model LinearTrajectory "The outputs of this block are 3 reference values for the 3 actuators of a Delta robot to follow a linear trajectory"
  extends DeltaRobot.Icons.LinearTrajectory;
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="CopiatoDaSP");
end LinearTrajectory;
