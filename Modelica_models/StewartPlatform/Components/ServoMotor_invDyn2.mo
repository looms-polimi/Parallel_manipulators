within StewartPlatform.Components;

model ServoMotor_invDyn2 "Servo motor model for inverse dynamic"
    extends StewartPlatform.Icons.ServoMotor_invDyn;
  // Icon
  // Models
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft" annotation(
    Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorque annotation(Placement(visible = true, transformation(extent = {{-12, -10}, {8, 10}}, rotation = 0)));
  //Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Modelica.Constants.inf)  annotation(Placement(visible = true, transformation(origin = {-42, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angularPos annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angularVel annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput AngularAcc annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput appliedTorque annotation(
    Placement(visible = true, transformation(origin = {-110, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-110, -70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(angleToTorque.flange, flange) annotation(Line(points = {{0, 0}, {98, 0}, {98, 0}, {100, 0}}));
  connect(angularPos, angleToTorque.phi) annotation(
    Line(points = {{-120, 80}, {-20, 80}, {-20, 8}, {-4, 8}}, color = {0, 0, 127}));
  connect(angularVel, angleToTorque.w) annotation(
    Line(points = {{-120, 40}, {-40, 40}, {-40, 6}, {-4, 6}}, color = {0, 0, 127}));
  connect(AngularAcc, angleToTorque.a) annotation(
    Line(points = {{-120, 0}, {-20, 0}, {-20, 2}, {-4, 2}}, color = {0, 0, 127}));
  connect(angleToTorque.tau, appliedTorque) annotation(
    Line(points = {{-4, -8}, {-20, -8}, {-20, -70}, {-110, -70}}, color = {0, 0, 127}));
end ServoMotor_invDyn2;
