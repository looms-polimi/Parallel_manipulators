within DeltaRobot.Components;

model IdealActuatorVel "Model of a rotary actuator with controllable angular velocity with first order control dynamic"
    extends DeltaRobot.Icons.IdealActuatorVel;     // Icon
    extends DeltaRobot.Components.PartialActuator;

// Imports
    import Modelica.Blocks.Types.Init;
    // First order filter
    parameter Real Tf = 0.02 "Time constant of the first order filter applied to the input reference angular velocity" annotation (Dialog(group="First order filter"));
    parameter Init initType = Init.NoInit "Type of initialization of first order filter (1: no init, 2: steady state, 3/4: initial output)" annotation(Dialog(group="First order filter"));
    parameter Real y_start = 0 "Initial or guess value of first order filter output (= state)" annotation (Dialog(group="First order filter"));
    parameter Boolean y_startFixed = false "=true, if you want to use the filter initial output as initial equation" annotation (Dialog(group="First order filter"));

// Models
    Modelica.Blocks.Interfaces.RealInput angleVelRef annotation (Placement(transformation(extent={{20,-20},{-20,20}},rotation=90,origin={0,120})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(
        T=Tf, 
        initType = initType, 
        k=reducerParameters.ratio, 
        y(fixed = y_startFixed), 
        y_start = y_start) 
        annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
    Modelica.Mechanics.Rotational.Sources.Speed speed(phi(fixed=false)) annotation (Placement(transformation(extent={{-52,26},{-32,46}})));

equation
    connect(firstOrder.y, speed.w_ref) annotation (Line(points={{-61,36},{-54,36}}, color={0,0,127}));
    connect(speed.flange, gearReducer.flange_a) annotation (Line(points={{-32,36},{-22,36}}, color={0,0,0}));
    connect(firstOrder.u, angleVelRef) annotation(Line(points = {{-84, 36}, {-100, 36}, {-100, 80}, {0, 80}, {0, 120}, {0, 120}}, color = {0, 0, 127}));
end IdealActuatorVel;
