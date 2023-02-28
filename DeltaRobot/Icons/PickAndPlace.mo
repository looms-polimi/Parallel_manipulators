within DeltaRobot.Icons;

model PickAndPlace "Icon for 'PickAndPlace' model"
equation
    annotation (Icon(graphics={
        Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Polygon(
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
        Line(
            points={{-80.0,68.0},{-80.0,-80.0}},
            color={192,192,192}),
        Polygon(
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
        Line(
            points={{-90.0,-70.0},{82.0,-70.0}},
            color={192,192,192}),
        Line(
            points={{-30,40}},
            color={0,0,0},
            smooth=Smooth.Bezier),
        Line(
            points={{-66,-20},{-66,40},{-6,40}},
            color={0,0,0},
            smooth=Smooth.Bezier),
        Line(
            points={{54,-20},{54,40},{-6,40}},
            color={0,0,0},
            smooth=Smooth.Bezier),
        Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})
        }));
end PickAndPlace;
