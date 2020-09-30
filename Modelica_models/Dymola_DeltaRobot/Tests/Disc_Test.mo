within DeltaRobot.Tests;
model Disc_Test
  inner Modelica.Mechanics.MultiBody.World world(animateGravity=false)
                                                 annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-50})));
  Components.Disc disc(discParameters(D=1.3), direction=DeltaRobot.Types.Direction.up)
                       annotation (Placement(transformation(extent={{-10,-28},{10,-8}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(
                                                                 color_x={255,0,0}, animation=true)
                                                                                    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x={28,108,200}, animation=true)
                                                                                        annotation (Placement(transformation(extent={{0,38},{20,58}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame3(color_x={0,140,72}, animation=true)
                                                                                      annotation (Placement(transformation(extent={{-20,0},{-40,20}})));
equation
  connect(world.frame_b, disc.frame_a) annotation (Line(
      points={{0,-40},{0,-28}},
      color={95,95,95},
      thickness=0.5));
  connect(disc.frame_b[1], fixedFrame1.frame_a) annotation (Line(
      points={{0,-9.06667},{0,10},{20,10}},
      color={95,95,95},
      thickness=0.5));
  connect(disc.frame_b[2], fixedFrame2.frame_a) annotation (Line(
      points={{0,-8},{0,48}},
      color={95,95,95},
      thickness=0.5));
  connect(disc.frame_b[3], fixedFrame3.frame_a) annotation (Line(
      points={{0,-6.93333},{0,10},{-20,10}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Disc_Test;
