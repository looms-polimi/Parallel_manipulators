within StewartPlatform.Interfaces;

model InOut
  Modelica.Blocks.Interfaces.RealInput u1 annotation(
    Placement(visible = true, transformation(origin = {-28, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-20, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y1 annotation(
    Placement(visible = true, transformation(origin = {26, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u2 annotation(
    Placement(visible = true, transformation(origin = {-28, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-20, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u3 annotation(
    Placement(visible = true, transformation(origin = {-28, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y2 annotation(
    Placement(visible = true, transformation(origin = {26, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y3 annotation(
    Placement(visible = true, transformation(origin = {26, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u4 annotation(Placement(visible = true, transformation(origin = {36, -40}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {20, -60}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y4 annotation(Placement(visible = true, transformation(origin = {-18, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-10, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus axisControlBus annotation(
    Placement(visible = true, transformation(origin = {-102, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-101, -2}, extent = {{-27, -20}, {27, 20}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus axisControlBus1 annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {101, 0}, extent = {{-29, -20}, {29, 20}}, rotation = 0)));
equation
  connect(u1, y1) annotation(
    Line(points = {{-28, 80}, {26, 80}}, color = {0, 0, 127}));
  connect(u2, y2) annotation(
    Line(points = {{-28, 40}, {26, 40}}, color = {0, 0, 127}));
  connect(u3, y3) annotation(
    Line(points = {{-28, 0}, {26, 0}}, color = {0, 0, 127}));
  connect(u4, y4) annotation(Line(points = {{36, -40}, {-18, -40}}, color = {0, 0, 127}));
  connect(u1, axisControlBus.angularPos) annotation(
    Line(points = {{-28, 80}, {-100, 80}, {-100, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(y1, axisControlBus1.angularPos) annotation(
    Line(points = {{26, 80}, {100, 80}, {100, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(u2, axisControlBus.angularVel) annotation(
    Line(points = {{-28, 40}, {-102, 40}, {-102, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(y2, axisControlBus1.angularVel) annotation(
    Line(points = {{26, 40}, {98, 40}, {98, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(u3, axisControlBus.angularAcc) annotation(
    Line(points = {{-28, 0}, {-100, 0}, {-100, 0}, {-102, 0}}, color = {0, 0, 127}));
  connect(y3, axisControlBus1.angularAcc) annotation(
    Line(points = {{26, 0}, {102, 0}, {102, 0}, {100, 0}}, color = {0, 0, 127}));
  connect(u4, axisControlBus1.appliedTorque) annotation(Line(points = {{36, -40}, {102, -40}, {102, 0}, {100, 0}}, color = {0, 0, 127}));
  //connect(y4, axisControlBus.appliedTorque) annotation(Line(points = {{-18, -40}, {-100, -40}, {-100, 0}, {-102, 0}}, color = {0, 0, 127}));
end InOut;
