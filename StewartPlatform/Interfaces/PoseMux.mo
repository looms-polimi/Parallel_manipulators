within StewartPlatform.Interfaces;

model PoseMux "Shrink the variables of a 'Pose' connector"
    extends StewartPlatform.Icons.PoseMux; // Icon

    import Modelica.Blocks.Interfaces.*;

  // Models
    RealOutput positionIn[3] annotation (Placement(visible = true, transformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0), iconTransformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0)));
    IntegerOutput sequenceIn[3] annotation (Placement(visible = true, transformation(extent = {{-110, 40}, {-90, 60}}, rotation = 0), iconTransformation(extent = {{-110, 40}, {-90, 60}}, rotation = 0)));
    RealOutput orientationIn[3] annotation (Placement(visible = true, transformation(extent = {{-110, 10}, {-90, 30}}, rotation = 0), iconTransformation(extent = {{-110, 10}, {-90, 30}}, rotation = 0)));    
    RealOutput startTimeIn annotation (Placement(visible = true, transformation(extent = {{-110, -50}, {-90, -30}}, rotation = 0), iconTransformation(extent = {{-110, -50}, {-90, -30}}, rotation = 0)));
    RealOutput stopTimeIn annotation (Placement(visible = true, transformation(extent = {{-110, -80}, {-90, -60}}, rotation = 0), iconTransformation(extent = {{-110, -80}, {-90, -60}}, rotation = 0)));  
      
    StewartPlatform.Interfaces.Pose poseOut annotation (Placement(visible = true, transformation(extent = {{60, -30}, {120, 30}}, rotation = 0), iconTransformation(extent = {{60, -30}, {120, 30}}, rotation = 0)));
equation
  connect(positionIn, poseOut.position);
  connect(sequenceIn, poseOut.sequence);
  connect(orientationIn, poseOut.orientation);
  connect(startTimeIn, poseOut.startTime);
  connect(stopTimeIn, poseOut.stopTime);  
  
end PoseMux;
