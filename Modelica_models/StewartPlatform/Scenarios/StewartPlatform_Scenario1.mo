within StewartPlatform.Scenarios;

model StewartPlatform_Scenario1
  extends StewartPlatform.Icons.Scenario;
  // Icon
  inner Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Components.Platform platform annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Components.Base base annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.SixLegs sixLegs annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Components.Controller controller( limitOutputs = true)  annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ReferenceSignals.LinearTrajectory linearTrajectory(angles_stop = {20, 20, 20}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, stopPosition = {0, 0, 1.60}) annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(platform.frame_b, sixLegs.frame_platform) annotation(
    Line(points = {{40, 26}, {40, 26}, {40, 20}, {40, 20}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base.frame_b, sixLegs.frame_base) annotation(
    Line(points = {{40, -26}, {40, -26}, {40, -20}, {40, -20}}, color = {95, 95, 95}, thickness = 0.5));
    
  connect(controller.controlBus, sixLegs.controlBus) annotation(
    Line(origin = {10, 0}, points = {{-10, 0}, {10, 0}}, color = {255, 204, 51}, thickness = 0.5));
  connect(linearTrajectory.pose, controller.inputPose) annotation(
    Line(origin = {-30, 0}, points = {{-10, 0}, {10, 0}}, color = {95, 95, 95}, thickness = 0.5));
    
annotation(__OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst --maxSizeLinearTearing=400");

end StewartPlatform_Scenario1;
