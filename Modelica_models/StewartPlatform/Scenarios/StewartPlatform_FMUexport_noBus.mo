within StewartPlatform.Scenarios;

model StewartPlatform_FMUexport_noBus
  extends StewartPlatform.Icons.Scenario; // Icon
  
  inner StewartPlatform.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, n = {0, 0, -1})  annotation(
    Placement(visible = true, transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.Base base_invDyn annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.SixLegs_invDyn2 sixLegs_invDyn annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.Platform platform_invDyn annotation(
    Placement(visible = true, transformation(origin = {0, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput positions[6] annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput velocities[6] annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput accelerations[6] annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput torques[6] annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(base_invDyn.frame_b, sixLegs_invDyn.frame_base) annotation(
    Line(points = {{0, -25.2}, {0, -25.2}, {0, -19.2}, {0, -19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sixLegs_invDyn.frame_platform, platform_invDyn.frame_b) annotation(
    Line(points = {{0, 20}, {0, 20}, {0, 26}, {0, 26}}, color = {95, 95, 95}, thickness = 0.5));
  connect(positions, sixLegs_invDyn.angularPos) annotation(
    Line(points = {{-120, 60}, {-60, 60}, {-60, 12}, {-24, 12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(velocities, sixLegs_invDyn.angularVel) annotation(
    Line(points = {{-120, 0}, {-24, 0}}, color = {0, 0, 127}, thickness = 0.5));
  connect(accelerations, sixLegs_invDyn.angularAcc) annotation(
    Line(points = {{-120, -60}, {-60, -60}, {-60, -12}, {-24, -12}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sixLegs_invDyn.appliedTorque, torques) annotation(
    Line(points = {{22, 0}, {110, 0}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst --maxSizeLinearTearing=400");
end StewartPlatform_FMUexport_noBus;
