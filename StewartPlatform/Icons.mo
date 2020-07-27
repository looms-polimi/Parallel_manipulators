within StewartPlatform;

package Icons "Icons for StewartPlatform package"
  extends Modelica.Icons.IconsPackage;

  model Disc "Icon for Disc model"
    annotation (Icon(graphics = {Ellipse(fillColor = {0, 128, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, 20}, {100, -60}}, endAngle = 360), Rectangle(fillColor = {0, 128, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-100, -20}, {100, 20}}), Ellipse(fillColor = {0, 0, 188}, fillPattern = FillPattern.Sphere, extent = {{-100, 60}, {100, -20}}, endAngle = 360), Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Sphere, extent = {{8, 4}, {32, -20}}, endAngle = 360), Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Sphere, extent = {{54, 50}, {78, 26}}, endAngle = 360), Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Sphere, extent = {{-48, 58}, {-24, 34}}, endAngle = 360), Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Sphere, extent = {{-78, 50}, {-54, 26}}, endAngle = 360), Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Sphere, extent = {{-34, 4}, {-10, -20}}, endAngle = 360), Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Sphere, extent = {{24, 58}, {48, 34}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)), __Dymola_LockedEditing="1");
  end Disc;

  model SpindleDrive "Icon for SpindleDrive model"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-80,20},{80,-20}},
            lineColor={28,108,200},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-20,28},{20,-28}},
            lineColor={28,108,200},
            fillColor={255,255,0},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-80,0},{-60,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{-80,-20},{-40,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{-60,-20},{-20,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{-40,-20},{-20,0}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{20,-20},{60,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{20,0},{40,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{40,-20},{80,20}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{60,-20},{80,0}},
            color={95,95,95},
            thickness=0.5),
          Line(
            points={{0,40},{40,40}},
            color={255,0,0},
            thickness=0.5),
      Text(lineColor={0,0,255},
        extent={{-150.0,85.0},{150.0,125.0}},
        textString="%name"),
          Polygon(
            points={{40,50},{40,30},{60,40},{40,50}},
            lineColor={255,0,0},
            lineThickness=0.5,
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid)}));
  end SpindleDrive;

  model ElectricCylinder "Icon for ElectricCylinder model"
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

  model IdealLinearActuator "Icon for IdealLinearActuator model"
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

  model UniversalJoint "Icon for UniversalJojnt model"
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

  model Switch "Icon for Switch model"
    annotation (Icon(graphics={            Rectangle(
            extent={{-100,100},{100,-100}},
            fillColor={170,170,255},
            lineThickness=5,
            fillPattern=FillPattern.Solid,
            borderPattern=BorderPattern.Raised,
            lineColor={0,0,0}),
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
            lineColor={0,0,255})}));
  end Switch;

  model ServoMotor "Icon for ServoMotor model"
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
          lineColor={0,0,255})}));
  end ServoMotor;

  model IdealLeg "Icon for IdealLeg model"
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

  model SixLegs "Icon for SixLegs and IdealSixLegs models"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,-80},{-60,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-100,-60},{-60,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-90,-70},{-70,-90}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-40,-80},{40,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-20,-60},{20,-60},{0,-80},{-20,-60}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-40,-60},{0,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,-70},{-10,-90}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{0,-60},{40,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{10,-70},{30,-90}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-22,-56},{-26,-56},{-30,-56},{-34,-60},{-54,2},{-42,6},{-22,-56}},
            lineColor={0,0,0},
            fillColor={118,118,118},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-46,4},{-50,2},{-70,58},{-68,58},{-66,60},{-46,4}},
            lineColor={0,0,0},
            fillColor={200,200,200},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{60,-80},{100,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{60,-60},{100,-100}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{70,-70},{90,-90}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-100,100},{-60,80}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-100,100},{-60,60}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-90,90},{-70,70}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-40,100},{40,80}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-20,60},{20,60},{0,80},{-20,60}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-40,100},{0,60}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-30,90},{-10,70}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{0,100},{40,60}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{10,90},{30,70}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{60,100},{100,80}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{60,100},{100,60}},
            lineColor={0,0,0},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-90,2},{-72,-50}},
            lineColor={0,0,0},
            fillColor={118,118,118},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{70,90},{90,70}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-56,6},{-42,0},{-20,56},{-26,56},{-34,60},{-56,6}},
            lineColor={0,0,0},
            fillColor={200,200,200},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-94,-60},{-80,-54},{-70,-56},{-60,-64},{-32,-2},{-64,12},{-94,-60}},
            lineColor={0,0,0},
            fillColor={118,118,118},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-84,56},{-76,2}},
            lineColor={0,0,0},
            fillColor={200,200,200},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{22,-56},{26,-56},{30,-56},{34,-60},{54,2},{42,6},{22,-56}},
            lineColor={0,0,0},
            fillColor={118,118,118},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{46,4},{50,2},{70,58},{68,58},{66,60},{46,4}},
            lineColor={0,0,0},
            fillColor={200,200,200},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{56,6},{42,0},{20,56},{26,56},{34,60},{56,6}},
            lineColor={0,0,0},
            fillColor={200,200,200},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{70,2},{88,-50}},
            lineColor={0,0,0},
            fillColor={118,118,118},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{76,56},{84,2}},
            lineColor={0,0,0},
            fillColor={200,200,200},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{94,-60},{80,-54},{70,-56},{60,-64},{32,-2},{64,12},{94,-60}},
            lineColor={0,0,0},
            fillColor={118,118,118},
            fillPattern=FillPattern.Solid)}));
  end SixLegs;

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
          lineColor={0,0,255})}));
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
          lineColor={0,0,255})}));
  end TrapezoidalTrajectory;

  model InverseKinematic "Icon for InverseKinematic model"
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
          lineColor={0,0,255})}));
  end CubicTrajectory;

  model StepTrajectory "Icon for StepTrajectory model"
    annotation (Icon(graphics={   Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
          Polygon(
            points={{90,-70},{68,-62},{68,-78},{90,-70}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-70},{0,-70},{0,50},{80,50}}),
                                          Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}));
  end StepTrajectory;

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
            fillPattern=FillPattern.Solid)}));
  end GlobalParameters;

  model Switch2 "Icon for Switch2 model"
    annotation (Icon(graphics={
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
            lineColor={0,0,255})}));
  end Switch2;

  model Leg "Icon for Leg model"
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
        extent={{-150,-95},{150,-55}},
        textString="%name"),
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
            points={{-114,0},{-100,0}},
            color={0,0,0},
            thickness=0.5),
          Ellipse(
            extent={{90,20},{130,-20}},
            lineColor={0,0,0},
            fillColor={255,0,0},
            fillPattern=FillPattern.Sphere),
          Rectangle(
            extent={{-80,86},{0,40}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillPattern=FillPattern.Solid,
            fillColor={95,95,95})}));
  end Leg;

  model Controller "Icon for Controller model"
    annotation (Icon(graphics={
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
          lineColor={0,0,255})}));
  end Controller;

end Icons;
