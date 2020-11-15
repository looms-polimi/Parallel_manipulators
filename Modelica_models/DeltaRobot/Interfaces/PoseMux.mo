within DeltaRobot.Interfaces;

model PoseMux "Shrink the variables of a 'Pose' connector"
    extends DeltaRobot.Icons.PoseMux; // Icon

    import Modelica.Blocks.Interfaces.*;

  // Models
    RealOutput positionIn[3] annotation (Placement(visible = true, transformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0), iconTransformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0)));
    RealOutput startTimeIn annotation (Placement(visible = true, transformation(extent = {{-110, -50}, {-90, -30}}, rotation = 0), iconTransformation(extent = {{-110, -50}, {-90, -30}}, rotation = 0)));
    RealOutput stopTimeIn annotation (Placement(visible = true, transformation(extent = {{-110, -80}, {-90, -60}}, rotation = 0), iconTransformation(extent = {{-110, -80}, {-90, -60}}, rotation = 0)));  
      
    DeltaRobot.Interfaces.Pose poseOut annotation (Placement(visible = true, transformation(extent = {{60, -30}, {120, 30}}, rotation = 0), iconTransformation(extent = {{60, -30}, {120, 30}}, rotation = 0)));
equation
  connect(positionIn, poseOut.position);
  connect(startTimeIn, poseOut.startTime);
  connect(stopTimeIn, poseOut.stopTime);

end PoseMux;
