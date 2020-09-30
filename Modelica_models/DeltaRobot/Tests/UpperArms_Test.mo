within DeltaRobot.Tests;
model UpperArms_Test
  Modelica.Blocks.Sources.Constant const1(k=from_deg(45))  annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Components.Base base(useGlobalParameters=false, base(D=1.3))
                                                  annotation (Placement(transformation(extent={{-10,70},{10,50}})));
  inner Modelica.Mechanics.MultiBody.World world(n={0,0,-1})
                                                 annotation (Placement(transformation(extent={{-92,74},{-72,94}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(r={gp.armParameters.L,0,0}, diameter=gp.armParameters.D)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-60,-50})));
  inner Components.GlobalParameters gp annotation (Placement(transformation(extent={{-60,74},{-40,94}})));
  Components.IdealActuatorPos idealActuator1(alpha=-1.5707963267949)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-60,0})));
  Modelica.Blocks.Sources.Constant const2(k=from_deg(-45)) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder2(r={gp.armParameters.L,0,0}, diameter=gp.armParameters.D)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,-50})));
  Components.IdealActuatorPos idealActuator2(alpha=0.5235987755983) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,0})));
  Modelica.Blocks.Sources.Constant const3(k=from_deg(0))   annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder3(diameter=gp.armParameters.D, r={gp.armParameters.L,0,0})
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={60,-50})));
  Components.IdealActuatorPos idealActuator3(alpha=2.6179938779915)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={60,0})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(
                                                                 color_x={255,0,0}, animation=true)
                                                                                    annotation (Placement(transformation(extent={{-80,20},{-100,40}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame2(
                                                                 color_x={255,0,0}, animation=true)
                                                                                    annotation (Placement(transformation(extent={{-20,20},{-40,40}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame3(
                                                                 color_x={255,0,0}, animation=true)
                                                                                    annotation (Placement(transformation(extent={{40,20},{20,40}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame4(color_x={28,108,200}, animation=true)
                                                                                        annotation (Placement(transformation(extent={{-80,-40},{-100,-20}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame5(color_x={28,108,200}, animation=true)
                                                                                        annotation (Placement(transformation(extent={{-20,-40},{-40,-20}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame6(color_x={28,108,200}, animation=true)
                                                                                        annotation (Placement(transformation(extent={{40,-40},{20,-20}})));
equation
  connect(const1.y, idealActuator1.angleRef) annotation (Line(points={{-79,0},{-72,0}}, color={0,0,127}));
  connect(const2.y, idealActuator2.angleRef) annotation (Line(points={{-19,0},{-12,0}}, color={0,0,127}));
  connect(const3.y, idealActuator3.angleRef) annotation (Line(points={{41,0},{48,0}}, color={0,0,127}));
  connect(base.frame_b[1], idealActuator1.frame_a) annotation (Line(
      points={{0,51.0667},{-60,51.0667},{-60,10}},
      color={95,95,95},
      thickness=0.5));
  connect(base.frame_b[2], idealActuator2.frame_a) annotation (Line(
      points={{0,50},{0,10},{6.66134e-016,10}},
      color={95,95,95},
      thickness=0.5));
  connect(base.frame_b[3], idealActuator3.frame_a) annotation (Line(
      points={{0,48.9333},{60,48.9333},{60,10}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame1.frame_a, idealActuator1.frame_a) annotation (Line(
      points={{-80,30},{-60,30},{-60,10}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame2.frame_a, idealActuator2.frame_a) annotation (Line(
      points={{-20,30},{0,30},{0,10},{5.55112e-016,10}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame3.frame_a, idealActuator3.frame_a) annotation (Line(
      points={{40,30},{60,30},{60,10}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActuator1.frame_b, bodyCylinder1.frame_a) annotation (Line(
      points={{-60,-10},{-60,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActuator2.frame_b, bodyCylinder2.frame_a) annotation (Line(
      points={{-6.66134e-016,-10},{0,-10},{0,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActuator3.frame_b, bodyCylinder3.frame_a) annotation (Line(
      points={{60,-10},{60,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame4.frame_a, bodyCylinder1.frame_a) annotation (Line(
      points={{-80,-30},{-60,-30},{-60,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame5.frame_a, bodyCylinder2.frame_a) annotation (Line(
      points={{-20,-30},{0,-30},{0,-40},{5.55112e-016,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame6.frame_a, bodyCylinder3.frame_a) annotation (Line(
      points={{40,-30},{60,-30},{60,-40}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end UpperArms_Test;
