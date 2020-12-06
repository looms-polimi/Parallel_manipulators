within StewartPlatform.Icons;

model IdealLeg "Icon for 'IdealLeg' model"
    annotation (Icon(graphics={
          Ellipse(
            extent={{-122,14},{-106,-8}},
            lineColor={0,0,0},
            fillColor={0,128,255},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-134,20},{-114,-20}},
            lineColor={0,0,0},
            fillColor={0,128,255},
            fillPattern=FillPattern.VerticalCylinder),
          Ellipse(
            extent={{-134,26},{-114,14}},
            lineColor={0,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Sphere),
          Line(points={{-56,-2}}, color={255,0,0}),
          Ellipse(
            extent={{-132,10},{-116,-12}},
            lineColor={0,0,0},
            fillColor={0,128,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-138,6},{-124,10},{-124,-12},{-136,-16},{-138,6}},
            lineColor={0,0,0},
            fillColor={0,128,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-144,6},{-128,-16}},
            lineColor={0,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Sphere),
          Ellipse(
            extent={{-134,-14},{-114,-26}},
            lineColor={0,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Sphere),
          Line(points={{-124,10},{-124,-12}},
                                            color={0,128,255}),
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
            extent={{50,20},{100,-20}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={215,215,215},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-100,40},{50,-40}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={135,135,135},
            fillPattern=FillPattern.Sphere),
          Polygon(
            points={{-80,80},{-80,60},{-100,70},{-80,80}},
            lineColor={255,0,0},
            lineThickness=0.5,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-114,0},{-100,0}},
            color={0,0,0},
            thickness=0.5),
      Text(lineColor={0,0,255},
        extent={{-150,-91},{150,-51}},
        textString="%name"),
          Rectangle(
            extent={{-100,40},{50,44}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{50,20},{100,24}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{90,20},{130,-20}},
            lineColor={0,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Sphere)}));
              
end IdealLeg;