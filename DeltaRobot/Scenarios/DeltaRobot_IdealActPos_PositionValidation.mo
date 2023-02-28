within DeltaRobot.Scenarios;

model DeltaRobot_IdealActPos_PositionValidation
  extends DeltaRobot.Icons.Scenario;
  inner Components.GlobalParameters gp(initPlatformPos = {0.06, 0.16, -0.605}) annotation(
    Placement(visible = true, transformation(origin = {-80, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Base base annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Components.Platform platform(_enforceStates = true, fix_initPlatformAngularVel = false, fix_initPlatformOrientation = false, fix_initPlatformPos = true, fix_initPlatformVel = true, useGlobalParameters = true) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.ThreeArms_P1_IdealActPos threeArms_P1_IdealActPos annotation(
    Placement(visible = true, transformation(origin = {-2.88658e-15, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
    Placement(visible = true, transformation(origin = {-80, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ReferenceSignals.PickAndPlace pickAndPlace1(anticipation = 0.15, horizontalVerticalFinalSpeed = 0, horizontalVerticalInitialSpeed = 0, maxAccelerationHorizontal = 29.19, maxAccelerationVertical = 5.36, maxSpeedHorizontal = 2.277, maxSpeedVertical = 100, startTime = 0, verticalHorizontalFinalSpeed = 0, verticalHorizontalInitialSpeed = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ReferenceSignals.InverseKinematic inverseKinematic annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ReferenceSignals.SpeedCommand speedCommand(n = 3, startTime = 0.035)  annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ReferenceSignals.TorqueCommand torqueCommand(n = 3, startTime = 0.035)  annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ReferenceSignals.PickAndPlace pickAndPlace2(anticipation = 0.04, horizontalVerticalInitialSpeed = 1.1068, maxAccelerationVertical = 17.5, maxSpeedVertical = 100, verticalHorizontalInitialSpeed = 1.1068)  annotation(
    Placement(visible = true, transformation(origin = {-90, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(base.frame_b, threeArms_P1_IdealActPos.frame_base) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, 10}, {0, 10}}, color = {95, 95, 95}, thickness = 0.5));
  connect(threeArms_P1_IdealActPos.frame_platform, platform.frame_b) annotation(
    Line(points = {{0, -30}, {0, -30}, {0, -40}, {0, -40}}, color = {95, 95, 95}, thickness = 0.5));
  connect(inverseKinematic.theta, threeArms_P1_IdealActPos.angleRef) annotation(
    Line(points = {{-40, -10}, {-26, -10}, {-26, -10}, {-24, -10}}, color = {0, 0, 127}, thickness = 0.5));
  connect(pickAndPlace2.pose, inverseKinematic.pose) annotation(
    Line(points = {{-80, -10}, {-60, -10}}));
  annotation(
    experiment(StartTime = 0, StopTime = 0.5026, Tolerance = 1e-06, Interval = 0.0102571),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --maxSizeLinearTearing=300 --maxSizeNonlinearTearing=300");
end DeltaRobot_IdealActPos_PositionValidation;
