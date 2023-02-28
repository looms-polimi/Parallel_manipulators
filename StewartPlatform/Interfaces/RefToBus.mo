within StewartPlatform.Interfaces;

model RefToBus "Map the input reference signals to bus signals"
    extends StewartPlatform.Icons.RefToBus; // Icon

    // Models
    Modelica.Blocks.Interfaces.RealInput torqueRef "Reference value for the torque" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    AxisControlBus axisControlBus
        annotation (Placement(transformation(
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

end RefToBus;
