within DeltaRobot.Components;

model ServoMotor "Simplified model of a permanent magnet synchronous induction machine"
  extends DeltaRobot.Icons.ServoMotor; // Icon

  // Imports
  import Modelica.Constants.inf;

  // Parameters
  parameter DeltaRobot.Types.ServoMotorParameters servoMotorParameters "Parameters of the servo motor";

  // Variables
  SI.Angle phi "Absolute mechanical rotation angle (flange.phi)";
  SI.AngularVelocity w "Mechanical angular velocity (der(phi))";
  SI.AngularAcceleration a "Mechanical angular acceleration (der(w))";
  SI.Torque Tref "Reference mechanical torque for shaft";
  SI.Torque T "Mechanical torque for shaft (flange.tau)";
  SI.Power Pmecc "Output mechanical power";

  // Models
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft" annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  DeltaRobot.Interfaces.AxisControlBus axisControlBus annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}}), iconTransformation(extent = {{-24, 24}, {24, -24}}, rotation = 90, origin = {-58, 4})));  

protected
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = if servoMotorParameters.enableLimiter then servoMotorParameters.Tmax else inf, uMin = if servoMotorParameters.enableLimiter then -servoMotorParameters.Tmax else -inf) 
    annotation(Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{60, -10}, {80, 10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{80, -50}, {60, -30}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{80, 30}, {60, 50}})));
  Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor annotation(Placement(visible = true, transformation(origin = {70, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));

equation
  phi = angleSensor.phi;
  w = speedSensor.w;
  a = accSensor.a;
  Tref = limiter.u;
  T = limiter.y;
  Pmecc = w * T;
  
  connect(torque.flange, flange) annotation(Line(points = {{80, 0}, {100, 0}}, color = {0, 0, 0}));
  connect(angleSensor.flange, flange) annotation(Line(points = {{80, -40}, {100, -40}, {100, 0}}, color = {0, 0, 0}));
  connect(speedSensor.flange, flange) annotation(Line(points = {{80, 40}, {100, 40}, {100, 0}}, color = {0, 0, 0}));  
  connect(accSensor.flange, flange) annotation(Line(points = {{80, 70}, {100, 70}, {100, 0}, {100, 0}}));
  connect(limiter.y, torque.tau) annotation(Line(points = {{-18, 0}, {56, 0}, {56, 0}, {58, 0}}, color = {0, 0, 127}));
  connect(axisControlBus.refTorque, limiter.u) annotation(Line(points = {{-59.95, 0.05}, {-50, 0.05}, {-50, 0}, {-42, 0}}, color = {255, 204, 51}));
  connect(angleSensor.phi, axisControlBus.angularPos) annotation(Line(points = {{59, -40}, {-59.95, -40}, {-59.95, 0.05}}, color = {0, 0, 127}));
  connect(speedSensor.w, axisControlBus.angularVel) annotation(Line(points = {{60, 40}, {-60, 40}, {-60, 0}, {-60, 0}}, color = {0, 0, 127}));
  connect(accSensor.a, axisControlBus.angularAcc) annotation(Line(points = {{60, 70}, {-60, 70}, {-60, 0}, {-60, 0}}, color = {0, 0, 127}));
  connect(limiter.y, axisControlBus.appliedTorque);
  
end ServoMotor;