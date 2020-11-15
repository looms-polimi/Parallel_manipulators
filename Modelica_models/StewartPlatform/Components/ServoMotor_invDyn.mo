within StewartPlatform.Components;

model ServoMotor_invDyn "Servo motor model for inverse dynamic"
    extends StewartPlatform.Icons.ServoMotor_invDyn; // Icon

  // Models
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft" annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  StewartPlatform.Interfaces.AxisControlBus axisControlBus annotation(Placement(visible = true,transformation(extent = {{-90, -10}, {-70, 10}}, rotation = 0), iconTransformation( origin = {-58, 4},extent = {{-24, 24}, {24, -24}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor angleToTorque annotation(Placement(visible = true, transformation(extent = {{-12, -10}, {8, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = Modelica.Constants.inf)  annotation(Placement(visible = true, transformation(origin = {-42, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(angleToTorque.flange, flange) annotation(Line(points = {{0, 0}, {98, 0}, {98, 0}, {100, 0}}));
  connect(angleToTorque.phi, axisControlBus.angularPos) annotation(Line(points = {{-4, 8}, {-80, 8}, {-80, 0}}, color = {0, 0, 127}));
  connect(angleToTorque.w, axisControlBus.angularVel) annotation(Line(points = {{-4, 6}, {-80, 6}, {-80, 0}}, color = {0, 0, 127}));
  connect(limiter.u, axisControlBus.angularAcc) annotation(Line(points = {{-54, -10}, {-78, -10}, {-78, 0}, {-80, 0}}, color = {0, 0, 127}));
  connect(limiter.y, angleToTorque.a) annotation(Line(points = {{-30, -10}, {-24, -10}, {-24, 2}, {-4, 2}, {-4, 2}}, color = {0, 0, 127}));
  connect(angleToTorque.tau, axisControlBus.appliedTorque) annotation(Line(points = {{-4, -8}, {-10, -8}, {-10, -40}, {-80, -40}, {-80, 0}, {-80, 0}}, color = {0, 0, 127}));

end ServoMotor_invDyn;
