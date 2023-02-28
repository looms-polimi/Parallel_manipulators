within StewartPlatform.Scenarios;

model StewartPlatform_InverseDynamic3
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
  ReferenceSignals.Paths.Path_example3 path annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Base base_invDyn annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.SixLegs_invDyn sixLegs_invDyn annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.Platform platform_invDyn annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
equation
  connect(platform.frame_b, sixLegs.frame_platform) annotation(
    Line(points = {{-40, 25.2}, {-40, 25.2}, {-40, 19.2}, {-40, 19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base.frame_b, sixLegs.frame_base) annotation(
    Line(points = {{-40, -25.2}, {-40, -25.2}, {-40, -19.2}, {-40, -19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(controller.controlBus, sixLegs.controlBus) annotation(
    Line(points = {{-80, -0.2}, {-60, -0.2}}, color = {255, 204, 51}, thickness = 0.5));
  connect(path.pose, controller.inputPose) annotation(
    Line(points = {{-121, 0}, {-101, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base_invDyn.frame_b, sixLegs_invDyn.frame_base) annotation(
    Line(points = {{40, -26}, {40, -26}, {40, -20}, {40, -20}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sixLegs_invDyn.frame_platform, platform_invDyn.frame_b) annotation(
    Line(points = {{40, 20}, {40, 20}, {40, 26}, {40, 26}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sixLegs.controlBus, sixLegs_invDyn.controlBus) annotation(
    Line(points = {{20, 0}, {0, 0}, {0, -80}, {-70, -80}, {-70, 0}, {-62, 0}}, color = {255, 204, 51}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst --maxSizeLinearTearing=400");
end StewartPlatform_InverseDynamic3;
