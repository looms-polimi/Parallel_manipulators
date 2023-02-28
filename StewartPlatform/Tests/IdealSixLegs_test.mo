within StewartPlatform.Tests;

model IdealSixLegs_test
inner Modelica.Mechanics.MultiBody.World world(animateWorld=false, animateGravity=false)
                                                 annotation (Placement(visible = true, transformation(extent = {{-90, 72}, {-70, 92}}, rotation = 0)));
  StewartPlatform.Components.IdealLeg leg(alpha=-0.61086523819802, angles={-0.12915436464758,-0.22165681500328}, stateSelect = StateSelect.always)
    annotation (Placement(visible = true, transformation(origin = {-14, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  StewartPlatform.Components.Base base(useGlobalParameters=false, base(De=0.74*1.3)) annotation (Placement(visible = true, transformation(extent = {{-8, -44}, {12, -24}}, rotation = 0)));
  StewartPlatform.Components.Platform platform(useGlobalParameters=false, platform(De=0.44*1.3)) annotation (Placement(visible = true, transformation(extent = {{-10, 42}, {10, 22}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(visible = true, transformation(extent = {{-60, -10}, {-40, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x={255,0,0}, length=0.5) annotation (Placement(visible = true, transformation(extent = {{20, 30}, {40, 50}}, rotation = 0)));
equation
  connect(base.frame_b[1], leg.frame_a) annotation(
    Line(points = {{2, -27}, {2, -23.5}, {-14, -23.5}, {-14, -16}}, color = {95, 95, 95}, thickness = 0.5));
  connect(leg.frame_b, platform.frame_b[1]) annotation(
    Line(points = {{-14, 14}, {-14, 27.5}, {0, 27.5}, {0, 25}}, color = {95, 95, 95}, thickness = 0.5));
  connect(const.y, leg.lengthRef) annotation(
    Line(points = {{-39, 0}, {-24, 0}}, color = {0, 0, 127}));
  connect(platform.frame_a, fixedFrame2.frame_a) annotation(
    Line(points = {{0, 39}, {20, 39}, {20, 40}}, color = {95, 95, 95}, thickness = 0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end IdealSixLegs_test;
