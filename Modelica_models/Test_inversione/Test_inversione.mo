model Test_inversione
  Modelica.Blocks.Sources.Sine Torque_input_D(f = 10) annotation(
    Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia Inertia_2_D(J = 0.01, a(start = 0), phi(displayUnit = "rad", start = 0), w(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia Inertia_1_D(J = 0.01, a(start = 0), phi(displayUnit = "rad", start = 0), stateSelect = StateSelect.always, w(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque Torque_D annotation(
    Placement(visible = true, transformation(origin = {-88, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(
    Placement(visible = true, transformation(origin = {-18, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(visible = true, transformation(origin = {-18, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor annotation(
    Placement(visible = true, transformation(origin = {-18, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia Inertia_1_I(J = 0.01, a(start = 0), phi(displayUnit = "rad", start = 0), stateSelect = StateSelect.always, w(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {72, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia Inertia_2_I(J = 0.01, a(start = 0), phi(displayUnit = "rad", start = 0), w(start = 0)) annotation(
    Placement(visible = true, transformation(origin = {110, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.AngleToTorqueAdaptor Torque_I annotation(
    Placement(visible = true, transformation(extent = {{32, -18}, {52, 2}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback Torque_difference annotation(
    Placement(visible = true, transformation(origin = {-58, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(Inertia_1_D.flange_b, Inertia_2_D.flange_a) annotation(
    Line(points = {{0, 30}, {20, 30}}));
  connect(Torque_input_D.y, Torque_D.tau) annotation(
    Line(points = {{-109, 30}, {-100, 30}}, color = {0, 0, 127}));
  connect(Inertia_1_I.flange_b, Inertia_2_I.flange_a) annotation(
    Line(points = {{82, -8}, {100, -8}}));
  connect(Inertia_1_I.flange_a, Torque_I.flange) annotation(
    Line(points = {{62, -8}, {44, -8}, {44, -8}, {44, -8}}));
  connect(angleSensor.phi, Torque_I.phi) annotation(
    Line(points = {{-7, 0}, {39, 0}}, color = {0, 0, 127}));
  connect(speedSensor.w, Torque_I.w) annotation(
    Line(points = {{-7, -20}, {-1, -20}, {-1, -4}, {39, -4}, {39, -3}}, color = {0, 0, 127}));
  connect(accSensor.a, Torque_I.a) annotation(
    Line(points = {{-7, -40}, {7, -40}, {7, -6}, {39, -6}}, color = {0, 0, 127}));
  connect(torqueSensor.flange_b, Inertia_1_D.flange_a) annotation(
    Line(points = {{-40, 30}, {-20, 30}, {-20, 30}, {-20, 30}}));
  connect(Torque_D.flange, torqueSensor.flange_a) annotation(
    Line(points = {{-78, 30}, {-60, 30}, {-60, 30}, {-60, 30}}));
  connect(torqueSensor.flange_b, angleSensor.flange) annotation(
    Line(points = {{-40, 30}, {-40, 30}, {-40, 0}, {-28, 0}, {-28, 0}}));
  connect(torqueSensor.flange_b, speedSensor.flange) annotation(
    Line(points = {{-40, 30}, {-40, 30}, {-40, -20}, {-28, -20}, {-28, -20}}));
  connect(torqueSensor.flange_b, accSensor.flange) annotation(
    Line(points = {{-40, 30}, {-40, 30}, {-40, -40}, {-28, -40}, {-28, -40}}));
  connect(torqueSensor.tau, Torque_difference.u2) annotation(
    Line(points = {{-58, 20}, {-58, -52}}, color = {0, 0, 127}));
  connect(Torque_I.tau, Torque_difference.u1) annotation(
    Line(points = {{39, -16}, {20, -16}, {20, -60}, {-50, -60}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  Diagram(graphics = {Rectangle(origin = {11, 34}, lineColor = {0, 0, 255}, fillColor = {255, 0, 0}, extent = {{-43, 20}, {43, -20}}), Text(origin = {10, 63}, lineColor = {0, 0, 255}, extent = {{26, -7}, {-26, 7}}, textString = "Dinamica diretta"), Rectangle(origin = {11, 34}, lineColor = {0, 0, 255}, fillColor = {255, 0, 0}, extent = {{-43, 20}, {43, -20}}), Rectangle(origin = {79, -9}, lineColor = {255, 0, 0}, extent = {{-53, 19}, {53, -19}}), Text(origin = {78, -35}, lineColor = {255, 0, 0}, extent = {{26, -7}, {-26, 7}}, textString = "Dinamica inversa")}),
  Icon,
  version = "");
end Test_inversione;
