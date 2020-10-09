within StewartPlatform.Icons;

model SpindleDrive "Icon for 'SpindleDrive' model"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-80,20},{80,-20}},
            lineColor={28,108,200},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-20,28},{20,-28}},
            lineColor={28,108,200},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-80,0},{-60,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{-80,-20},{-40,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{-60,-20},{-20,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{-40,-20},{-20,0}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{20,-20},{60,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{20,0},{40,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{40,-20},{80,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{60,-20},{80,0}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{0,40},{40,40}},
            color={255,0,0},
            thickness=0.5),
      Text(lineColor={0,0,255},
        extent={{-150.0,85.0},{150.0,125.0}},
        textString="%name"),
          Polygon(
            points={{40,50},{40,30},{60,40},{40,50}},
            lineColor={255,0,0},
            lineThickness=0.5,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid)}));
          
end SpindleDrive;
