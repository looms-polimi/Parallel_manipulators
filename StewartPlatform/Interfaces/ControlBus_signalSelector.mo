within StewartPlatform.Interfaces;

model ControlBus_signalSelector "Connects or cuts the signals along the axis control bus"
  extends StewartPlatform.Icons.ControlBus_signalSelector;   // Icon
  // Parameters
  parameter Boolean connect_angularPos = true annotation (choices(checkBox=true));
  parameter Boolean connect_angularVel = true annotation (choices(checkBox=true));
  parameter Boolean connect_angularAcc = true annotation (choices(checkBox=true));
  parameter Boolean connect_refTorque = true annotation (choices(checkBox=true));
  parameter Boolean connect_appliedTorque = true annotation (choices(checkBox=true));

// Models
  StewartPlatform.Interfaces.ControlBus controlBus_in annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-96, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Interfaces.ControlBus controlBus_out annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus_signalSelector axisControlBus_signalSelector1(connect_angularPos = connect_angularPos, connect_angularVel = connect_angularVel, connect_angularAcc = connect_angularAcc, connect_refTorque = connect_refTorque, connect_appliedTorque = connect_appliedTorque)
    annotation(Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus_signalSelector axisControlBus_signalSelector2(connect_angularPos = connect_angularPos, connect_angularVel = connect_angularVel, connect_angularAcc = connect_angularAcc, connect_refTorque = connect_refTorque, connect_appliedTorque = connect_appliedTorque)
    annotation(Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus_signalSelector axisControlBus_signalSelector3(connect_angularPos = connect_angularPos, connect_angularVel = connect_angularVel, connect_angularAcc = connect_angularAcc, connect_refTorque = connect_refTorque, connect_appliedTorque = connect_appliedTorque)
    annotation(Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus_signalSelector axisControlBus_signalSelector4(connect_angularPos = connect_angularPos, connect_angularVel = connect_angularVel, connect_angularAcc = connect_angularAcc, connect_refTorque = connect_refTorque, connect_appliedTorque = connect_appliedTorque)
    annotation(Placement(visible = true, transformation(origin = {0, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus_signalSelector axisControlBus_signalSelector5(connect_angularPos = connect_angularPos, connect_angularVel = connect_angularVel, connect_angularAcc = connect_angularAcc, connect_refTorque = connect_refTorque, connect_appliedTorque = connect_appliedTorque)
    annotation(Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus_signalSelector axisControlBus_signalSelector6(connect_angularPos = connect_angularPos, connect_angularVel = connect_angularVel, connect_angularAcc = connect_angularAcc, connect_refTorque = connect_refTorque, connect_appliedTorque = connect_appliedTorque)
    annotation(Placement(visible = true, transformation(origin = {0, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(controlBus_in.axisControlBus1, axisControlBus_signalSelector1.axisControlBus_in);
  connect(controlBus_in.axisControlBus2, axisControlBus_signalSelector2.axisControlBus_in);
  connect(controlBus_in.axisControlBus3, axisControlBus_signalSelector3.axisControlBus_in);
  connect(controlBus_in.axisControlBus4, axisControlBus_signalSelector4.axisControlBus_in);
  connect(controlBus_in.axisControlBus5, axisControlBus_signalSelector5.axisControlBus_in);
  connect(controlBus_in.axisControlBus6, axisControlBus_signalSelector6.axisControlBus_in);

  connect(controlBus_out.axisControlBus1, axisControlBus_signalSelector1.axisControlBus_out);
  connect(controlBus_out.axisControlBus2, axisControlBus_signalSelector2.axisControlBus_out);
  connect(controlBus_out.axisControlBus3, axisControlBus_signalSelector3.axisControlBus_out);
  connect(controlBus_out.axisControlBus4, axisControlBus_signalSelector4.axisControlBus_out);
  connect(controlBus_out.axisControlBus5, axisControlBus_signalSelector5.axisControlBus_out);
  connect(controlBus_out.axisControlBus6, axisControlBus_signalSelector6.axisControlBus_out);

end ControlBus_signalSelector;
