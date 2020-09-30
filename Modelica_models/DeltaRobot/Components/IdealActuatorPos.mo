within DeltaRobot.Components;

model IdealActuatorPos "Model of a rotary actuator with controllable angle and first order dynamic motion"
    extends DeltaRobot.Icons.IdealActuatorPos;   // Icon
    extends DeltaRobot.Components.PartialActuator;

    // Imports
    import Modelica.Constants.inf;
    import Modelica.Blocks.Types.Init;
    
    // First order filter
    parameter Real Tf = 0.02 "Time constant of the first order filter applied to the input reference angle" annotation (Dialog(group="First order filter"));
    parameter Init initType = Init.NoInit "Type of initialization of first order filter (1: no init, 2: steady state, 3/4: initial output)" annotation(Dialog(group="First order filter"));
    parameter Real y_start = 0 "Initial or guess value of first order filter output (= state)" annotation (Dialog(group="First order filter"));
    parameter Boolean y_startFixed = false "=true, if you want to use the filter initial output as initial equation" annotation (Dialog(group="First order filter"));

    // Limits
    parameter Boolean enableLimiter = true "=true, if you want to limit the input reference angle within interval [minTheta, maxTheta]" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxTheta = from_deg(85) "Max actuator angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle minTheta = from_deg(-85) "Min actuator angle" annotation(Dialog(group="Limits"));

    // Models
    Modelica.Blocks.Interfaces.RealInput angleRef annotation (Placement(transformation(extent={{20,-20},{-20,20}},rotation=90,origin={0,120})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(
        T=Tf, 
        initType = initType, 
        k=reducerParameters.ratio, 
        y(fixed = y_startFixed), 
        y_start = y_start) 
        annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
    Modelica.Mechanics.Rotational.Sources.Position position annotation (Placement(transformation(extent={{-52,26},{-32,46}})));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax=if enableLimiter then maxTheta else inf, uMin=if enableLimiter then minTheta else -inf) annotation (Placement(transformation(extent={{-20,70},{-40,90}})));

equation
    connect(firstOrder.y, position.phi_ref) annotation (Line(points={{-61,36},{-54,36}}, color={0,0,127}));
    connect(limiter.y, firstOrder.u) annotation (Line(points={{-41,80},{-90,80},{-90,36},{-84,36}}, color={0,0,127}));
    connect(limiter.u, angleRef) annotation (Line(points={{-18,80},{0,80},{0,120}}, color={0,0,127}));
    connect(position.flange, gearReducer.flange_a) annotation (Line(points={{-32,36},{-22,36}}, color={0,0,0}));

end IdealActuatorPos;
