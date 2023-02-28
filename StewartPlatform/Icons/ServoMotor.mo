within StewartPlatform.Icons;

model ServoMotor "Icon for 'ServoMotor' model"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-40,60},{80,-60}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={215,215,215}),
          Rectangle(
            extent={{-40,60},{-60,-60}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={128,128,128}),
          Rectangle(
            extent={{80,10},{100,-10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={95,95,95}),
          Polygon(
            points={{-50,-90},{-40,-90},{-10,-20},{40,-20},{70,-90},{80,-90},
                {80,-100},{-50,-100},{-50,-90}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-138,108},{162,68}},
            textString="%name",
            lineColor={0,0,255})
            }));
end ServoMotor;
