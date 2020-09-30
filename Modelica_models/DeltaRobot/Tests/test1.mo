within DeltaRobot.Tests;

model test1
  inner DeltaRobot.Components.GlobalParameters gp(fixInitAngularVel = false, fixInitOrientation = true, fixInitPosition = true, fixInitVelocity = false)  annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Components.Base base annotation(
    Placement(visible = true, transformation(origin = {1.77636e-15, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  DeltaRobot.Components.Platform platform(fixInitAngularVel = true, fixInitOrientation = true, fixInitPosition = true, fixInitVelocity = true, useGlobalParameters = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Components.ThreeArms_P1_IdealActPos threeArms_P1_IdealActPos(useGlobalParameters = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-80, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const[3](k = {0.207708, 0.207708, 0.207708})  annotation(
    Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const.y, threeArms_P1_IdealActPos.angleRef) annotation(
    Line(points = {{-78, -20}, {-26, -20}, {-26, -20}, {-24, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(threeArms_P1_IdealActPos.frame_platform, platform.frame_b) annotation(
    Line(points = {{0, -40}, {0, -40}, {0, -60}, {0, -60}}, thickness = 0.5));
  connect(base.frame_b, threeArms_P1_IdealActPos.frame_base) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, 0}, {0, 0}}, color = {95, 95, 95}, thickness = 0.5));
end test1;
