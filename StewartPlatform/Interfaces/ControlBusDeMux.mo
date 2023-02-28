within StewartPlatform.Interfaces;

model ControlBusDeMux
  extends StewartPlatform.Icons.ControlBusDeMux; // Icon

  ControlBus controlBus annotation(Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angularPos[6] annotation(Placement(visible = true, transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angularVel[6] annotation(Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angularAcc[6] annotation(Placement(visible = true, transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput refTorque[6] annotation(Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput appliedTorque[6] annotation(Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(controlBus.axisControlBus1.angularPos, angularPos[1]);
  connect(controlBus.axisControlBus2.angularPos, angularPos[2]);
  connect(controlBus.axisControlBus3.angularPos, angularPos[3]);
  connect(controlBus.axisControlBus4.angularPos, angularPos[4]);
  connect(controlBus.axisControlBus5.angularPos, angularPos[5]);
  connect(controlBus.axisControlBus6.angularPos, angularPos[6]);

  connect(controlBus.axisControlBus1.angularVel, angularVel[1]);
  connect(controlBus.axisControlBus2.angularVel, angularVel[2]);
  connect(controlBus.axisControlBus3.angularVel, angularVel[3]);
  connect(controlBus.axisControlBus4.angularVel, angularVel[4]);
  connect(controlBus.axisControlBus5.angularVel, angularVel[5]);
  connect(controlBus.axisControlBus6.angularVel, angularVel[6]);

  connect(controlBus.axisControlBus1.angularAcc, angularAcc[1]);
  connect(controlBus.axisControlBus2.angularAcc, angularAcc[2]);
  connect(controlBus.axisControlBus3.angularAcc, angularAcc[3]);
  connect(controlBus.axisControlBus4.angularAcc, angularAcc[4]);
  connect(controlBus.axisControlBus5.angularAcc, angularAcc[5]);
  connect(controlBus.axisControlBus6.angularAcc, angularAcc[6]);

  connect(controlBus.axisControlBus1.refTorque, refTorque[1]);
  connect(controlBus.axisControlBus2.refTorque, refTorque[2]);
  connect(controlBus.axisControlBus3.refTorque, refTorque[3]);
  connect(controlBus.axisControlBus4.refTorque, refTorque[4]);
  connect(controlBus.axisControlBus5.refTorque, refTorque[5]);
  connect(controlBus.axisControlBus6.refTorque, refTorque[6]);

  connect(controlBus.axisControlBus1.appliedTorque, appliedTorque[1]);
  connect(controlBus.axisControlBus2.appliedTorque, appliedTorque[2]);
  connect(controlBus.axisControlBus3.appliedTorque, appliedTorque[3]);
  connect(controlBus.axisControlBus4.appliedTorque, appliedTorque[4]);
  connect(controlBus.axisControlBus5.appliedTorque, appliedTorque[5]);
  connect(controlBus.axisControlBus6.appliedTorque, appliedTorque[6]);

end ControlBusDeMux;
