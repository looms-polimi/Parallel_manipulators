within DeltaRobot.Functions;
function checkLimits "Returns true if all ranges are satisfied"
  extends Modelica.Icons.Function;

  //Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Upper arms length";
    input SI.Distance l "Parallelograms length (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";

    input SI.Angle maxTheta "Max actuator angle";
    input SI.Angle minTheta "Min actuator angle";
    input SI.Angle maxElbowAngle "Max internal angle between the upper arm and the parallelogram (=180 si allineano)";
    input SI.Angle minElbowAngle "Min internal angle between the upper arm and the parallelogram (=0 si sovrappongono)";
    input SI.Angle maxParallelogramAngle "Max parallelogram direction angle (ParallelogramAngle=0->rectangle)";
    input SI.Angle minParallelogramAngle  "Min parallelogram direction angle";
    input SI.Angle maxPlatformAngle "Max angle between parallelogram and platform";
    input SI.Angle minPlatformAngle  "Min angle between parallelogram and platform";

    output Boolean correct "=true if all limits are satisfied, =false if a variable is outside its range";

protected
  SI.Angle parallAngles[3,3] = parallelogramAngles(p,L,l,Db,Dp);
  SI.Angle theta[3] = inverseKinematic(p,L,l,Db,Dp);

algorithm

    if theta[1]>maxTheta or theta[1]<minTheta or
       theta[2]>maxTheta or theta[2]<minTheta or
       theta[3]>maxTheta or theta[3]<minTheta
       or
       pi-parallAngles[1,1]>maxElbowAngle or pi-parallAngles[1,1]<minElbowAngle or
       pi-parallAngles[2,1]>maxElbowAngle or pi-parallAngles[2,1]<minElbowAngle or
       pi-parallAngles[3,1]>maxElbowAngle or pi-parallAngles[3,1]<minElbowAngle
       or
       parallAngles[1,2]>maxParallelogramAngle or parallAngles[1,2]<minParallelogramAngle or
       parallAngles[2,2]>maxParallelogramAngle or parallAngles[2,2]<minParallelogramAngle or
       parallAngles[3,2]>maxParallelogramAngle or parallAngles[3,2]<minParallelogramAngle
       or
       pi-parallAngles[1,3]>maxPlatformAngle or pi-parallAngles[1,3]<minPlatformAngle or
       pi-parallAngles[2,3]>maxPlatformAngle or pi-parallAngles[2,3]<minPlatformAngle or
       pi-parallAngles[3,3]>maxPlatformAngle or pi-parallAngles[3,3]<minPlatformAngle then

      correct:=false;
    else
      correct:=true;
    end if;

  annotation (__Dymola_LockedEditing="Controllato");
end checkLimits;
