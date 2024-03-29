within DeltaRobot.Scenarios;

model DeltaRobot_IdealActVel_Scenario1
  extends DeltaRobot.Icons.Scenario;
  inner Components.GlobalParameters gp(initPlatformPos = {0.1, 0.1, -0.6})  annotation(
    Placement(visible = true, transformation(origin = {-80, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Base base annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Components.Platform platform(_enforceStates = false, fix_initPlatformAngularVel = false, fix_initPlatformOrientation = false, fix_initPlatformPos = true, fix_initPlatformVel = true, useGlobalParameters = true) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ThreeArms_P1_IdealActVel threeArms_P1_IdealActVel annotation(
    Placement(visible = true, transformation(origin = {-2.88658e-15, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid trapezoid[3](each falling = 0.2, each nperiod = 1, each period = 100, each rising = 0.2, each startTime = 0.5, each width = 0.6) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
    Placement(visible = true, transformation(origin = {-80, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(base.frame_b, threeArms_P1_IdealActVel.frame_base) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, 10}, {0, 10}}, color = {95, 95, 95}, thickness = 0.5));
  connect(threeArms_P1_IdealActVel.frame_platform, platform.frame_b) annotation(
    Line(points = {{0, -30}, {0, -30}, {0, -40}, {0, -40}}, color = {95, 95, 95}, thickness = 0.5));
  connect(trapezoid.y, threeArms_P1_IdealActVel.angleVelRef) annotation(
    Line(points = {{-58, -10}, {-24, -10}, {-24, -10}, {-24, -10}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 3, Tolerance = 1e-06, Interval = 0.006));
end DeltaRobot_IdealActVel_Scenario1;
