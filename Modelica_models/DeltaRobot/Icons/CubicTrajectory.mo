within DeltaRobot.Icons;

model CubicTrajectory "Icon for 'CubicTrajectory' model"
equation
    annotation (Icon(graphics={   
        Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
        Line(
            points={{-80,68},{-80,-80}},
            color={192,192,192}),
        Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
        Line(
            points={{-90,-70},{82,-70}},
            color={192,192,192}),
        Line(
            points={{-60,-40},{-20,-40},{20,60},{60,60}},
            color={0,0,0},
            smooth=Smooth.Bezier),
        Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}));
end CubicTrajectory;
