within DeltaRobot.Components;
model IdealActuatorVel "Model of a rotary actuator with controllable angular velocity with first order control dynamic"
  extends DeltaRobot.Icons.IdealActuator;
  extends DeltaRobot.Components.PartialActuator;

  //Imports
    import Modelica.Constants.inf;

  //Parameters
    parameter Real Tf = 0.02 "Time constant of the first order filter applied to the angular speed ref. input";
    parameter Real gain = 1 "Additional gain for the reference signal";

  Modelica.Blocks.Interfaces.RealInput angleRef annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,120})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=Tf,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    k=gain*reducerParameters.ratio)                        annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed(phi(fixed=false))          annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
equation
  connect(firstOrder.y, speed.w_ref) annotation (Line(points={{-61,36},{-52,36}}, color={0,0,127}));
  connect(angleRef, firstOrder.u) annotation (Line(points={{0,120},{0,80},{-94,80},{-94,36},{-84,36}}, color={0,0,127}));
  connect(speed.flange, gearReducer.flange_a) annotation (Line(points={{-30,36},{-22,36}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true), graphics={Text(
          extent={{-40,-60},{40,-100}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="Vel.")}),Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="Finito");
end IdealActuatorVel;
