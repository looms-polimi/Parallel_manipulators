within DeltaRobot.Icons;

model Disc "Icon for 'Disc' model"
equation
    annotation (Icon(graphics={
          Ellipse(
            extent={{-100,22},{100,-38}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.VerticalCylinder),
          Rectangle(
            extent={{-100,-10},{100,10}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={175,175,175}),
          Ellipse(
            extent={{-100,38},{100,-22}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Sphere),
          Ellipse(
            extent={{-12,2},{12,-22}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={255,0,0}),
          Ellipse(
            extent={{-60,38},{-36,14}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={255,0,0}),
          Ellipse(
            extent={{36,38},{60,14}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Sphere,
            fillColor={255,0,0})
        }));
end Disc;
