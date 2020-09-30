within DeltaRobot.Icons;

model Parallelogram "Icon for 'Parallelogram' model"
equation
    annotation (Icon(graphics={
          Rectangle(
            extent={{-40,98},{40,84}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-58,86},{-44,-82}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Ellipse(
            extent={{-64,102},{-36,74}},
            lineColor={0,0,0},
            fillColor={238,46,47},
            fillPattern=FillPattern.Sphere),
          Rectangle(
            extent={{-40,-82},{46,-96}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{44,84},{58,-84}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Ellipse(
            extent={{36,102},{64,74}},
            lineColor={0,0,0},
            fillColor={238,46,47},
            fillPattern=FillPattern.Sphere),
          Ellipse(
            extent={{-64,-74},{-36,-102}},
            lineColor={0,0,0},
            fillColor={238,46,47},
            fillPattern=FillPattern.Sphere),
          Ellipse(
            extent={{36,-74},{64,-102}},
            lineColor={0,0,0},
            fillColor={238,46,47},
            fillPattern=FillPattern.Sphere)
        }));
end Parallelogram;
