within StewartPlatform.Scenarios;

model StewartPlatform_Scenario1
  extends StewartPlatform.Icons.Scenario; // Icon
  
  inner StewartPlatform.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.SixLegs sixLegs(ec_initialLengthFixed = fill(true, 6), ec_initialVelFixed = fill(true, 6), ec_stateSelect = fill(StateSelect.always, 6), uj_stateSelect = fill(StateSelect.never, 6)) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.Base base annotation(
    Placement(visible = true, transformation(origin = {1, -47}, extent = {{-19, -19}, {19, 19}}, rotation = 0)));
  StewartPlatform.Components.Platform platform(fixInitOrientation = false, fixInitPosition = false, useGlobalParameters = true)  annotation(
    Placement(visible = true, transformation(origin = {0, 44}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Components.Controller controller(limitOutputs = true) annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.ReferenceSignals.LinearTrajectory linearTrajectory(angles_stop = {20, 20, 20}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, stopPosition = {0, 0, 1.60}) annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sixLegs.frame_base, base.frame_b) annotation(
    Line(points = {{0, -20}, {0, -20}, {0, -32}, {2, -32}}, thickness = 0.5));
  connect(platform.frame_b, sixLegs.frame_platform) annotation(
    Line(points = {{0, 30}, {2, 30}, {2, 20}, {0, 20}}, color = {95, 95, 95}, thickness = 0.5));
  connect(controller.controlBus, sixLegs.controlBus);
  connect(linearTrajectory.pose, controller.inputPose);
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--maxSizeLinearTearing=350 and --maxSizeNonlinearTearing=350 --matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst");
end StewartPlatform_Scenario1;
