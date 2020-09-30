within DeltaRobot.Tests;
model Base_Test
  inner Modelica.Mechanics.MultiBody.World world(animateGravity=false)
                                                 annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  Components.Base base(useGlobalParameters=true)  annotation (Placement(transformation(extent={{-10,-28},{10,-8}})));
  inner Components.GlobalParameters gp annotation (Placement(transformation(extent={{-54,70},{-34,90}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame3(color_x={0,140,72}, animation=true)
                                                                                      annotation (Placement(transformation(extent={{-20,0},{-40,20}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(color_x={28,108,200}, animation=true)
                                                                                        annotation (Placement(transformation(extent={{0,38},{20,58}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(
                                                                 color_x={255,0,0}, animation=true)
                                                                                    annotation (Placement(transformation(extent={{20,0},{40,20}})));
equation
  connect(base.frame_b[1], fixedFrame1.frame_a) annotation (Line(
      points={{0,-9.06667},{0,10},{20,10}},
      color={95,95,95},
      thickness=0.5));
  connect(base.frame_b[2], fixedFrame2.frame_a) annotation (Line(
      points={{0,-8},{0,48}},
      color={95,95,95},
      thickness=0.5));
  connect(base.frame_b[3], fixedFrame3.frame_a) annotation (Line(
      points={{0,-6.93333},{0,10},{-20,10}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Base_Test;
