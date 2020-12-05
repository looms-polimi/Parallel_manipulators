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
    Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false) annotation (Placement(visible = true, transformation(origin = {-92, -11}, extent = {{-10, -11}, {10, 11}}, rotation = 90)));
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(animation=false, r = if useGlobalParameters then gp.basePos else basePos) annotation (Placement(visible = true, transformation(extent = {{-80, 0}, {-60, 20}}, rotation = 0)));
equation
  connect(fixedRotation.frame_a, fixed.frame_b) annotation(Line(points = {{-80, 10}, {-90, 10}, {-90, 0}, {-90, 0}}));
  connect(fixedRotation.frame_b, bodyCylinder.frame_a) annotation(Line(points = {{-60, 10}, {-20, 10}, {-20, 0}, {-20, 0}}));

end Base;