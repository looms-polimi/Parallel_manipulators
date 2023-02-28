within StewartPlatform.Tests;

model AxisControlBus_signalSelector_test
  StewartPlatform.Interfaces.AxisControlBus axisControlBus_in annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-66, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus axisControlBus_out2 annotation(
    Placement(visible = true, transformation(origin = {62, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {54, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus_signalSelector axisControlBus_signalSelector(connect_angularAcc = true, connect_angularPos = true, connect_angularVel = true, connect_appliedTorque = false, connect_refTorque = false)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant refTorque_src(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angularPos_y annotation(
    Placement(visible = true, transformation(origin = {110, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angularVel_y annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus axisControlBus_out1 annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-6, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angularAcc_y annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant appliedTorque_src2(k = 6) annotation(
    Placement(visible = true, transformation(origin = {110, -62}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput angularPos_y2 annotation(
    Placement(visible = true, transformation(origin = {-130, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {110, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput refTorque_y annotation(
    Placement(visible = true, transformation(origin = {50, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant angularPos_src(k = 2) annotation(
    Placement(visible = true, transformation(origin = {50, 118}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant angularVel_src(k = 3) annotation(
    Placement(visible = true, transformation(origin = {50, 86}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant angularAcc_src(k = 4) annotation(
    Placement(visible = true, transformation(origin = {50, 54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant appliedTorque_src1(k = 5) annotation(
    Placement(visible = true, transformation(origin = {22, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(axisControlBus_in, axisControlBus_signalSelector.axisControlBus_in) annotation(
    Line(points = {{-60, 0}, {-12, 0}, {-12, 0}, {-10, 0}}, thickness = 0.5));
  connect(axisControlBus_out2, axisControlBus_signalSelector.axisControlBus_out) annotation(
    Line(points = {{62, 0}, {12, 0}, {12, 0}, {10, 0}}, thickness = 0.5));
  connect(angularPos_y, axisControlBus_out2.angularPos) annotation(
    Line(points = {{110, 32}, {62, 32}, {62, 0}, {62, 0}}, color = {0, 0, 127}));
  connect(angularVel_y, axisControlBus_out2.angularVel) annotation(
    Line(points = {{110, 0}, {64, 0}, {64, 0}, {62, 0}}, color = {0, 0, 127}));
  connect(angularAcc_y, axisControlBus_out2.angularAcc) annotation(
    Line(points = {{110, -30}, {64, -30}, {64, 0}, {62, 0}}, color = {0, 0, 127}));
  connect(refTorque_src.y, axisControlBus_in.refTorque) annotation(
    Line(points = {{-118, 30}, {-60, 30}, {-60, 0}, {-60, 0}}, color = {0, 0, 127}));
  connect(angularPos_y2, axisControlBus_in.angularPos) annotation(
    Line(points = {{-130, -10}, {-60, -10}, {-60, 0}, {-60, 0}}, color = {0, 0, 127}));
  connect(axisControlBus_in, axisControlBus_out1) annotation(
    Line(points = {{-60, 0}, {-30, 0}, {-30, 60}, {0, 60}, {0, 60}}, thickness = 0.5));
  connect(refTorque_y, axisControlBus_out1.refTorque) annotation(
    Line(points = {{50, 140}, {0, 140}, {0, 60}}, color = {0, 0, 127}));
  connect(angularPos_src.y, axisControlBus_out1.angularPos) annotation(
    Line(points = {{40, 118}, {2, 118}, {2, 60}, {0, 60}}, color = {0, 0, 127}));
  connect(angularVel_src.y, axisControlBus_out1.angularVel) annotation(
    Line(points = {{40, 86}, {20, 86}, {20, 60}, {0, 60}, {0, 60}}, color = {0, 0, 127}));
  connect(angularAcc_src.y, axisControlBus_out1.angularAcc) annotation(
    Line(points = {{40, 54}, {0, 54}, {0, 60}, {0, 60}}, color = {0, 0, 127}));
  connect(appliedTorque_src1.y, axisControlBus_out1.appliedTorque) annotation(
    Line(points = {{12, 32}, {-2, 32}, {-2, 60}, {0, 60}}, color = {0, 0, 127}));
end AxisControlBus_signalSelector_test;
