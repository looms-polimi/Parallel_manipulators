within StewartPlatform.Components;

model IdealLinearActuator "Model of a linear actuator with controllable length and first order dynamic motion"
  extends StewartPlatform.Icons.IdealLinearActuator; // Icon
  extends StewartPlatform.Components.PartialElectricCylinder;

// Imports
    import Modelica.Constants.inf;

// Parameters
    parameter Boolean enableLimiter = true
      "=true, if you want to limit the input ref. length within [minLength, maxLength] with (minLength = boxLength+minPistonLength ) and ( maxLength=minLength+workingStroke)";
    parameter Real Tf = 0.05 "Time constant of the first order filter applied to the length ref. input";

// Models
  Modelica.Mechanics.Translational.Sources.Position position annotation (Placement(transformation(extent={{-22,18},{-2,38}})));
  Modelica.Blocks.Interfaces.RealInput lengthRef 
    annotation (Placement(transformation(
      extent={{20,-20},{-20,20}},
      rotation=90,
      origin={0,102})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = Tf, y_start = pj_initialLength) annotation (Placement(transformation(extent={{-60,18},{-40,38}})));
  Modelica.Blocks.Nonlinear.Limiter 
    limiter(
      uMax=if enableLimiter then ECparameters.maxLength else inf, 
      uMin=if enableLimiter then ECparameters.minLength else -inf)
    annotation (Placement(transformation(extent={{-32,60},{-52,80}})));

equation
  drivingTorque=feedForce*ECparameters.spindlePitch/(1000*2*pi);

  connect(lengthRef, limiter.u) annotation (Line(points={{0,102},{0,70},{-30,70}}, color={0,0,127}));
  connect(position.s_ref, firstOrder.y) annotation (Line(points={{-24,28},{-39,28}}, color={0,0,127}));
  connect(limiter.y, firstOrder.u) annotation (Line(points={{-53,70},{-76,70},{-76,28},{-62,28}}, color={0,0,127}));
  connect(position.flange, prismatic.axis) annotation (Line(points={{-2,28},{8,28},{8,6}},color={0,127,0}));

end IdealLinearActuator;
