within DeltaRobot.Functions;

function checkLimits "Return 'true' if all Delta Robot angles are within the valid ranges specified, return 'false' otherwise"
    extends DeltaRobot.Icons.Function; // Icon

    // Input & Output
    input SI.Position p[3] "Coordinates of the platform frame resolved in base frame";
    input SI.Distance L "Length of the upper arms";
    input SI.Distance l "Length of the parallelograms (long side)";
    input SI.Diameter Db "Base diameter";
    input SI.Diameter Dp "Platform diameter";
    input SI.Angle beta_base "Angle from the x-axis of the base frame to the direction where the joint #1 is located";

    input SI.Angle maxTheta = from_deg(85) "Max actuator angle";
    input SI.Angle minTheta = from_deg(-85) "Min actuator angle";
    input SI.Angle maxElbowAngle = from_deg(160) "Max internal angle between the upper arm and the parallelogram (180° means allignment)";
    input SI.Angle minElbowAngle = from_deg(20) "Min internal angle between the upper arm and the parallelogram (0° means overlap)";
    input SI.Angle maxParallelogramAngle = from_deg(30) "Max parallelogram direction angle (0° means rectangular shape)";
    input SI.Angle minParallelogramAngle = from_deg(-30) "Min parallelogram direction angle (0° means rectangular shape)";
    input SI.Angle maxPlatformAngle = from_deg(180) "Max angle between parallelogram and platform (180° means allignment)";
    input SI.Angle minPlatformAngle = from_deg(80) "Min angle between parallelogram and platform (0° means overlap)";

    output Boolean correct "'=true' if all angles are within their respective valid ranges, '=false' otherwise";

    // Intermediate parameters
protected
    SI.Angle parallAngles[3,3] = parallelogramAngles(p,L,l,Db,Dp,beta_base);
    SI.Angle theta[3] = inverseKinematic(p,L,l,Db,Dp,beta_base);

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

      correct := false;
    else
      correct := true;
    end if;
    
end checkLimits;
