within DeltaRobot.Components;

model ServoMotor "Simplified model of a permanent magnet synchronous induction machine"
    extends DeltaRobot.Icons.ServoMotor;

    // Imports
    import Modelica.Constants.inf;
    import Modelica.Blocks.Types.Init;

    // Parameters
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters "Parameters of the servo motor";
    parameter Boolean enableLimiter = true "=true, if you want to limit the input reference torque within interval [-SMparameters.Tmax, SMparameters.Tmax]";

    // First order filter
    parameter Init initType = Init.NoInit "Type of initialization of first order filter (1: no init, 2: steady state, 3/4: initial output)" annotation(Dialog(group="First order filter"));
    parameter Real y_start = 0 "Initial or guess value of first order filter output (= state)" annotation (Dialog(group="First order filter"));
    parameter Boolean y_startFixed = false "=true, if you want to use the filter initial output as initial equation" annotation (Dialog(group="First order filter"));

    // Variables
    SI.Angle phi "Absolute mechanical rotation angle (flange.phi)";
    SI.AngularVelocity w "Mechanical angular velocity (der(phi))";
    SI.Torque Tref "Reference mechanical torque for shaft (flange.tau)";
    SI.Torque T "Mechanical torque of shaft (flange.tau)";
    SI.Power Pmecc "Output mechanical power";

    // Models
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft" annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
    Interfaces.AxisControlBus axisControlBus annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}}), iconTransformation(extent = {{-24, 24}, {24, -24}}, rotation = 90, origin = {-58, 4})));

//protected
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax=if enableLimiter then SMparameters.Tmax else inf, uMin=if enableLimiter then -SMparameters.Tmax else -inf) annotation(Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
    Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{60, -10}, {80, 10}})));
    Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{80, -50}, {60, -30}})));
    Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{80, 30}, {60, 50}})));

    Modelica.Blocks.Continuous.FirstOrder controlBandwidth(
      T = 1 / SMparameters.bandwidth, 
      initType = initType, 
      y(fixed = y_startFixed), 
      y_start = y_start) 
      annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}})));

equation  
  phi = angleSensor.phi;
  w = speedSensor.w;
  Tref = controlBandwidth.u;
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
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end ServoMotor;
