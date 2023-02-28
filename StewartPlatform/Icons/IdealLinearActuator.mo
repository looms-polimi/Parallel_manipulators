within StewartPlatform.Icons;

model IdealLinearActuator "Icon for 'IdealLinearActuator' model"
    annotation (Icon( graphics={
          Line(
            points={{-80,70},{80,70}},
            color={255,0,0},
            thickness=0.5),
          Polygon(
            points={{80,80},{80,60},{100,70},{80,80}},
            lineColor={255,0,0},
            lineThickness=0.5,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
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
          Polygon(
            points={{-80,80},{-80,60},{-100,70},{-80,80}},
            lineColor={255,0,0},
            lineThickness=0.5,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
      Text(lineColor={0,0,255},
        extent={{-150,-115},{150,-75}},
        textString="%name")}));    
          
end IdealLinearActuator;
