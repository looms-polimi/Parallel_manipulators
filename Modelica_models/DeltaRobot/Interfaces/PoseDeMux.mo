within DeltaRobot.Interfaces;

model PoseDeMux "Expand the variables of a 'Pose' connector"
    extends DeltaRobot.Icons.PoseDeMux; // Icon

    import Modelica.Blocks.Interfaces.*;

    // Models
    Pose poseIn annotation (Placement(transformation(extent={{-130,-30},{-70,30}})));
    RealOutput positionOut[3] annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    RealOutput startTimeOut annotation (Placement(transformation(extent={{100,50},{120,70}})));
    RealOutput stopTimeOut annotation (Placement(transformation(extent={{100,-70},{120,-50}})));    
    
equation
    connect(poseIn.position, positionOut);
    connect(poseIn.startTime, startTimeOut);
    connect(poseIn.stopTime, stopTimeOut);
end PoseDeMux;
