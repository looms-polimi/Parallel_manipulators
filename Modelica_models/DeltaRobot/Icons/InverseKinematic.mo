within DeltaRobot.Icons;

model InverseKinematic "Icon for 'InverseKinematic' model"
equation
    annotation (Icon(graphics={
        Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Polygon(
            points={{10,58},{2,50},{50,2},{42,-6},{76,-16},{66,18},{58,10},{10,58}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
        Ellipse(
            extent={{-100,76},{100,28}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.VerticalCylinder),
        Rectangle(
            extent={{-100,50},{100,70}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={175,175,175}),
        Ellipse(
            extent={{-100,100},{100,40}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Sphere),
        Ellipse(
            extent={{-40,-70},{40,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.VerticalCylinder),
        Rectangle(
            extent={{-40,-86},{40,-78}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={175,175,175}),
        Ellipse(
            extent={{-40,-64},{40,-94}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Sphere),
        Polygon(
            points={{68,-16},{76,-24},{28,-72},{36,-80},{2,-90},{12,-56},{20,-64},{68,-16}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
        Text(
            lineColor={0,0,255},
            extent={{-150,101},{150,141}},
            textString="%name")
        }));
end InverseKinematic;
