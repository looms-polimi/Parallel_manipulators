within DeltaRobot.Components;
model Base "Base of a Delta robot"
  extends Disc(final direction=DeltaRobot.Types.Direction.up, final discParameters=if useGlobalParameters == true then gp.base else base);

  //Parameters
    outer DeltaRobot.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the base parameters defined in the 'gp' (GlobalParameters) object"
      annotation (choices(checkBox=true));
    parameter DeltaRobot.Types.DiscParameters base(D=0.164*2) "Base parameters"
      annotation (Dialog(enable = not useGlobalParameters));

  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation=false)
                                                 annotation (Placement(transformation(
        extent={{-10,-11},{10,11}},
        rotation=90,
        origin={56,-9})));
equation

  connect(bodyCylinder.frame_a, fixed.frame_b) annotation (Line(
      points={{-20,0},{18,0},{18,1},{56,1}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="Finito");
end Base;
