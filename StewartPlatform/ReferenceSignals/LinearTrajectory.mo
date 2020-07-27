within StewartPlatform.ReferenceSignals;

model LinearTrajectory "The outputs are the position and orientation of the platform to follow a linear trajectory with constant speed"
  extends StewartPlatform.Icons.LinearTrajectory;
  extends PartialTrajectoryModel;

    //Constant speed
    final parameter SI.Velocity v[3] = (stopPosition-startPosition)/transitionTime
      "Constant velocity vector to go from 'startPosition' to 'stopPosition' in 'transitionTime'";
    final parameter SI.AngularVelocity omega[3] = (stopAngles-startAngles)/transitionTime
      "Constant angular velocities of the sequence of three rotations to go from initial orientation to the final orientation in 'transitionTime'";
    final parameter SI.Velocity velocityModule = Modelica.Math.Vectors.norm(v)
      "Module of the velocity vector";

equation
    if time<startTime then
      position=startPosition;
      angles=startAngles;
    elseif time<startTime+transitionTime then
      position=startPosition+v*(time-startTime);
      angles=startAngles+omega*(time-startTime);
    else
      position=stopPosition;
      angles=stopAngles;
    end if;

end LinearTrajectory;