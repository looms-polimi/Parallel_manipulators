within DeltaRobot.Components;

model IdealActuatorPos "Model of a rotary actuator with controllable angle and first order dynamic motion"
    extends DeltaRobot.Icons.IdealActuatorPos;   // Icon
    extends DeltaRobot.Components.PartialActuator;

    // Imports
    import Modelica.Constants.inf;       

    // Models
    Modelica.Blocks.Interfaces.RealInput angleRef annotation (Placement(transformation(extent={{20,-20},{-20,20}},rotation=90,origin={0,120})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(
        T = actuatorParameters.Tf, 
        initType = actuatorParameters.initType, 
        k = reducerParameters.ratio, 
        y(fixed = actuatorParameters.y_startFixed), 
        y_start = actuatorParameters.y_start) 
        annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
    Modelica.Mechanics.Rotational.Sources.Position position annotation (Placement(transformation(extent={{-52,26},{-32,46}})));
    Modelica.Blocks.Nonlinear.Limiter limiter(
        uMax = if actuatorParameters.enableLimiter then actuatorParameters.maxTheta else inf,
        uMin = if actuatorParameters.enableLimiter then actuatorParameters.minTheta else -inf) 
        annotation (Placement(transformation(extent={{-20,70},{-40,90}})));

equation
    connect(firstOrder.y, position.phi_ref) annotation (Line(points={{-61,36},{-54,36}}, color={0,0,127}));
    connect(limiter.y, firstOrder.u) annotation (Line(points={{-41,80},{-90,80},{-90,36},{-84,36}}, color={0,0,127}));
    connect(limiter.u, angleRef) annotation (Line(points={{-18,80},{0,80},{0,120}}, color={0,0,127}));
    connect(position.flange, gearReducer.flange_a) annotation (Line(points={{-32,36},{-22,36}}, color={0,0,0}));

end IdealActuatorPos;
