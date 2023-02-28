within DeltaRobot.Icons;

model IdealActuator "Icon for 'IdealActuator' model"
equation
    annotation (Icon(graphics={
          Rectangle(
            extent={{40,20},{100,-20}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,20},{-40,-20}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-60,60},{60,-60}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-32,30},{32,-32}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{80,60},{80,40},{60,40},{80,60}},
            lineColor={238,46,47},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{0,80},{0,80}},
            lineColor={28,108,200}),
          Line(
            points={{70,50},{60,60},{40,70},{20,78},{0,80},{-20,76},{-40,70},{-60,60},{-70,50}},
            color={238,46,47},
            smooth=Smooth.Bezier),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})
            }));
end IdealActuator;
