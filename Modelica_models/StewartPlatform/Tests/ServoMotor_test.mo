within StewartPlatform.Tests;

model ServoMotor_test
  //Variables
  //vs_q = Rs*is_q + EMF + omega*Ls*is_d
    Real Rs_isq "=Rs*is_q";
    Real EMF "EMF=Ke*omega";
    Real omega_Ls_isd "= omega*Ls*is_d";

//vs_d = Rs*is_d - omega*Ls*is_q
    Real Rs_isd "=Rs*is_d";
    Real omega_Ls_isq "= - omega*Ls*is_q"; 
//NOTA IL MENO già incluso
  Modelica.Mechanics.Rotational.Components.Inertia inertia(                       J=0.1, w(start=0))
                                                                  annotation (Placement(transformation(extent={{22,58},{42,78}})));
  inner Modelica.Mechanics.MultiBody.World world(nominalLength=100,
    animateGravity=false,
    label2="Vs_q",
    gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity,
    label1="x",
    axisLength=60)                               annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-118})));
  Modelica.Mechanics.Rotational.Sources.TorqueStep torqueStep(
    offsetTorque=0,
    startTime=45,
    stepTorque=5)     annotation (Placement(transformation(extent={{76,58},{56,78}})));
  StewartPlatform.Components.ServoMotor servomotor annotation (Placement(transformation(extent={{-8,58},{12,78}})));
  Modelica.Blocks.Sources.Step step(          startTime=1, height=3)
                                                           annotation (Placement(transformation(extent={{-104,74},{-84,94}})));
  Modelica.Blocks.Sources.Step step1(height=-5, startTime=15) annotation (Placement(transformation(extent={{-104,44},{-84,64}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-58,58},{-38,78}})));
  Interfaces.RefToBus refToBus annotation (Placement(transformation(extent={{-30,58},{-10,78}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r=true) annotation (Placement(transformation(extent={{-32,-104},{-12,-84}})));


protected
  Modelica.Mechanics.MultiBody.Visualizers.SignalArrow EMF_arrow annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={78,-88})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic EMF_prismatic(
    n={0,1,0},
    useAxisFlange=true)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-88})));
  Modelica.Mechanics.Translational.Sources.Position EMF_position annotation (Placement(transformation(extent={{16,-90},{36,-70}})));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(animation= false, m=1)
                                                         annotation (Placement(transformation(extent={{-50,-78},{-30,-58}})));
  Modelica.Mechanics.MultiBody.Visualizers.SignalArrow Rs_isq_arrow(color={255,0,0})
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={78,-58})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic Rs_isq_prismatic(
    n={0,1,0},
    useAxisFlange=true)
                    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-58})));
  Modelica.Mechanics.Translational.Sources.Position Rs_isq_position annotation (Placement(transformation(extent={{16,-60},{36,-40}})));
  Modelica.Mechanics.Translational.Sources.Position omega_Ls_isq_position annotation (Placement(transformation(extent={{-6,10},{14,30}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic omega_Ls_isq_prismatic(
    
    n={1,0,0}, useAxisFlange = true)
                    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={38,-26})));
  Modelica.Mechanics.MultiBody.Visualizers.SignalArrow omega_Ls_isq_arrow(color={238,46,47})
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={38,-4})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(
    r={0,0,0},
    lengthDirection={0,0,1},
    length=10,
    innerDiameter=servomotor.Vmax*2,
    diameter=1.01*servomotor.Vmax*2) annotation (Placement(transformation(extent={{86,-118},{106,-98}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic omega_Ls_isd_prismatic(
    
    n={0,1,0}, useAxisFlange = true)
               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-40,-46})));
  Modelica.Mechanics.Translational.Sources.Position omega_Ls_isd_position annotation (Placement(transformation(extent={{-78,-86},{-58,-66}})));
  Modelica.Mechanics.MultiBody.Visualizers.SignalArrow omega_Ls_isd_arrow(color={0,255,0})
    annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-70,-46})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic Rs_isd_prismatic(
    
    n={1,0,0}, useAxisFlange = true) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={0,-26})));
  Modelica.Mechanics.MultiBody.Visualizers.SignalArrow Rs_isd_arrow(color={0,255,0})
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={0,-4})));
  Modelica.Mechanics.Translational.Sources.Position Rs_isd_position annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
equation
//vs_q
  Rs_isq = servomotor.Rs * servomotor.is_q;
  EMF = servomotor.omega*servomotor.Ke;
  omega_Ls_isd = servomotor.omega*servomotor.Ls*servomotor.is_d;
//vs_d
  Rs_isd = servomotor.Rs * servomotor.is_d;
  omega_Ls_isq = - servomotor.omega*servomotor.Ls*servomotor.is_q;
//NOTA IL MENO già incluso
//vs_q
  EMF_arrow.r_head = {0, EMF, 0};
  EMF_position.s_ref = EMF;

  Rs_isq_arrow.r_head = {0, Rs_isq, 0};
  Rs_isq_position.s_ref = Rs_isq;

  omega_Ls_isd_arrow.r_head = {0, omega_Ls_isd, 0};
  omega_Ls_isd_position.s_ref = omega_Ls_isd;
//vs_d
  omega_Ls_isq_arrow.r_head = {omega_Ls_isq, 0, 0};
  omega_Ls_isq_position.s_ref = omega_Ls_isq;

  Rs_isd_arrow.r_head = {Rs_isd,0,0};
  Rs_isd_position.s_ref = Rs_isd;

  connect(EMF_position.flange, EMF_prismatic.axis) annotation (Line(points={{36,-80},{44,-80}},   color={0,127,0}));
  connect(world.frame_b, EMF_prismatic.frame_a) annotation (Line(
      points={{50,-108},{50,-98}},
      color={95,95,95},
      thickness=0.5));
  connect(EMF_prismatic.frame_a, EMF_arrow.frame_a) annotation (Line(
      points={{50,-98},{78,-98}},
      color={95,95,95},
      thickness=0.5));
  connect(Rs_isq_position.flange, Rs_isq_prismatic.axis) annotation (Line(points={{36,-50},{44,-50}},   color={0,127,0}));
  connect(Rs_isq_prismatic.frame_a, EMF_prismatic.frame_b) annotation (Line(
      points={{50,-68},{50,-78}},
      color={95,95,95},
      thickness=0.5));
  connect(Rs_isq_prismatic.frame_a, Rs_isq_arrow.frame_a) annotation (Line(
      points={{50,-68},{78,-68}},
      color={95,95,95},
      thickness=0.5));
  connect(omega_Ls_isq_prismatic.frame_a, Rs_isq_prismatic.frame_b) annotation (Line(
      points={{48,-26},{50,-26},{50,-48}},
      color={95,95,95},
      thickness=0.5));
  connect(omega_Ls_isq_arrow.frame_a, omega_Ls_isq_prismatic.frame_a) annotation (Line(
      points={{48,-4},{56,-4},{56,-26},{48,-26}},
      color={95,95,95},
      thickness=0.5));
  connect(omega_Ls_isq_position.flange, omega_Ls_isq_prismatic.axis) annotation (Line(points={{14,20},{16,20},{16,-20},{30,-20}},   color={0,127,0}));
  connect(bodyCylinder.frame_a, world.frame_b) annotation (Line(
      points={{86,-108},{50,-108}},
      color={95,95,95},
      thickness=0.5));
  connect(omega_Ls_isd_position.flange, omega_Ls_isd_prismatic.axis) annotation (Line(points={{-58,-76},{-54,-76},{-54,-54},{-46,-54}},
                                                                                                                    color={0,127,0}));
  connect(omega_Ls_isd_prismatic.frame_b, pointMass.frame_a) annotation (Line(
      points={{-40,-56},{-40,-68}},
      color={95,95,95},
      thickness=0.5));
  connect(omega_Ls_isd_arrow.frame_a, omega_Ls_isd_prismatic.frame_a) annotation (Line(
      points={{-70,-36},{-40,-36}},
      color={95,95,95},
      thickness=0.5));
  connect(Rs_isd_prismatic.frame_a, omega_Ls_isq_prismatic.frame_b) annotation (Line(
      points={{10,-26},{28,-26}},
      color={95,95,95},
      thickness=0.5));
  connect(Rs_isd_arrow.frame_a, Rs_isd_prismatic.frame_a) annotation (Line(
      points={{10,-4},{10,-26}},
      color={95,95,95},
      thickness=0.5));
  connect(Rs_isd_position.flange, Rs_isd_prismatic.axis) annotation (Line(points={{-24,0},{-24,-20},{-8,-20}},            color={0,127,0}));
  connect(omega_Ls_isd_prismatic.frame_a, Rs_isd_prismatic.frame_b)
    annotation (Line(
      points={{-40,-36},{-40,-28},{-10,-28},{-10,-26}},
      color={95,95,95},
      thickness=0.5));
  connect(torqueStep.flange, inertia.flange_b) annotation (Line(points={{56,68},{42,68}},  color={0,0,0}));
  connect(servomotor.flange, inertia.flange_a) annotation (Line(points={{12,68},{22,68}}, color={0,0,0}));
  connect(step.y, add.u1) annotation (Line(points={{-83,84},{-60,84},{-60,74}},
                                                                              color={0,0,127}));
  connect(step1.y, add.u2) annotation (Line(points={{-83,54},{-60,54},{-60,62}},
                                                                               color={0,0,127}));
  connect(servomotor.axisControlBus, refToBus.axisControlBus) annotation (Line(
      points={{-3.8,68.4},{-10,68.4}},
      color={255,204,51},
      thickness=0.5));
  connect(add.y, refToBus.torqueRef) annotation (Line(points={{-37,68},{-32,68}}, color={0,0,127}));
  connect(absoluteSensor.frame_a, pointMass.frame_a) annotation (Line(
      points={{-32,-94},{-36,-94},{-36,-68},{-40,-68}},
      color={95,95,95},
      thickness=0.5));
  annotation(
    Diagram(graphics = {Line(points = {{-100, 36}, {100, 36}}, pattern = LinePattern.Dash, thickness = 0.5), Text(fillColor = {215, 215, 215}, pattern = LinePattern.Dash, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0.5, extent = {{-94, 32}, {-34, 20}}, textString = "Graphic visualization")}),
    experiment(StopTime = 60));
end ServoMotor_test;
