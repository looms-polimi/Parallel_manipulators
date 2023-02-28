within DeltaRobot.Icons;

model Command "Icon for '...Command' model"
equation
    annotation (Icon(graphics={
    Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
    Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
    Line(
        points={{-80.0,68.0},{-80.0,-80.0}},
        color={192,192,192}),
    Line(
        points={{-90.0,-70.0},{82.0,-70.0}},
        color={192,192,192}),
    Polygon(
        lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
    Rectangle(
        lineColor={255,255,255},
        fillColor={255,215,136},
        fillPattern=FillPattern.Solid,
        extent={{-48.0,-50.0},{2.0,70.0}}),
    Line(
        points={{-48.0,-50.0},{-48.0,70.0},{52.0,70.0},{52.0,-50.0},{-48.0,-50.0},{-48.0,-20.0},{52.0,-20.0},{52.0,10.0},{-48.0,10.0},{-48.0,40.0},{52.0,40.0},{52.0,70.0},{2.0,70.0},{2.0,-51.0}}),
    Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})
    }));
end Command;
