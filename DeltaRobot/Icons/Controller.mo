within DeltaRobot.Icons;

model Controller "Icon for 'Controller' model"
equation
    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,0},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-10,54},{50,24}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{-10,40},{-40,50},{-40,30},{-10,40}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-10,-40},{-46,-40},{-46,40},{-10,40}},
            color={0,0,255}),
          Rectangle(
            extent={{-10,-24},{50,-54}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{80,-30},{50,-40},{80,-50},{80,-30}},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Line(
            points={{50,-40},{86,-40},{86,40},{50,40}},
            color={0,0,255}),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})
        }));
end Controller;
