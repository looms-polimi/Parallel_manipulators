within DeltaRobot;
package Tests "Package with tests of the components"
  extends Modelica.Icons.UtilitiesPackage;

  model Servomotor_Test
    //Variables
      //vs_q = Rs*is_q + EMF + omega*Ls*is_d
      Real Rs_isq "=Rs*is_q";
      Real EMF "EMF=Ke*omega";
      Real omega_Ls_isd "= omega*Ls*is_d";

      //vs_d = Rs*is_d - omega*Ls*is_q
      Real Rs_isd "=Rs*is_d";
      Real omega_Ls_isq "= - omega*Ls*is_q"; //NOTA IL MENO già incluso

      Cv.NonSIunits.AngularVelocity_rpm shaftSpeed; //variabile per plot

    Modelica.Mechanics.Rotational.Components.Inertia inertia(                       J=0.1, w(start=0))
                                                                    annotation (Placement(transformation(extent={{20,58},{40,78}})));
    inner Modelica.Mechanics.MultiBody.World world(nominalLength=100,
      animateGravity=false,
      label2="Vs_q",
      gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity,
      label1="x",
      axisLength=60)                               annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,-118})));


protected
    Modelica.Mechanics.MultiBody.Visualizers.SignalArrow EMF_arrow annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={78,-88})));
    Modelica.Mechanics.MultiBody.Joints.Prismatic EMF_prismatic(
      n={0,1,0},
      useAxisFlange=true,
      animation=false)    annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,-88})));
    Modelica.Mechanics.Translational.Sources.Position EMF_position annotation (Placement(transformation(extent={{16,-90},{36,-70}})));
    Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(animation=false, m=1)
                                                           annotation (Placement(transformation(extent={{-50,-78},{-30,-58}})));
    Modelica.Mechanics.MultiBody.Visualizers.SignalArrow Rs_isq_arrow(color={255,0,0})
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={78,-58})));
    Modelica.Mechanics.MultiBody.Joints.Prismatic Rs_isq_prismatic(
      n={0,1,0},
      useAxisFlange=true,
      animation=false)
                      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,-58})));
    Modelica.Mechanics.Translational.Sources.Position Rs_isq_position annotation (Placement(transformation(extent={{16,-60},{36,-40}})));
    Modelica.Mechanics.Translational.Sources.Position omega_Ls_isq_position annotation (Placement(transformation(extent={{-6,10},{14,30}})));
    Modelica.Mechanics.MultiBody.Joints.Prismatic omega_Ls_isq_prismatic(
      useAxisFlange=true,
      n={1,0,0},
      animation=false)
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
      useAxisFlange=true,
      n={0,1,0},
      animation=false)
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
      useAxisFlange=true,
      n={1,0,0},
      animation=false) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={0,-26})));
    Modelica.Mechanics.MultiBody.Visualizers.SignalArrow Rs_isd_arrow(color={0,255,0})
      annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={0,-4})));
    Modelica.Mechanics.Translational.Sources.Position Rs_isd_position annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));

public
    Components.ServoMotor servomotor annotation (Placement(transformation(extent={{-10,58},{10,78}})));
    Modelica.Blocks.Sources.Step step(            startTime=0, height=8.2)
                                                             annotation (Placement(transformation(extent={{-70,58},{-50,78}})));
    Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r=true) annotation (Placement(transformation(extent={{-32,-104},{-12,-84}})));
    Interfaces.RefToBus refToBus annotation (Placement(transformation(extent={{-32,58},{-12,78}})));
    Modelica.Blocks.Sources.Step step2(           startTime=0, height=2.5)
                                                             annotation (Placement(transformation(extent={{-68,92},{-48,112}})));
    Components.ServoMotor servomotor1(SMparameters(Vmax=80))
                                     annotation (Placement(transformation(extent={{-12,92},{8,112}})));
    Interfaces.RefToBus refToBus1
                                 annotation (Placement(transformation(extent={{-40,92},{-20,112}})));
    Modelica.Mechanics.Rotational.Components.Inertia inertia1(                      J=0.1, w(start=0))
                                                                    annotation (Placement(transformation(extent={{20,92},{40,112}})));
  equation
    //variabile per plot
    shaftSpeed = servomotor.w*60/2/pi;

    //vs_q
    Rs_isq = servomotor.Rs*servomotor.is_q;
    EMF = servomotor.omega*servomotor.Ke;
    omega_Ls_isd = servomotor.omega*servomotor.Ls*servomotor.is_d;

    //vs_d
    Rs_isd = servomotor.Rs*servomotor.is_d;
    omega_Ls_isq = - servomotor.omega*servomotor.Ls*servomotor.is_q; //NOTA IL MENO già incluso


    //vs_q
    EMF_arrow.r_head = {0,EMF,0};
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
    connect(servomotor.flange, inertia.flange_a) annotation (Line(points={{10,68},{20,68}}, color={0,0,0}));
    connect(absoluteSensor.frame_a, pointMass.frame_a) annotation (Line(
        points={{-32,-94},{-36,-94},{-36,-68},{-40,-68}},
        color={95,95,95},
        thickness=0.5));
    connect(refToBus.axisControlBus, servomotor.axisControlBus)
      annotation (Line(
        points={{-12,68.4},{-5.8,68.4}},
        color={255,204,51},
        thickness=0.5));
  connect(step2.y, refToBus1.torqueRef) annotation (Line(points={{-47,102},{-42,102}}, color={0,0,127}));
  connect(refToBus1.axisControlBus, servomotor1.axisControlBus)
    annotation (Line(
      points={{-20,102.4},{-14,102.4},{-14,102.4},{-7.8,102.4}},
      color={255,204,51},
      thickness=0.5));
  connect(servomotor1.flange, inertia1.flange_a) annotation (Line(points={{8,102},{20,102}}, color={0,0,0}));
  connect(step.y, refToBus.torqueRef) annotation (Line(points={{-49,68},{-34,68}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false), graphics={Line(
            points={{-100,36},{100,36}},
            color={0,0,0},
            thickness=0.5,
            pattern=LinePattern.Dash), Text(
            extent={{-94,32},{-34,20}},
            lineColor={0,0,0},
            pattern=LinePattern.Dash,
            lineThickness=0.5,
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={215,215,215},
            textString="Graphic visualization")}),
      experiment(StopTime=10));
  end Servomotor_Test;
end Tests;
