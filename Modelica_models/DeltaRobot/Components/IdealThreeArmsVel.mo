within DeltaRobot.Components;
model IdealThreeArmsVel
  extends DeltaRobot.Icons.ThreeArms;
  extends DeltaRobot.Components.PartialThreeArms;

    //Ideal linear actuator (Velocity)
    parameter Real Tf = 0.005 "Time constant of the first order filter applied to the angular speed ref. input" annotation(Dialog(group="Ideal linear actuators (Velocity)"));
    parameter Real gain = 1 "Additional gain for the reference signal" annotation(Dialog(group="Ideal linear actuators (Velocity)"));
    parameter DeltaRobot.Types.ReducerParameters reducerParameters = gp.reducerParameters "Parameters of the gear reducer" annotation(Dialog(group="Ideal linear actuators (Velocity)"));

  Modelica.Blocks.Interfaces.RealInput speedRef[3] annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  IdealActuatorVel idealActVel1(
    alpha=base.beta,
    reducerParameters=reducerParameters,
    Tf=Tf,
    initialAngle=initTheta[1],
    stateSelect=StateSelect.always,
    gain=gain) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,70})));
  IdealActuatorVel idealActVel2(
    reducerParameters=reducerParameters,
    Tf=Tf,
    initialAngle=initTheta[2],
    alpha=base.beta + base.alpha,
    gain=gain) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,70})));
  IdealActuatorVel idealActVel3(
    reducerParameters=reducerParameters,
    Tf=Tf,
    initialAngle=initTheta[3],
    alpha=base.beta + 2*base.alpha,
    gain=gain) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={50,70})));
equation
  motorTorqueDIS[1] =idealActVel1.torque;
  motorTorqueDIS[2] =idealActVel2.torque;
  motorTorqueDIS[3] =idealActVel3.torque;

  motorVelocityDIS[1] =idealActVel1.velocity;
  motorVelocityDIS[2] =idealActVel2.velocity;
  motorVelocityDIS[3] =idealActVel3.velocity;

  connect(speedRef[1], idealActVel1.angleRef) annotation (Line(points={{-120,-13.3333},{-80,-13.3333},{-80,70},{-62,70}}, color={0,0,127}));
  connect(speedRef[2], idealActVel2.angleRef) annotation (Line(points={{-120,0},{-68,0},{-68,58},{-26,58},{-26,70},{-12,70}}, color={0,0,127}));
  connect(speedRef[3], idealActVel3.angleRef) annotation (Line(points={{-120,13.3333},{-62,13.3333},{-62,54},{34,54},{34,70},{38,70}}, color={0,0,127}));
  connect(idealActVel1.frame_b, upperArm1.frame_a) annotation (Line(
      points={{-50,60},{-50,40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActVel2.frame_b, upperArm2.frame_a) annotation (Line(
      points={{0,60},{0,40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActVel3.frame_b, upperArm3.frame_a) annotation (Line(
      points={{50,60},{50,40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActVel1.frame_a, frame_base[1]) annotation (Line(
      points={{-50,80},{-50,89.3333},{0,89.3333}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActVel2.frame_a, frame_base[2]) annotation (Line(
      points={{0,80},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActVel3.frame_a, frame_base[3]) annotation (Line(
      points={{50,80},{50,110.667},{0,110.667}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true), graphics={Text(
          extent={{-98,-76},{-38,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={135,135,135},
          textString="Vel.")}),                                  Diagram(coordinateSystem(preserveAspectRatio=true)));
end IdealThreeArmsVel;
