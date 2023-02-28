within StewartPlatform.Tests;

model UniversalJoint_test
  parameter SI.Position v[3] = Modelica.Math.Vectors.normalize({1,1,1});
  parameter SI.Angle angles[2] = StewartPlatform.Functions.ujAngles(v,universalJoint.universalJointParameters.alpha);
  
  inner Modelica.Mechanics.MultiBody.World world(animateGravity=true)
                                                 annotation (Placement(visible = true, transformation(extent = {{-38, -10}, {-18, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(
    animation= true, diameter=0.04,r={0,0,0.5})                                           annotation (Placement(visible = true, transformation(extent = {{10, 16}, {30, 36}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame(animation = false, color_x = {238, 46, 47}) annotation (Placement(visible = true, transformation(extent = {{16, -10}, {36, 10}}, rotation = 0)));
  StewartPlatform.Components.UniversalJoint universalJoint(universalJointParameters(alpha = 1.309, angles = {angles[1], angles[2]}, initialAnglesFixed = true, initialAngularVelFixed = true))  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(world.frame_b, universalJoint.frame_a) annotation(
    Line(points = {{-18, 0}, {-10, 0}}));
  connect(universalJoint.frame_b, bodyCylinder.frame_a) annotation(
    Line(points = {{10, 0}, {10, 26}}, color = {95, 95, 95}));
  connect(universalJoint.frame_b, fixedFrame.frame_a) annotation(
    Line(points = {{10, 0}, {16, 0}}));
end UniversalJoint_test;
