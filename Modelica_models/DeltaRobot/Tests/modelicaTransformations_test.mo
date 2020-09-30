within DeltaRobot.Tests;

model modelicaTransformations_test

  // Imports
  import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

  // Parameters
  parameter Modelica.Mechanics.MultiBody.Types.Axis axis={0,0,1} "Asse di rotazione";
  parameter SI.Angle rotationAngle = from_deg(20) "Di quanto ruotare il frame originale attorno a 'axis'";  
  parameter TM.Orientation T = TM.axisRotation(3,rotationAngle) "Transformation matrix";
  
  parameter SI.Position P_orig[3] = {0.3, 0.5, 0.7};
  parameter SI.Position P_new[3] = TM.resolve2(T,P_orig);
  
  // Models
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, defaultWidthFraction = 40)  annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.Fixed originalFrame annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(angle = to_deg(rotationAngle), n = axis)  annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(color_x = {255, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation P_orig_visual(r = P_orig)  annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation P_new_visual(length = Modelica.Math.Vectors.length(P_new_visual.r - P_new_visual.r_shape) * 1.3,r = P_new, width = P_new_visual.length / world.defaultWidthFraction / 2) annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(originalFrame.frame_b, fixedRotation.frame_a) annotation(
    Line(points = {{-20, 10}, {0, 10}, {0, 10}, {0, 10}}));
  connect(fixedRotation.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{20, 10}, {40, 10}, {40, 10}, {40, 10}}, color = {95, 95, 95}));
  connect(P_orig_visual.frame_a, originalFrame.frame_b) annotation(
    Line(points = {{-20, 50}, {-20, 50}, {-20, 10}, {-20, 10}}, color = {95, 95, 95}));
  connect(fixedRotation.frame_b, P_new_visual.frame_a) annotation(
    Line(points = {{20, 10}, {20, 10}, {20, 50}, {20, 50}}));
end modelicaTransformations_test;
