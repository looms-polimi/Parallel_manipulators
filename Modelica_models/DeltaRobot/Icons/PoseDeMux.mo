within DeltaRobot.Icons;

model PoseDeMux "Icon for 'PoseDeMux' model"
equation
    annotation (Icon(graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-92,0},{2,0}},
          color={135,135,135}),
        Line(
          points={{98,60},{60,60},{4,6}},
          color={0,127,0}),
        Line(
          points={{98,-60},{60,-60},{4,-4}},
          color={255,0,0}),
        Line(
          points={{8,0},{102,0}},
          color={0,0,127}),
        Ellipse(
          extent={{-14,16},{16,-14}},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,255}),         
        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})
    }));
end PoseDeMux;
