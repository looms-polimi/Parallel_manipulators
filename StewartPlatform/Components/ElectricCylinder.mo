within StewartPlatform.Components;

model ElectricCylinder "Mechanical linear drive unit with piston rod"
  extends StewartPlatform.Icons.ElectricCylinder; // Icon
  extends StewartPlatform.Components.PartialElectricCylinder;

// Models  
  SpindleDrive spindleDrive(spindlePitch=electricCylinderParameters.spindlePitch) annotation (Placement(transformation(extent={{-18,26},{2,46}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-110,56},{-90,76}}), iconTransformation(extent={{-110,56},{-90,76}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear(ratio=electricCylinderParameters.ratio) annotation (Placement(transformation(extent={{-48,26},{-28,46}})));

equation

  connect(spindleDrive.flangeT, prismatic.axis) annotation (Line(points={{2,36},{8,36},{8,6}}, color={0,127,0}));
  connect(idealGear.flange_b, spindleDrive.flangeR) annotation (Line(points={{-28,36},{-18,36}}, color={0,0,0}));
  connect(flange_a, idealGear.flange_a) annotation (Line(points={{-100,66},{-100,36},{-48,36}}, color={0,0,0}));

end ElectricCylinder;
