within DeltaRobot.Tests;

model GearReducer_test "Test of model 'GearReducer'"
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Modelica.Blocks.Sources.Ramp ramp(
    startTime=1,
    height=3,
    duration=2) annotation (Placement(transformation(extent={{-122,2},{-102,22}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1) annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    duration=0.1,
    startTime=2,
    height=-10)
              annotation (Placement(transformation(extent={{92,-10},{72,10}})));
  Components.GearReducer gearReducer(reducerParameters(
      ratio=2,
      coulombOffset_a=0,
      coulombOffset_b=0,
      viscousCoeff_a=0.1,
      viscousCoeff_b=0.1))
                         annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    duration=3,
    startTime=6,
    height=10)   annotation (Placement(transformation(extent={{-122,-30},{-102,-10}})));
equation
  connect(torque1.tau, ramp1.y) annotation (Line(points={{62,0},{71,0}}, color={0,0,127}));
  connect(inertia.flange_b, torque1.flange) annotation (Line(points={{32,0},{40,0}}, color={0,0,0}));
  connect(torque.flange, gearReducer.flange_a) annotation (Line(points={{-28,0},{-16,0}}, color={0,0,0}));
  connect(gearReducer.flange_b, inertia.flange_a) annotation (Line(points={{4,0},{12,0}}, color={0,0,0}));
  connect(add.u1, ramp.y) annotation (Line(points={{-78,6},{-90,6},{-90,12},{-101,12}}, color={0,0,127}));
  connect(add.y, torque.tau) annotation (Line(points={{-55,0},{-50,0}}, color={0,0,127}));
  connect(ramp2.y, add.u2) annotation (Line(points={{-101,-20},{-90,-20},{-90,-6},{-78,-6}}, color={0,0,127}));
  annotation (experiment(StopTime=11));
end GearReducer_test;
