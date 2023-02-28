within StewartPlatform.Icons;

model Path "Icon for 'Path' models"
    annotation (Icon(graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255}),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,78},{-80,-82}}, color={192,192,192}),
          Line(points={{-90,0},{82,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-42,55},{29,12}},
            lineColor={192,192,192},
            textString="w"),
          Line(points={{-80,0},{-41,69},{26,69},{58,0}})}));
          
end Path;
