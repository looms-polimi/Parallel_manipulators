within StewartPlatform.Components;

model Base "Base of a Stewart Platform"
    extends StewartPlatform.Icons.Base; // Icon
    extends Disc(final direction=StewartPlatform.Types.Units.Direction.down, final discParameters=if useGlobalParameters then gp.base else base);

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the base parameters defined in the 'gp' (GlobalParameters) object" annotation (choices(checkBox=true));
    parameter StewartPlatform.Types.DiscParameters base(D=0.74, alpha=from_deg(12)) "Base parameters";

// Models
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false) annotation (Placement(transformation(extent={{-10,-11},{10,11}},rotation=90,origin={-80,-9})));        
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false) annotation (Placement(transformation(extent={{-52,8},{-32,28}})));

equation
  connect(fixed.frame_b, fixedRotation.frame_a) annotation(Line(points = {{-80, 2}, {-80, 2}, {-80, 18}, {-52, 18}, {-52, 18}}));
  connect(fixedRotation.frame_b, bodyCylinder.frame_a) annotation(Line(points = {{-32, 18}, {-20, 18}, {-20, 0}, {-20, 0}}, color = {95, 95, 95}));

end Base;
