within DeltaRobot.Icons;

model Actuator "Icon for 'Actuator' model"
equation
    annotation (Icon(graphics={
          Rectangle(
            extent={{-8,60},{34,20}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{60,20},{100,-20}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,20},{-2,-20}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-10,40},{70,-40}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{0,30},{60,-30}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{14,16},{46,-16}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{0,80},{0,80}},
            lineColor={28,108,200}),
          Rectangle(
            extent={{-100,80},{-80,20}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-80,74},{-8,20}},
            lineColor={0,0,0},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-68,64},{-22,58}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-68,60},{-20,54}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-68,50},{-22,44}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-68,36},{-22,30}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-68,46},{-20,40}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-68,32},{-20,26}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-20,-40},{0,-58},{30,-64},{62,-58},{78,-40}},
            color={238,46,47},
            smooth=Smooth.Bezier),
          Polygon(
            points={{-26,-30},{-20,-54},{-4,-40},{-26,-30}},
            lineColor={238,46,47},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})
        }));
end Actuator;
