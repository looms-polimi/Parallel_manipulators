within StewartPlatform.Icons;

model InverseKinematic "Icon for 'InverseKinematic' model"
    annotation (Icon(graphics={   Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-80,-44},{80,-100}},
            lineColor={0,0,0},
            fillColor={0,128,255},
            fillPattern=FillPattern.VerticalCylinder),
          Rectangle(
            extent={{-80,-72},{80,-52}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={0,128,255}),
          Ellipse(
            extent={{-80,-22},{80,-82}},
            lineColor={0,0,0},
            fillColor={0,0,188},
            fillPattern=FillPattern.Sphere),
          Ellipse(
            extent={{-60,80},{60,30}},
            lineColor={0,0,0},
            fillColor={0,128,255},
            fillPattern=FillPattern.VerticalCylinder),
          Rectangle(
            extent={{-60,54},{60,74}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={0,128,255}),
          Ellipse(
            extent={{-60,100},{60,50}},
            lineColor={0,0,0},
            fillColor={0,0,188},
            fillPattern=FillPattern.Sphere),
          Ellipse(
            extent={{48,-42},{68,-62}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{48,-54},{60,-42},{12,6},{22,16},{-24,30},{-10,-16},{0,-6},{48,-54}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
      Text(lineColor={0,0,255},
        extent={{-150,101},{150,141}},
        textString="%name")}));
          
end InverseKinematic;
