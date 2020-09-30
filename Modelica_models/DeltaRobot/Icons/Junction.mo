within DeltaRobot.Icons;

model Junction "Icon for 'Junction' model"
equation
    annotation (Icon(graphics={
        Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Polygon(
            points={{-40,90},{-48,68},{-32,68},{-40,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
        Line(
            points={{-40,68},{-40,-80}},
            color={192,192,192}),
        Line(
            points={{-60,-70},{82,-70}},
            color={192,192,192}),
        Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
        Line(
            points={{0,-40},{0,60},{80,60}},
            color={0,0,0},
            smooth=Smooth.Bezier),
        Line(
            points={{0,80},{0,12}},
            color={0,0,0},
            smooth=Smooth.Bezier,
            pattern=LinePattern.Dash),
        Line(
            points={{-20,60},{12,60},{40,60}},
            color={0,0,0},
            pattern=LinePattern.Dash,
            smooth=Smooth.Bezier),
        Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}));
end Junction;
