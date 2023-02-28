within DeltaRobot.ReferenceSignals;

model TrapezoidalTrajectory "The outputs are three reference values for the three actuators of a Delta robot to follow a line with a trapezoidal velocity profile"
  extends DeltaRobot.Icons.TrapezoidalTrajectory; // Icon
  extends PartialTrajectoryModel(final transitionTime=Ti+Tc+Tf);

  //Imports
    import Modelica.Math.Vectors.*;

  //Parameters
    parameter SI.Velocity initialSpeed = 0 "Initial platform speed (direction = stopPosition-startPosition, in base frame)";
    parameter SI.Velocity finalSpeed = 0 "Final platform speed (direction = stopPosition-startPosition, in base frame)";
    parameter SI.Velocity maxSpeed = 1 "Max platform speed (direction = stopPosition-startPosition, in base frame)";
    parameter SI.Acceleration maxAcceleration = 1 "Max platform acceleration (direction = stopPosition-startPosition, in base frame)";

  //Variables
    SI.Velocity speed[3] "Current speed vector";
    SI.Acceleration acceleration[3] "Current acceleration vector";
    SI.Velocity speedModule "Module of current speed vector";
    SI.Acceleration accelerationModule "Module of current acceleration vector";

protected
  parameter SI.Time Ti_bar=abs((maxSpeed-initialSpeed)/maxAcceleration) "Time to go from initial speed to max speed with max acceleration";
  parameter SI.Time Tf_bar=abs((finalSpeed-maxSpeed)/maxAcceleration) "Time to go from max speed to final speed with max acceleration";
  parameter SI.Acceleration ai = sign(maxSpeed-initialSpeed)*maxAcceleration "Initial acceleration";
  parameter SI.Acceleration af = sign(finalSpeed-maxSpeed)*maxAcceleration "Final acceleration";
  parameter Integer case = if totalDistance>=Ti_bar*initialSpeed+0.5*ai*Ti_bar^2+Tf_bar*maxSpeed+0.5*af*Tf_bar^2 then
                            1
                           elseif sign(ai)<>sign(af) then
                            2
                           else
                            0;
public
    final parameter Real temp = if case==1 then 1 else sqrt(0.5*initialSpeed*initialSpeed+0.5*finalSpeed*finalSpeed+ai*totalDistance); // Temporary variable to avoid an error in OpenModelica
    final parameter SI.Time Ti= if case==1 then Ti_bar else -initialSpeed/ai+temp/ai
      "Initial acceletation time";
    final parameter SI.Time Tf= if case==1 then Tf_bar else (finalSpeed-initialSpeed-ai*Ti)/af
      "Final acceleration time";
    final parameter SI.Time Tc= if case==1 then (totalDistance-Ti*initialSpeed-Tf*maxSpeed-0.5*ai*Ti^2-0.5*af*Tf^2)/maxSpeed else 0
      "Constant speed time";

    final parameter Real initialSpeedVector[3] = initialSpeed*direction;
    final parameter Real finalSpeedVector[3] = finalSpeed*direction;
    final parameter Real maxSpeedVector[3] = if case==1 then maxSpeed*direction else initialSpeedVector+ai*direction*Ti;

equation
  assert(maxSpeed>0 and maxAcceleration>0,"TrapezoidalTrajectory: Invalid max speed or max acceleration.");
  assert(case<>0,"TrapezoidalTrajectory: Invalid parameters. Impossible trapezoidal trajectory.");

  if time<startTime then
    acceleration={0,0,0};
    speed={0,0,0};
    position=startPosition;

    speedModule=0;
    accelerationModule=0;
  elseif time<startTime+Ti then
    acceleration=ai*direction;
    speed=initialSpeedVector+acceleration*(time-startTime);
    position=startPosition+initialSpeedVector*(time-startTime)+0.5*acceleration*(time-startTime)^2;

    speedModule= if (direction*speed)>0 then norm(speed) else -norm(speed);
    accelerationModule= if (direction*acceleration)>0 then norm(acceleration) else -norm(acceleration);
  elseif time<startTime+Ti+Tc then
    acceleration={0,0,0};
    speed=maxSpeedVector;
    position=startPosition+initialSpeedVector*Ti+0.5*ai*direction*Ti^2+speed*(time-startTime-Ti);

    speedModule= if (direction*speed)>0 then norm(speed) else -norm(speed);
    accelerationModule= if (direction*acceleration)>0 then norm(acceleration) else -norm(acceleration);
  elseif time<startTime+Ti+Tc+Tf then
    acceleration=af*direction;
    speed=maxSpeedVector+acceleration*(time-startTime-Ti-Tc);
    position=startPosition+initialSpeedVector*Ti+0.5*ai*direction*Ti^2+maxSpeedVector*Tc    +maxSpeedVector*(time-startTime-Ti-Tc)+0.5*acceleration*(time-startTime-Ti-Tc)^2;

    speedModule= if (direction*speed)>0 then norm(speed) else -norm(speed);
    accelerationModule= if (direction*acceleration)>0 then norm(acceleration) else -norm(acceleration);
  else
    acceleration={0,0,0};
    speed={0,0,0};
    position=stopPosition;

    speedModule=0;
    accelerationModule=0;
  end if;

end TrapezoidalTrajectory;