within StewartPlatform.Scenarios;

model StewartPlatform_InverseDynamic1_noBus
  extends StewartPlatform.Icons.Scenario;
  // Icon
  inner Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Platform platform(basePos = {1, 0, 0}, useGlobalParameters = false)   annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Components.Base base(basePos = {1, 0, 0}, useGlobalParameters = false)   annotation(
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.SixLegs sixLegs annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.Controller controller( limitOutputs = true, useGlobalParameters = true)  annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ReferenceSignals.LinearTrajectory linearTrajectory(angles_stop = {20, 20, 20}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, stopPosition = {0, 0, 1.60}) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Base base_invDyn annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.SixLegs_invDyn2 sixLegs_invDyn annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.Platform platform_invDyn annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Interfaces.ControlBusDeMux controlBusDeMux annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(platform.frame_b, sixLegs.frame_platform) annotation(
    Line(points = {{-40, 25.2}, {-40, 25.2}, {-40, 19.2}, {-40, 19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base.frame_b, sixLegs.frame_base) annotation(
    Line(points = {{-40, -25.2}, {-40, -25.2}, {-40, -19.2}, {-40, -19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(controller.controlBus, sixLegs.controlBus) annotation(
    Line(points = {{-80, -0.2}, {-60, -0.2}}, color = {255, 204, 51}, thickness = 0.5));
  connect(linearTrajectory.pose, controller.inputPose) annotation(
    Line(points = {{-121, 0}, {-101, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base_invDyn.frame_b, sixLegs_invDyn.frame_base) annotation(
    Line(points = {{40, -26}, {40, -26}, {40, -20}, {40, -20}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sixLegs_invDyn.frame_platform, platform_invDyn.frame_b) annotation(
    Line(points = {{40, 20}, {40, 20}, {40, 26}, {40, 26}}, color = {95, 95, 95}, thickness = 0.5));
  connect(controller.controlBus, controlBusDeMux.controlBus) annotation(
    Line(origin = {-65, -40}, points = {{15, -40}, {-3, -40}, {-3, 40}, {-15, 40}}, color = {255, 204, 51}, thickness = 0.5));
  connect(controlBusDeMux.angularPos, sixLegs_invDyn.angularPos) annotation(
    Line(points = {{-28, -72}, {-12, -72}, {-12, 12}, {16, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(controlBusDeMux.angularVel, sixLegs_invDyn.angularVel) annotation(
    Line(points = {{-28, -74}, {0, -74}, {0, 0}, {16, 0}}, color = {0, 0, 127}, thickness = 0.5));
  connect(controlBusDeMux.angularAcc, sixLegs_invDyn.angularAcc) annotation(
    Line(points = {{-28, -78}, {6, -78}, {6, -12}, {16, -12}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst --maxSizeLinearTearing=400");
end StewartPlatform_InverseDynamic1_noBus;
