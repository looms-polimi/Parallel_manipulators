within DeltaRobot.Scenarios;

model DeltaRobot_IdealActVel_VelocityValidation
  extends DeltaRobot.Icons.Scenario;
  inner DeltaRobot.Components.GlobalParameters gp(initPlatformPos = {0.06, 0.16, -0.605})  annotation(
    Placement(visible = true, transformation(origin = {-80, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Components.Base base annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  DeltaRobot.Components.Platform platform(_enforceStates = true, fix_initPlatformAngularVel = false, fix_initPlatformOrientation = false, fix_initPlatformPos = true, fix_initPlatformVel = true, useGlobalParameters = true) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Components.ThreeArms_P1_IdealActVel threeArms_P1_IdealActVel annotation(
    Placement(visible = true, transformation(origin = {-2.88658e-15, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
    Placement(visible = true, transformation(origin = {-80, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.ReferenceSignals.SpeedCommand speedCommand(n = 3)  annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.ReferenceSignals.TorqueCommand torqueCommand(n = 3)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(base.frame_b, threeArms_P1_IdealActVel.frame_base) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, 10}, {0, 10}}, color = {95, 95, 95}, thickness = 0.5));
  connect(threeArms_P1_IdealActVel.frame_platform, platform.frame_b) annotation(
    Line(points = {{0, -30}, {0, -30}, {0, -40}, {0, -40}}, color = {95, 95, 95}, thickness = 0.5));
  connect(speedCommand.speedRef, threeArms_P1_IdealActVel.angleVelRef) annotation(
    Line(points = {{-58, -10}, {-28, -10}, {-28, -10}, {-24, -10}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 1.5, Tolerance = 1e-06, Interval = 0.006));
end DeltaRobot_IdealActVel_VelocityValidation;
