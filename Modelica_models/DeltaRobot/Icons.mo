within DeltaRobot;
package Icons "Icons for DeltaRobot package"
  extends Modelica.Icons.IconsPackage;

  model ServoMotor "Icon for ServoMotor model"

  equation

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
          lineColor={0,0,255})}), __Dymola_LockedEditing="CopiatoDaSP");
  end ServoMotor;

  model GlobalParameters "Icon for GlobalParameters model"

    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-6,78},{-34,72},{-54,60},{-76,34},{-64,20},{-60,6},{-82,-12},{-58,-34},{-54,-58},{-26,-70},{-32,-50},{-8,-18},{-54,4},{-40,30},{-10,32},{-6,78}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid,
            smooth=Smooth.Bezier),
          Polygon(
            points={{50,12},{50,12},{50,4},{90,-2},{50,-74},{44,-22},{14,-14},{44,14},{46,14},{50,12}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid,
            smooth=Smooth.Bezier),
      Text(lineColor={0,0,255},
        extent={{-150,101},{150,141}},
        textString="%name"),
          Polygon(
            points={{78,6},{64,14},{46,28},{40,40},{46,50},{58,54},{70,40},{78,18},{78,6}},
            lineColor={0,0,0},
            smooth=Smooth.Bezier,
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid)}), __Dymola_LockedEditing="CopiatoDaSP");
  end GlobalParameters;

  model Switch2 "Icon for Switch2 model"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                           Rectangle(
            extent={{-100,100},{100,-100}},
            fillColor={210,210,210},
            lineThickness=5.0,
            fillPattern=FillPattern.Solid,
            borderPattern=BorderPattern.Raised),
          Ellipse(lineColor={0,0,255},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            extent={{2.0,-8.0},{18.0,8.0}}),
          Line(points={{12.0,0.0},{100.0,0.0}},
            color={0,0,127}),
          Line(points={{-100.0,80.0},{-38.0,80.0}},
            color={0,0,127}),
          Line(points={{-100,40},{-38,40}},
            color={0,0,127}),
          Line(points={{-100,0},{-38,0}},
            color={0,0,127}),
          Line(points={{-100,-40},{-38,-40}},
            color={0,0,127}),
          Line(points={{-100,-80},{-38,-80}},
            color={0,0,127}),
          Line(points={{-38.0,80.0},{6.0,2.0}},
            color={0,0,127},
            thickness=1.0),
      Text(extent={{-118,-78},{172,-34}},
            lineColor={0,0,0},
            textString="n=%n",
            textStyle={TextStyle.Bold}),         Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false)),
      __Dymola_LockedEditing="CopiatoDaSP");
  end Switch2;

  model LinearTrajectory "Icon for LinearTrajectory model"

    annotation (Icon(graphics={   Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-66,-38},{62,50}}),
          Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
                                          Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}), __Dymola_LockedEditing="CopiatoDaSP");
  end LinearTrajectory;

  model TrapezoidalTrajectory "Icon for TrapezoidalTrajectory model"

    annotation (Icon(graphics={   Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
          Line(points={{-80,-70},{-60,-70},{-20,40},{20,40},{60,-70},{68,-70}}, color={0,0,0}),
                                          Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}), __Dymola_LockedEditing="CopiatodaSP");
  end TrapezoidalTrajectory;

  model CubicTrajectory "Icon for CubicTrajectory model"

    annotation (Icon(graphics={   Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
          Line(
            points={{-60,-40},{-20,-40},{20,60},{60,60}},
            color={0,0,0},
            smooth=Smooth.Bezier),        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}), __Dymola_LockedEditing="CopiatoDaSP");
  end CubicTrajectory;

  model IdealActuator "Icon for IdealActuator model"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{40,20},{100,-20}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,20},{-40,-20}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-60,60},{60,-60}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-32,30},{32,-32}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-16,16},{16,-16}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{80,60},{80,40},{60,40},{80,60}},
            lineColor={238,46,47},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid),
          Polygon(points={{0,80},{0,80}}, lineColor={28,108,200}),
          Line(
            points={{70,50},{60,60},{40,70},{20,78},{0,80},{-20,76},{-40,70},{-60,60},{-70,50}},
            color={238,46,47},
            smooth=Smooth.Bezier),        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),                                  Diagram(coordinateSystem(preserveAspectRatio=false)));
  end IdealActuator;

  model Parallelogram "Icon for Parallelogram model"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
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
            fillPattern=FillPattern.Sphere)}),                     Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Parallelogram;

  model ThreeArms "Icon for all ThreeArms models"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Polygon(
            points={{-82,80},{-82,80}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Polygon(
            points={{-68,84},{-68,84}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Polygon(
            points={{-46,86},{-58,92},{-96,34},{-86,24},{-46,86}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Ellipse(
            extent={{-62,100},{-40,78}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Ellipse(
            extent={{0,100},{22,78}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Ellipse(
            extent={{40,100},{62,78}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Polygon(
            points={{-94,28},{-28,-92},{-20,-90},{-86,30},{-94,28}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Polygon(
            points={{4,90},{18,90},{36,16},{22,16},{4,90}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Polygon(
            points={{24,18},{34,18},{6,-88},{-4,-88},{24,18}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Polygon(
            points={{46,88},{58,94},{96,36},{86,26},{46,88}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Polygon(
            points={{94,28},{28,-92},{20,-90},{86,30},{94,28}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={135,135,135}),
          Ellipse(
            extent={{-100,40},{-80,20}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={238,46,47}),
          Ellipse(
            extent={{16,30},{38,8}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={238,46,47}),
          Ellipse(
            extent={{80,40},{100,20}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={238,46,47}),
          Ellipse(
            extent={{-34,-80},{-14,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={238,46,47}),
          Ellipse(
            extent={{-10,-80},{10,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={238,46,47}),
          Ellipse(
            extent={{14,-80},{34,-100}},
            lineColor={0,0,0},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={238,46,47})}),                              Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ThreeArms;

  model Disc "Icon for Disc model"
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
            fillColor={255,0,0})}));
  end Disc;

  model InverseKinematic "Icon for InverseKinematic model"

    annotation (Icon(graphics={   Rectangle(
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
      Text(lineColor={0,0,255},
        extent={{-150,101},{150,141}},
        textString="%name")}));
  end InverseKinematic;

  model Actuator "Icon for Actuator model"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{-8,60},{34,20}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{60,20},{100,-20}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,20},{-2,-20}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-10,40},{70,-40}},
            lineColor={0,0,0},
            fillColor={135,135,135},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{0,30},{60,-30}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{14,16},{46,-16}},
            lineColor={0,0,0},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Polygon(points={{0,80},{0,80}}, lineColor={28,108,200}),
          Rectangle(
            extent={{-100,80},{-80,20}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-80,74},{-8,20}},
            lineColor={0,0,0},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-68,64},{-22,58}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-68,60},{-20,54}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-68,50},{-22,44}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-68,36},{-22,30}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.HorizontalCylinder),
          Rectangle(
            extent={{-68,46},{-20,40}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-68,32},{-20,26}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-20,-40},{0,-58},{30,-64},{62,-58},{78,-40}},
            color={238,46,47},
            smooth=Smooth.Bezier),
          Polygon(
            points={{-26,-30},{-20,-54},{-4,-40},{-26,-30}},
            lineColor={238,46,47},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid),
                                          Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),                                  Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Actuator;

  model Command "Icon for '*Command' models"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
      Line(points={{-80.0,68.0},{-80.0,-80.0}},
        color={192,192,192}),
      Line(points={{-90.0,-70.0},{82.0,-70.0}},
        color={192,192,192}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
      Rectangle(lineColor={255,255,255},
        fillColor={255,215,136},
        fillPattern=FillPattern.Solid,
        extent={{-48.0,-50.0},{2.0,70.0}}),
      Line(points={{-48.0,-50.0},{-48.0,70.0},{52.0,70.0},{52.0,-50.0},{-48.0,-50.0},{-48.0,-20.0},{52.0,-20.0},{52.0,10.0},{-48.0,10.0},{-48.0,40.0},{52.0,40.0},{52.0,70.0},{2.0,70.0},{2.0,-51.0}}),
                                          Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),                                  Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Command;

  model PickAndPlace "Icon for PickAndPlace models"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{-80.0,90.0},{-88.0,68.0},{-72.0,68.0},{-80.0,90.0}}),
      Line(points={{-80.0,68.0},{-80.0,-80.0}},
        color={192,192,192}),
      Polygon(lineColor={192,192,192},
        fillColor={192,192,192},
        fillPattern=FillPattern.Solid,
        points={{90.0,-70.0},{68.0,-62.0},{68.0,-78.0},{90.0,-70.0}}),
      Line(points={{-90.0,-70.0},{82.0,-70.0}},
        color={192,192,192}),
          Line(
            points={{-30,40}},
            color={0,0,0},
            smooth=Smooth.Bezier),
          Line(
            points={{-66,-20},{-66,40},{-6,40}},
            color={0,0,0},
            smooth=Smooth.Bezier),
          Line(
            points={{54,-20},{54,40},{-6,40}},
            color={0,0,0},
            smooth=Smooth.Bezier),        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),                                  Diagram(coordinateSystem(preserveAspectRatio=false)));
  end PickAndPlace;

  model Junction "Icon for Jonction model"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Polygon(
            points={{-40,90},{-48,68},{-32,68},{-40,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-40,68},{-40,-80}}, color={192,192,192}),
          Line(points={{-60,-70},{82,-70}}, color={192,192,192}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(
            points={{0,-40},{0,60},{80,60}},
            color={0,0,0},
            smooth=Smooth.Bezier),
          Line(
            points={{0,80},{0,12}},
            color={0,0,0},
            smooth=Smooth.Bezier,
            pattern=LinePattern.Dash),
          Line(
            points={{-20,60},{12,60},{40,60}},
            color={0,0,0},
            pattern=LinePattern.Dash,
            smooth=Smooth.Bezier),        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),    Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Junction;

  model Controller "Icon for '*Controller' models"
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{-100,-100},{100,100}},
            lineColor={0,0,0},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-10,54},{50,24}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{-10,40},{-40,50},{-40,30},{-10,40}},
            lineColor={0,0,255},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-10,-40},{-46,-40},{-46,40},{-10,40}}, color={0,0,255}),
          Rectangle(
            extent={{-10,-24},{50,-54}},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{80,-30},{50,-40},{80,-50},{80,-30}},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Line(points={{50,-40},{86,-40},{86,40},{50,40}},     color={0,0,255}),
                                          Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false)),
      __Dymola_LockedEditing="CopiatoDaSP");
  end Controller;
end Icons;
