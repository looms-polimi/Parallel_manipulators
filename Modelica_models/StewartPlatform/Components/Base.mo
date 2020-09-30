within StewartPlatform.Components;

model Base "Model of the base of a Stewart platform"
  extends Disc(final direction=StewartPlatform.Types.Direction.down, final discParameters=if useGlobalParameters == true then gp.base else base);

// Imports
      import Modelica.Mechanics.MultiBody.Frames;

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the base parameters defined in the 'gp' (GlobalParameters) object" annotation (choices(checkBox=true));
    parameter StewartPlatform.Types.DiscParameters base(D=0.74, alpha=0.20943951023932) "Base parameters" annotation (Dialog(enable = not useGlobalParameters));

// Models
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false)
      annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=90,
        origin={-80,-9})));        
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false) 
      annotation (Placement(transformation(
        extent={{-52,8},{-32,28}})));
equation
  connect(fixed.frame_b, fixedRotation.frame_a) annotation(
    Line(points = {{-80, 2}, {-80, 2}, {-80, 18}, {-52, 18}, {-52, 18}}));
  connect(fixedRotation.frame_b, bodyCylinder.frame_a) annotation(
    Line(points = {{-32, 18}, {-20, 18}, {-20, 0}, {-20, 0}}, color = {95, 95, 95}));

  annotation (Icon(graphics={Text(
          extent={{-100,-50},{-50,-100}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textStyle={TextStyle.Bold},
          textString="B")}));
end Base;
