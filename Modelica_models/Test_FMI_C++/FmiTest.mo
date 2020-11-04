package FmiTest

  model Model
    Modelica.Blocks.Interfaces.RealOutput i annotation(
      Placement(visible = true, transformation(origin = {-66, -8}, extent = {{6, -6}, {-6, 6}}, rotation = 0), iconTransformation(origin = {-66, -8}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput v annotation(
      Placement(visible = true, transformation(origin = {-66, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin = {-66, 8}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.GeneralVoltageToCurrentAdaptor adaptor(use_fder = false, use_pder = false)  annotation(
      Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Ground gnd annotation(
      Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Resistor r(R = 1000)  annotation(
      Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Electrical.Analog.Basic.Capacitor c(C = 100e-6)  annotation(
      Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    
  equation
    connect(r.n, c.p) annotation(
      Line(points = {{10, 20}, {40, 20}, {40, 10}}, color = {0, 0, 255}));
    connect(gnd.p, c.n) annotation(
      Line(points = {{0, -20}, {40, -20}, {40, -10}}, color = {0, 0, 255}));
    connect(r.p, adaptor.pin_p) annotation(
      Line(points = {{-10, 20}, {-38, 20}, {-38, 8}, {-38, 8}}, color = {0, 0, 255}));
    connect(gnd.p, adaptor.pin_n) annotation(
      Line(points = {{0, -20}, {-38, -20}, {-38, -8}, {-38, -8}}, color = {0, 0, 255}));
    connect(v, adaptor.p) annotation(
      Line(points = {{-66, 8}, {-44, 8}, {-44, 8}, {-42, 8}}, color = {0, 0, 127}));
    connect(adaptor.f, i) annotation(
      Line(points = {{-42, -8}, {-62, -8}, {-62, -8}, {-66, -8}}, color = {0, 0, 127}));
  end Model;
  annotation(
    uses(Modelica(version = "3.2.3")));

end FmiTest;