within StewartPlatform.Icons;

model Switch2 "Icon for 'Switch2' model"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            fillColor={210,210,210},
            lineThickness=5.0,
            fillPattern=FillPattern.Solid,
            borderPattern=BorderPattern.Raised),
          Ellipse(
            lineColor={0,0,255},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{2.0,-8.0},{18.0,8.0}}),
          Line(
            points={{12.0,0.0},{100.0,0.0}},
            color={0,0,127}),
          Line(
            points={{-100.0,80.0},{-38.0,80.0}},
            color={0,0,127}),
          Line(
            points={{-100,40},{-38,40}},
            color={0,0,127}),
          Line(
            points={{-100,0},{-38,0}},
            color={0,0,127}),
          Line(
            points={{-100,-40},{-38,-40}},
            color={0,0,127}),
          Line(
            points={{-100,-80},{-38,-80}},
            color={0,0,127}),
          Line(
            points={{-38.0,80.0},{6.0,2.0}},
            color={0,0,127},
            thickness=1.0),
          Text(
            extent={{-118,-78},{172,-34}},
            lineColor={0,0,0},
            textString="n=%n",
            textStyle={TextStyle.Bold}),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}));
end Switch2;
