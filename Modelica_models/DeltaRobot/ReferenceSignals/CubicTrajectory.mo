within DeltaRobot.ReferenceSignals;
model CubicTrajectory  "The outputs are the position and orientation of the platform to follow a line with a cubic eqution of motion"
  extends DeltaRobot.Icons.CubicTrajectory;
  extends PartialTrajectoryModel;

  //Imports
    import ModelicaServices.Machine.eps;
    import Modelica.Math.Vectors.*;

  //Parameters
    parameter SI.Velocity initialSpeed = 0 "Initial platform speed (direction = stopPosition-startPosition, in base frame)";
    parameter SI.Velocity finalSpeed = 0 "Final platform speed (direction = stopPosition-startPosition, in base frame)";

  //Variables
    SI.Velocity speed[3] "Current speed vector";
    SI.Acceleration acceleration[3] "Current acceleration vector";
    SI.Velocity speedModule "Module of current speed vector";
    SI.Acceleration accelerationModule "Module of current acceleration vector";

protected
    parameter Real initialSpeedVector[3] = initialSpeed*direction;
    parameter Real finalSpeedVector[3] = finalSpeed*direction;

    parameter Real ap[4,3]={startPosition,
                            initialSpeedVector,
                            (-3*(startPosition-stopPosition)-(2*initialSpeedVector+finalSpeedVector)*transitionTime)/transitionTime^2,
                            (2*(startPosition-stopPosition)+(initialSpeedVector+finalSpeedVector)*transitionTime)/transitionTime^3}
                            "Coefficients of the cubic polynomial for position";

  function checkConstraints "Returns true if the position and velocity profiles are correct (no direction changes)"
    //Inputs and outputs
      input Real a[4,3] "Coefficients of the cubic polynomial";
      input SI.Time ti "Initial time";
      input SI.Time tf "Final time";
      output Boolean correct "=true, if the direction of motion doesn't change during the motion";

  protected
      Real A[3] = 3*a[4];
      Real B[3] = 2*a[3]-6*a[4]*ti;
      Real C[3] = a[2]-2*a[3]*ti+3*a[4]*ti^2;
      Real delta[3] = B.^2-4*A.*C;
      Real t1,t2 "Roots of the speed equation of motion, instants when the speed is null";

  algorithm
      correct := true;
      if ti>=tf then
        correct := false; //invalid inputs
      else
        for i in 1:3 loop
          if delta[i]-eps>0 then //if delta[i]<=0 the function position(time) is monotonically increasing/decreasing, no direction changes over all R
            t1 := min(  (-B[i]-sqrt(delta[i]))/(2*A[i]),    (-B[i]+sqrt(delta[i]))/(2*A[i]));
            t2 := max(  (-B[i]-sqrt(delta[i]))/(2*A[i]),    (-B[i]+sqrt(delta[i]))/(2*A[i]));

            if not (tf<=t1+2*eps or (t1-100*eps<=ti and tf<=t2+100*eps) or t2-2*eps<=ti) then
              correct := false;
            end if;
          end if;
        end for;
      end if;
  end checkConstraints;

equation
  assert(checkConstraints(ap,startTime,startTime+transitionTime),
        "CubicTrajectory: WARNING, change in direction during motion", level = AssertionLevel.warning);

  if time<startTime then
      position=startPosition;
      speed={0,0,0};
      acceleration={0,0,0};
      speedModule=0;
      accelerationModule=0;
    elseif time<startTime+transitionTime then
      position=ap[1]+ap[2]*(time-startTime)+ap[3]*(time-startTime)^2+ap[4]*(time-startTime)^3;
      speed=ap[2]+2*ap[3]*(time-startTime)+3*ap[4]*(time-startTime)^2;
      acceleration=2*ap[3]+6*ap[4]*(time-startTime);
      speedModule= if (direction*speed)>0 then norm(speed) else -norm(speed);
      accelerationModule= if (direction*acceleration)>0 then norm(acceleration) else -norm(acceleration);
    else
      position=stopPosition;
      speed={0,0,0};
      acceleration={0,0,0};
      speedModule=0;
      accelerationModule=0;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="CopiatoDaSP");
end CubicTrajectory;
