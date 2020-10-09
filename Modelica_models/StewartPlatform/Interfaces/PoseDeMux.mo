within StewartPlatform.Interfaces;

model PoseDeMux "Expand the variables of a 'Pose' connector"
    extends StewartPlatform.Icons.PoseDeMux; // Icon
    import Modelica.Blocks.Interfaces.*;

  // Models
    Pose poseIn annotation (Placement(transformation(extent={{-120,-30},{-60,30}})));
    RealOutput positionOut[3] annotation (Placement(visible = true, transformation(extent = {{100, 70}, {120, 90}}, rotation = 0), iconTransformation(extent = {{100, 70}, {120, 90}}, rotation = 0)));
    IntegerOutput sequenceOut[3] annotation (Placement(visible = true, transformation(extent = {{100, 40}, {120, 60}}, rotation = 0), iconTransformation(extent = {{100, 40}, {120, 60}}, rotation = 0)));
    RealOutput orientationOut[3] annotation (Placement(visible = true, transformation(extent = {{100, 10}, {120, 30}}, rotation = 0), iconTransformation(extent = {{100, 10}, {120, 30}}, rotation = 0)));    
    RealOutput startTimeOut annotation (Placement(visible = true, transformation(extent = {{100, -50}, {120, -30}}, rotation = 0), iconTransformation(extent = {{100, -50}, {120, -30}}, rotation = 0)));
    RealOutput stopTimeOut annotation (Placement(visible = true, transformation(extent = {{100, -80}, {120, -60}}, rotation = 0), iconTransformation(extent = {{100, -80}, {120, -60}}, rotation = 0)));    
    
equation
  connect(poseIn.position, positionOut);
  connect(poseIn.sequence, sequenceOut);
  connect(poseIn.orientation, orientationOut);
  connect(poseIn.startTime, startTimeOut);
  connect(poseIn.stopTime, stopTimeOut);
end PoseDeMux;
