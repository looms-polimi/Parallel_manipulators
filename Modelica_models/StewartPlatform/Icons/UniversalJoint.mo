within StewartPlatform.Icons;

model UniversalJoint "Icon for 'UniversalJoint' model"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,15},{-65,-15}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={235,235,235}),
          Ellipse(
            extent={{-80,-80},{80,80}},
            lineColor={160,160,164},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-60,-60},{60,60}},
            lineColor={160,160,164},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,-80},{150,-120}},
            textString="%name",
            lineColor={0,0,255}),
          Rectangle(
            extent={{12,82},{80,-82}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{56,15},{100,-15}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={235,235,235}),
          Line(
            points={{12,78},{12,-78}},
            thickness=0.5),
          Ellipse(
            extent={{-52,-40},{80,40}},
            lineColor={160,160,164},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-32,-20},{60,26}},
            lineColor={160,160,164},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-22,-54},{-60,0},{-22,50},{40,52},{-22,-54}},
            pattern=LinePattern.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Line(
            points={{12,78},{12,-20}},
            thickness=0.5),
          Line(
            points={{32,38},{-12,-36}},
            thickness=0.5),                          Text(
            extent={{-136,-25},{-100,-50}},
            lineColor={128,128,128},
            textString="a"), Text(
            extent={{100,-25},{136,-50}},
            lineColor={128,128,128},
            textString="b"),
          Line(
            points={{-94,22},{-92,42},{-86,62},{-76,46},{-74,18},{-74,-40},{-78,-58},{-84,-60},{-90,-52},{-92,-40}},
            color={255,0,0},
            smooth=Smooth.Bezier),
          Polygon(
            points={{-100,-40},{-100,-40}},
            lineColor={255,0,0},
            smooth=Smooth.Bezier,
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,-40},{-84,-40},{-92,-18},{-100,-40}},
            lineColor={255,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid)}));
          
end UniversalJoint;
