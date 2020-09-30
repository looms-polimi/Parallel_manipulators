within DeltaRobot;
package Interfaces
  extends Modelica.Icons.InterfacesPackage;

  expandable connector AxisControlBus "Data bus for one axis"
    extends Modelica.Icons.SignalSubBus;

    SI.Angle encoder "Shaft absolute angle";
    SI.Torque refTorque "Reference value for the torque";

    annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
      __Dymola_LockedEditing="CopiatoDaSP");
  end AxisControlBus;

  expandable connector Pose "Position of a rigid object"

    SI.Position position[3] "Position";

    SI.Time startTime "Start of the time interval where the pose is valid";
    SI.Time stopTime "End of the time interval where the pose is valid";

    annotation (
    defaultComponentName="pose",
    Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          initialScale=0.3),
          graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-28,62},{-12,-18}},
            lineColor={0,0,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-50,60},{10,60},{-20,100},{-50,60}},
            lineColor={0,0,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-20,-8},{60,-28}},
            lineColor={0,0,0},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{60,10},{60,-50},{100,-18},{60,10}},
            lineColor={0,0,0},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-22,-8},{-8,-22},{-56,-74},{-72,-56},{-22,-8}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-88,-40},{-38,-90},{-100,-100},{-88,-40}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          initialScale=0.3),
          graphics={
          Rectangle(
            extent={{-40,40},{40,-40}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-12,28},{-4,-12}},
            lineColor={0,0,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-18,22},{2,22},{-8,40},{-18,22}},
            lineColor={0,0,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-8,-8},{32,-16}},
            lineColor={0,0,0},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{24,-2},{24,-22},{40,-12},{24,-2}},
            lineColor={0,0,0},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-8,-6},{-2,-12},{-20,-28},{-26,-22},{-8,-6}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-32,-16},{-14,-34},{-40,-40},{-32,-16}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-46,-76},{46,-58}},
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            textString="%name")}),
      __Dymola_LockedEditing="CopiatoDaSP");

  end Pose;

  model PoseDeMux "Decompose the variables of a pose connector"
    Pose pose annotation (Placement(transformation(extent={{-130,-30},{-70,30}})));
    Modelica.Blocks.Interfaces.RealOutput startTime annotation (Placement(transformation(extent={{100,50},{120,70}})));
    Modelica.Blocks.Interfaces.RealOutput stopTime annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
    Modelica.Blocks.Interfaces.RealOutput position[3] annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  equation
    connect(pose.position, position)
      annotation (Line(points={{-99.85,0.15},{8,0.15},{8,0},{110,0}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(pose.startTime, startTime)
      annotation (Line(points={{-99.85,0.15},{-99.85,60},{110,60}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(pose.stopTime, stopTime)
      annotation (Line(points={{-99.85,0.15},{-99.85,-60},{110,-60}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=true), graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Line(points={{-92,0},{2,0}}, color={135,135,135}),
          Line(points={{98,60},{60,60},{4,6}},    color={0,127,0}),
          Line(points={{98,-60},{60,-60},{4,-4}},    color={255,0,0}),
          Line(points={{8,0},{102,0}}, color={0,0,127}),
          Ellipse(
            extent={{-14,16},{16,-14}},
            fillColor={0,0,255},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),         Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),                                 Diagram(coordinateSystem(preserveAspectRatio=true)),
      __Dymola_LockedEditing="Testato");
  end PoseDeMux;

  expandable connector ControlBus "Data bus for all axes"
    extends Modelica.Icons.SignalBus;

    DeltaRobot.Interfaces.AxisControlBus axisControlBus1 "Bus of axis 1";
    DeltaRobot.Interfaces.AxisControlBus axisControlBus2 "Bus of axis 2";
    DeltaRobot.Interfaces.AxisControlBus axisControlBus3 "Bus of axis 3";

    annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
      __Dymola_LockedEditing="CopiatoDaSP");
  end ControlBus;

  model RefToBus "Map input reference signals to bus signals"
    Modelica.Blocks.Interfaces.RealInput torqueRef "Reference value for the torque" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    AxisControlBus axisControlBus annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=90,
          origin={100,0}), iconTransformation(
          extent={{-24,24},{24,-24}},
          rotation=90,
          origin={100,4})));
  equation
    connect(torqueRef, axisControlBus.refTorque)
      annotation (Line(points={{-120,0},{-10,0},{-10,0.05},{100.05,0.05}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255}),
          Text(
            extent={{-100,20},{16,-16}},
            lineColor={0,0,0},
            textString="torque")}),                                Diagram(coordinateSystem(preserveAspectRatio=false)),
      __Dymola_LockedEditing="CopiatoDaSP");
  end RefToBus;
end Interfaces;
