within StewartPlatform;

package Interfaces "Library of connectors and utility models for input/output blocks"
  extends Modelica.Icons.InterfacesPackage;

  connector PositionInput = input SI.Position "'coordinate of a point' as input signal"
  annotation (
    defaultComponentName="positionIn",
    Icon(graphics={
      Polygon(
        lineColor={0,127,0},
        fillColor={0,127,0},
        fillPattern=FillPattern.Solid,
        points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})},
      coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.2)),
    Diagram(
      coordinateSystem(preserveAspectRatio=true,
        initialScale=0.2,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,127,0},
        fillColor={0,127,0},
        fillPattern=FillPattern.Solid,
        points={{0.0,50.0},{100.0,0.0},{0.0,-50.0},{0.0,50.0}}),
      Text(
        lineColor={0,127,0},
        extent={{-10.0,60.0},{-10.0,85.0}},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one input signal of type Position; it should represent a coordinate of a point.
</p>
</html>"));

  connector OrientationInput = input SI.Angle "'orientation angle' as input signal"
  annotation (
    defaultComponentName="orientationIn",
    Icon(graphics={
      Polygon(
        lineColor={255,0,0},
        fillColor={255,0,0},
        fillPattern=FillPattern.Solid,
        points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})},
      coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        initialScale=0.2)),
    Diagram(
      coordinateSystem(preserveAspectRatio=true,
        initialScale=0.2,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={255,0,0},
        fillColor={255,0,0},
        fillPattern=FillPattern.Solid,
        points={{0.0,50.0},{100.0,0.0},{0.0,-50.0},{0.0,50.0}}),
      Text(
        lineColor={0,127,0},
        extent={{-10.0,60.0},{-10.0,85.0}},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one input signal of type Angle; it should represent an orientation.
</p>
</html>"));

  connector PositionOutput = output SI.Position "'coordinate of a point' as output signal"
  annotation (
    defaultComponentName="positionOut",
    Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,0},
        fillColor={0,231,0},
        lineThickness=0.5,
        fillPattern=FillPattern.Solid,
        points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})}),
    Diagram(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,0},
        fillColor={0,231,0},
        lineThickness=0.5,
        fillPattern=FillPattern.Solid,
        points={{-100.0,50.0},{0.0,0.0},{-100.0,-50.0}}),
      Text(
        lineColor={0,231,0},
        extent={{30.0,60.0},{30.0,110.0}},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one output signal of type Position; it should represent a coordinate of a point.
</p>
</html>"));

  connector OrientationOutput = output SI.Angle "'orientation angle' as output signal"
  annotation (
    defaultComponentName="orientationOut",
    Icon(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,0},
        fillColor={255,128,0},
        lineThickness=0.5,
        fillPattern=FillPattern.Solid,
        points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})}),
    Diagram(
      coordinateSystem(preserveAspectRatio=true,
        extent={{-100.0,-100.0},{100.0,100.0}}),
        graphics={
      Polygon(
        lineColor={0,0,0},
        fillColor={255,128,0},
        lineThickness=0.5,
        fillPattern=FillPattern.Solid,
        points={{-100.0,50.0},{0.0,0.0},{-100.0,-50.0}}),
      Text(
        lineColor={0,231,0},
        extent={{30.0,60.0},{30.0,110.0}},
        textString="%name")}),
    Documentation(info="<html>
<p>
Connector with one output signal of type Angle; it should represent an orientation.
</p>
</html>"));

  expandable connector Pose "Position plus orientation of a rigid object"

    SI.Position position[3] "Position";
    Modelica.Mechanics.MultiBody.Types.RotationSequence sequence(min={1,1,1},max={3,3,3}) "Sequence of rotation axes";
    SI.Angle orientation[3] "Rotation angles around axes defined in 'sequence'";

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
            textString="%name")}));

  end Pose;

  model PoseMux "Join togehter a position and an orientation inputs in a pose connector"

// Parameters
      parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence(min={1,1,1},max={3,3,3})={1,2,3} "Sequence of rotation axes";

    PositionInput positionIn[3] "Coordinates of a point" annotation (Placement(transformation(extent={{-140,40},{-100,80}}),iconTransformation(extent={{-140,40},{-100,80}})));
    OrientationInput orientationIn[3] "Rotation angles around a sequence of rotation axes" annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),iconTransformation(
            extent={{-140,-80},{-100,-40}})));
    Pose pose annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

    Modelica.Blocks.Sources.IntegerConstant sequenceSource[3](k=sequence) annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  equation
    connect(positionIn, pose.position)
      annotation (Line(points={{-120,60},{90.15,60},{90.15,0.15}},color={0,127,0}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    connect(orientationIn, pose.orientation)
      annotation (Line(points={{-120,-60},{90.15,-60},{90.15,0.15}},color={255,0,0}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));

    connect(sequenceSource.y, pose.sequence)
      annotation (Line(points={{53,0},{72,0},{72,0.15},{90.15,0.15}}, color={255,127,0}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
     annotation (Icon(coordinateSystem(preserveAspectRatio=true), graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Line(points={{-98,60},{-60,60},{-4,6}}, color={0,127,0}),
          Line(points={{-98,-60},{-60,-60},{-4,-4}}, color={255,0,0}),
          Line(points={{8,0},{102,0}}, color={135,135,135}),
          Ellipse(
            extent={{-14,16},{16,-14}},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,127}),         Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255})}),                                   Diagram(coordinateSystem(preserveAspectRatio=true)));
  end PoseMux;

  model PoseDeMux "Decompose the variables of a pose connector"

    PositionOutput positionOut[3] "Coordinates of a point" annotation (Placement(transformation(extent={{100,50},{120,70}}), iconTransformation(extent={{100,50},{120,70}})));
    OrientationOutput orientationOut[3] "Rotation angles around the axes defined in 'sequence'" annotation (Placement(transformation(extent={{100,-70},{120,-50}}),
          iconTransformation(extent={{100,-70},{120,-50}})));
    Modelica.Blocks.Interfaces.IntegerOutput sequenceOut[3] "Sequence of rotation axes" annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={
              {100,-10},{120,10}})));
    Pose pose annotation (Placement(transformation(extent={{-120,-30},{-60,30}}), iconTransformation(extent={{-120,-30},{-60,30}})));

  equation
    connect(pose.position, positionOut)
      annotation (Line(points={{-89.85,0.15},{-92,0.15},{-92,60},{110,60}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(pose.sequence, sequenceOut)
      annotation (Line(points={{-89.85,0.15},{8,0.15},{8,0},{110,0}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(pose.orientation, orientationOut)
      annotation (Line(points={{-89.85,0.15},{-92,0.15},{-92,-60},{110,-60}}, color={0,0,0}), Text(
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
          lineColor={0,0,255})}),                                 Diagram(coordinateSystem(preserveAspectRatio=true)));
  end PoseDeMux;

  expandable connector AxisControlBus "Data bus for one axis"
    extends Modelica.Icons.SignalSubBus;

    SI.Angle encoder "Shaft absolute angle";
    SI.Torque refTorque "Reference value for the torque";

    annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)));
  end AxisControlBus;

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
            textString="torque")}),                                Diagram(coordinateSystem(preserveAspectRatio=false)));
  end RefToBus;

  expandable connector ControlBus "Data bus for all axes"
    extends Modelica.Icons.SignalBus;

    StewartPlatform.Interfaces.AxisControlBus axisControlBus1 "Bus of axis 1";
    StewartPlatform.Interfaces.AxisControlBus axisControlBus2 "Bus of axis 2";
    StewartPlatform.Interfaces.AxisControlBus axisControlBus3 "Bus of axis 3";
    StewartPlatform.Interfaces.AxisControlBus axisControlBus4 "Bus of axis 4";
    StewartPlatform.Interfaces.AxisControlBus axisControlBus5 "Bus of axis 5";
    StewartPlatform.Interfaces.AxisControlBus axisControlBus6 "Bus of axis 6";

    annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)));
  end ControlBus;
end Interfaces;
