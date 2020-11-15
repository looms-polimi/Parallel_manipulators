within DeltaRobot.Components;

model Base "Base of a Delta Robot"    
    extends DeltaRobot.Icons.Base; // Icon
    extends Disc(final direction=DeltaRobot.Types.Units.Direction.up, final discParameters=if useGlobalParameters then gp.base else base);

    // Parameters
    outer DeltaRobot.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the base parameters defined in the 'gp' (GlobalParameters) object" annotation (choices(checkBox=true));
    parameter DeltaRobot.Types.DiscParameters base(D=0.30) "Parameters of the base";
    parameter SI.Position basePos[3] = {0,0,0} "Vector from world frame to base.frame_a resolved in world frame";

    // Models
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false) annotation (Placement(transformation(extent={{-10,-11},{10,11}},rotation=90,origin={56,-9})));
    //Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false, r = if useGlobalParameters then gp.basePos else basePos) annotation (Placement(transformation(extent={{-52,8},{-32,28}})));
  //TODO aggiungere una fix rotation al modello della baser per uniformarlo al modello della piattaforma di Stewart
equation
  connect(bodyCylinder.frame_a, fixed.frame_b) annotation (Line(points={{-20,0},{18,0},{18,1},{56,1}},color={95,95,95},thickness=0.5));
end Base;
