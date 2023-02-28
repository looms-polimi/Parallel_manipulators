within DeltaRobot.Interfaces;

model PoseMux "Shrink the variables of a 'Pose' connector"
    extends DeltaRobot.Icons.PoseMux; 
// Icon
    import Modelica.Blocks.Interfaces.*;

// Models
    Modelica.Blocks.Interfaces.RealOutput positionIn[3] annotation (Placement(visible = true, transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(extent = {{-120, -10}, {-100, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput startTimeIn annotation (Placement(visible = true, transformation(extent = {{-110, 50}, {-90, 70}}, rotation = 0), iconTransformation(extent = {{-120, 50}, {-100, 70}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput stopTimeIn annotation (Placement(visible = true, transformation(extent = {{-110, -70}, {-90, -50}}, rotation = 0), iconTransformation(extent = {{-120, -70}, {-100, -50}}, rotation = 0)));  
      
    DeltaRobot.Interfaces.Pose poseOut annotation (Placement(visible = true, transformation(extent = {{60, -30}, {120, 30}}, rotation = 0), iconTransformation(extent = {{60, -30}, {120, 30}}, rotation = 0)));

equation
  connect(positionIn, poseOut.position) annotation(Line);
  connect(startTimeIn, poseOut.startTime) annotation(Line);
  connect(stopTimeIn, poseOut.stopTime) annotation(Line);

end PoseMux;
