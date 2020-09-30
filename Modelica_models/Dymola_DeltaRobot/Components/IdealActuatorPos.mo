within DeltaRobot.Components;
model IdealActuatorPos "Model of a rotary actuator with controllable angle and first order dynamic motion"
  extends DeltaRobot.Icons.IdealActuator;
  extends DeltaRobot.Components.PartialActuator;

  //Imports
    import Modelica.Constants.inf;

  //Parameters
    parameter Boolean enableLimiter = true
      "=true, if you want to limit the input ref. angle within [minTheta, maxTheta]";
    parameter Real Tf = 0.02 "Time constant of the first order filter applied to the angle ref. input";

    //Limits
    parameter SI.Angle maxTheta = from_deg(85) "Max actuator angle for limiter" annotation(Dialog(group="Limits"));
    parameter SI.Angle minTheta = from_deg(-85) "Min actuator angle for limiter" annotation(Dialog(group="Limits"));

  Modelica.Blocks.Interfaces.RealInput angleRef annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={0,120})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=Tf, k=reducerParameters.ratio)
                                                           annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
  Modelica.Mechanics.Rotational.Sources.Position position(useSupport=false)
                                                                           annotation (Placement(transformation(extent={{-52,26},{-32,46}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=if enableLimiter==true then maxTheta else inf, uMin=if enableLimiter==true then minTheta else -inf) annotation (Placement(transformation(extent={{-20,70},{-40,90}})));
equation
  connect(firstOrder.y, position.phi_ref) annotation (Line(points={{-61,36},{-54,36}}, color={0,0,127}));
  connect(limiter.y, firstOrder.u) annotation (Line(points={{-41,80},{-90,80},{-90,36},{-84,36}}, color={0,0,127}));
  connect(limiter.u, angleRef) annotation (Line(points={{-18,80},{0,80},{0,120}}, color={0,0,127}));
  connect(position.flange, gearReducer.flange_a) annotation (Line(points={{-32,36},{-22,36}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true), graphics={Text(
          extent={{-40,-60},{40,-100}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="Pos.")}),Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="Finito");
end IdealActuatorPos;
