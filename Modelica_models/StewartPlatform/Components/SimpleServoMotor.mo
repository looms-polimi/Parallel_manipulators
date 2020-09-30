within StewartPlatform.Components;

model SimpleServoMotor "Simplified model of a permanent magnet synchronous induction machine"
  extends StewartPlatform.Icons.ServoMotor;
  // Imports
  import Modelica.Blocks.Types.Init;

// Parameters
  parameter StewartPlatform.Types.ServoMotorParameters SMparameters;
  parameter SI.Torque sm_initialTorque = 0 "Initial torque applied by the motor" annotation(Dialog(group="Initialization"));
  parameter Boolean sm_initialTorqueFixed = false "=true, if you want to use initial torque as initial eqation ('fixed' attributes)" annotation (choices(checkBox=true), Dialog(group="Initialization"));
  parameter Init sm_initType = Init.NoInit "Type of initialization of servo motor's internal control (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true, Dialog(group="Initialization"));

// Variables
  SI.Angle phi "Absolute mechanical rotation angle (flange.phi)";
  SI.AngularVelocity w "Mechanical angular velocity (der(phi))";
  SI.Torque Tref "Reference mechanical torque for shaft (flange.tau), limited in [-SMparameters.Tmax,SMparameters.Tmax]";
  SI.Torque T "Mechanical torque of shaft (flange.tau)";
  SI.Power Pmecc "Output mechanical power";

// Models
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft" annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Interfaces.AxisControlBus axisControlBus annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}}), iconTransformation(extent = {{-24, 24}, {24, -24}}, rotation = 90, origin = {-58, 4})));

protected
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = SMparameters.Tmax, uMin = -SMparameters.Tmax) annotation(Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{60, -10}, {80, 10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{80, -50}, {60, -30}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{80, 30}, {60, 50}})));

  Modelica.Blocks.Continuous.FirstOrder controlBandwidth(T = 1 / SMparameters.bandwidth, initType = sm_initType, y(fixed = sm_initialTorqueFixed), y_start = sm_initialTorque) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));

equation  
  phi = angleSensor.phi;
  w = speedSensor.w;
  Tref = controlBandwidth.y;
  T = torque.tau;
  Pmecc = w * T;    

  connect(torque.flange, flange) annotation(Line(points = {{80, 0}, {100, 0}}, color = {0, 0, 0}));
  connect(angleSensor.flange, flange) annotation(Line(points = {{80, -40}, {100, -40}, {100, 0}}, color = {0, 0, 0}));
  connect(speedSensor.flange, flange) annotation(Line(points = {{80, 40}, {100, 40}, {100, 0}}, color = {0, 0, 0}));
  connect(limiter.y, controlBandwidth.u) annotation(Line(points = {{-19, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(axisControlBus.refTorque, limiter.u) annotation(Line(points = {{-59.95, 0.05}, {-50, 0.05}, {-50, 0}, {-42, 0}}, color = {255, 204, 51}, thickness = 0.5),
    Text(string = "%first", index = -1, extent = {{-6, 3}, {-6, 3}}));
  connect(angleSensor.phi, axisControlBus.encoder) annotation(Line(points = {{59, -40}, {-59.95, -40}, {-59.95, 0.05}}, color = {0, 0, 127}),
    Text(string = "%second", index = 1, extent = {{6, 3}, {6, 3}}));
  connect(controlBandwidth.y, torque.tau) annotation(Line(points = {{12, 0}, {58, 0}, {58, 0}, {58, 0}}, color = {0, 0, 127}));
  
annotation(
    Icon(graphics = {Text(origin = {0, 150}, fillColor = {175, 175, 175}, fillPattern = FillPattern.Solid, extent = {{-100, -50}, {-50, -100}}, textString = "Simp", textStyle = {TextStyle.Bold, TextStyle.Bold})}));
end SimpleServoMotor;