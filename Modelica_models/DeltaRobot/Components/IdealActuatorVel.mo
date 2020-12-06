within DeltaRobot.Components;

model IdealActuatorVel "Model of a rotary actuator with controllable angular velocity with first order control dynamic"
    extends DeltaRobot.Icons.IdealActuatorVel;     // Icon
    extends DeltaRobot.Components.PartialActuator;

// Imports
    import Modelica.Blocks.Types.Init;
   
// Models
    Modelica.Blocks.Interfaces.RealInput angleVelRef annotation (Placement(transformation(extent={{20,-20},{-20,20}},rotation=90,origin={0,120})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(
        T = actuatorParameters.Tf, 
        initType = actuatorParameters.initType, 
        k = reducerParameters.ratio, 
        y(fixed = actuatorParameters.y_startFixed), 
        y_start = actuatorParameters.y_start)  
        annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
    Modelica.Mechanics.Rotational.Sources.Speed speed(phi(fixed=false)) annotation (Placement(transformation(extent={{-52,26},{-32,46}})));

equation
    connect(firstOrder.y, speed.w_ref) annotation (Line(points={{-61,36},{-54,36}}, color={0,0,127}));
    connect(speed.flange, gearReducer.flange_a) annotation (Line(points={{-32,36},{-22,36}}, color={0,0,0}));
    connect(firstOrder.u, angleVelRef) annotation(Line(points = {{-84, 36}, {-100, 36}, {-100, 80}, {0, 80}, {0, 120}, {0, 120}}, color = {0, 0, 127}));
end IdealActuatorVel;
