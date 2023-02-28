within DeltaRobot.Components;

model Parallelogram1 "Parallelogram structure used for the lower arms of a Delta Robot"
    extends DeltaRobot.Icons.Parallelogram; // Icon
    extends PartialParallelogram;     

    // Models
    Modelica.Mechanics.MultiBody.Joints.SphericalSpherical longSide1(
      computeRodLength = armParameters.computeParallelogramLength, 
      m = armParameters.Ml, 
      rodDiameter = armParameters.Dl, 
      rodLength = armParameters.l, 
      showMass = false, 
      sphereDiameter = armParameters.sphereDiameter)  
      annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    
    Modelica.Mechanics.MultiBody.Joints.SphericalSpherical longSide2(
      computeRodLength = armParameters.computeParallelogramLength, 
      m = armParameters.Ml, 
      rodDiameter = armParameters.Dl, 
      rodLength = armParameters.l, 
      showMass = false, 
      sphereDiameter = armParameters.sphereDiameter)  
      annotation(Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

equation  
  connect(shortSide1.frame_a, longSide2.frame_a) annotation(Line(points = {{12, 60}, {30, 60}, {30, 10}, {30, 10}}));
  connect(shortSide1.frame_b, longSide1.frame_a) annotation(Line(points = {{-12, 60}, {-30, 60}, {-30, 10}, {-30, 10}}, color = {95, 95, 95}));
  connect(shortSide2.frame_a, longSide2.frame_b) annotation(Line(points = {{12, -60}, {30, -60}, {30, -10}, {30, -10}}));
  connect(shortSide2.frame_b, longSide1.frame_b) annotation(Line(points = {{-12, -60}, {-30, -60}, {-30, -10}, {-30, -10}}));
  
end Parallelogram1;
