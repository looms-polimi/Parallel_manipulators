within DeltaRobot.Tests;

model Package_Interfaces_test
  DeltaRobot.Interfaces.PoseDeMux poseDeMux annotation(
    Placement(visible = true, transformation(origin = {40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Interfaces.Pose poseIn annotation(
    Placement(visible = true, transformation(origin = {1, 91}, extent = {{-9, -9}, {9, 9}}, rotation = 0), iconTransformation(origin = {-84, 72}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant position[3](k = {1, 2, 3})  annotation(
    Placement(visible = true, transformation(origin = {-60, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant startTime(k = -1)  annotation(
    Placement(visible = true, transformation(origin = {-60, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant stopTime(k = -2)  annotation(
    Placement(visible = true, transformation(origin = {-60, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Interfaces.RefToBus refToBus3 annotation(
    Placement(visible = true, transformation(origin = {-90, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Interfaces.RefToBus refToBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Interfaces.RefToBus refToBus2 annotation(
    Placement(visible = true, transformation(origin = {-90, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant torque1(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-136, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant torque2(k = 20)  annotation(
    Placement(visible = true, transformation(origin = {-136, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant torque3(k = 30)  annotation(
    Placement(visible = true, transformation(origin = {-136, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Interfaces.ControlBus controlBus annotation(
    Placement(visible = true, transformation(origin = {-10, -52}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {6, -42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant encoder3(k = 33) annotation(
    Placement(visible = true, transformation(origin = {52, -76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant encoder1(k = 11) annotation(
    Placement(visible = true, transformation(origin = {52, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant encoder2(k = 22) annotation(
    Placement(visible = true, transformation(origin = {52, -42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(poseIn, poseDeMux.pose) annotation(
    Line(points = {{1, 91}, {27, 91}, {27, 89}, {29, 89}}, thickness = 0.5));
  connect(position.y, poseIn.position) annotation(
    Line(points = {{-49, 90}, {-1, 90}, {-1, 92}, {1, 92}}, color = {0, 0, 127}, thickness = 0.5));
  connect(startTime.y, poseIn.startTime) annotation(
    Line(points = {{-49, 58}, {3, 58}, {3, 92}, {1, 92}}, color = {0, 0, 127}));
  connect(stopTime.y, poseIn.stopTime) annotation(
    Line(points = {{-49, 26}, {-1, 26}, {-1, 92}, {1, 92}}, color = {0, 0, 127}));
  connect(torque1.y, refToBus1.torqueRef) annotation(
    Line(points = {{-124, -22}, {-104, -22}, {-104, -22}, {-102, -22}}, color = {0, 0, 127}));
  connect(torque2.y, refToBus2.torqueRef) annotation(
    Line(points = {{-124, -54}, {-102, -54}, {-102, -54}, {-102, -54}}, color = {0, 0, 127}));
  connect(torque3.y, refToBus3.torqueRef) annotation(
    Line(points = {{-124, -88}, {-100, -88}, {-100, -88}, {-102, -88}}, color = {0, 0, 127}));
  connect(refToBus1.axisControlBus, controlBus.axisControlBus1) annotation(
    Line(points = {{-80, -22}, {-8, -22}, {-8, -52}, {-10, -52}}, color = {255, 204, 51}, thickness = 0.5));
  connect(refToBus2.axisControlBus, controlBus.axisControlBus2) annotation(
    Line(points = {{-80, -54}, {-10, -54}, {-10, -52}, {-10, -52}}, color = {255, 204, 51}, thickness = 0.5));
  connect(refToBus3.axisControlBus, controlBus.axisControlBus3) annotation(
    Line(points = {{-80, -88}, {-8, -88}, {-8, -52}, {-10, -52}}, color = {255, 204, 51}, thickness = 0.5));
  connect(encoder1.y, controlBus.axisControlBus1.encoder) annotation(
    Line(points = {{42, -10}, {-2, -10}, {-2, -52}, {-10, -52}}, color = {0, 0, 127}));
  connect(encoder2.y, controlBus.axisControlBus2.encoder) annotation(
    Line(points = {{42, -42}, {-2, -42}, {-2, -52}, {-10, -52}}, color = {0, 0, 127}));
  connect(encoder3.y, controlBus.axisControlBus3.encoder) annotation(
    Line(points = {{42, -76}, {-4, -76}, {-4, -52}, {-10, -52}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end Package_Interfaces_test;
