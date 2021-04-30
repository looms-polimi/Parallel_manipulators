within StewartPlatform.Scenarios;

model StewartPlatform_FMUexport_noBus
  extends StewartPlatform.Icons.Scenario;
  // Icon
  inner Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.Base base_invDyn annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.SixLegs_invDyn2 sixLegs_invDyn annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.Platform platform_invDyn annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
equation
  connect(base_invDyn.frame_b, sixLegs_invDyn.frame_base) annotation(
    Line(points = {{0, -25.2}, {0, -25.2}, {0, -19.2}, {0, -19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sixLegs_invDyn.frame_platform, platform_invDyn.frame_b) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, 26}, {0, 26}}, color = {95, 95, 95}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst --maxSizeLinearTearing=400");
end StewartPlatform_FMUexport_noBus;
