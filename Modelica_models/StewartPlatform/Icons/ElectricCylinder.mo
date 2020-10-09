within StewartPlatform.Icons;

model ElectricCylinder "Icon for 'ElectricCylinder' model"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,40},{50,-40}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{50,20},{100,-20}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-80,10},{20,-10}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-80,-10},{-60,10}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-60,-10},{-40,10}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-40,-10},{-20,10}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-20,-10},{0,10}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{0,-10},{20,10}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-100,40},{-80,-40}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,90},{-80,40}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
      Text(lineColor={0,0,255},
        extent={{-154,-115},{146,-75}},
        textString="%name")}));
              
end ElectricCylinder;
