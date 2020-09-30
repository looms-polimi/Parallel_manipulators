within DeltaRobot.Components;
model ThreeArms
  extends DeltaRobot.Icons.ThreeArms;
  extends DeltaRobot.Components.PartialThreeArms;

  //Actuators
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters = gp.SMparameters "Servo motors parameters" annotation (Dialog(group="Actuators"));
    parameter DeltaRobot.Types.ReducerParameters reducerParameters = gp.reducerParameters "Parameters of the gear reducer" annotation (Dialog(group="Actuators"));

  Actuator actuator1(
    reducerParameters=reducerParameters,
    SMparameters=SMparameters,
    alpha=base.beta,
    initialAngle=initTheta[1],
    stateSelect=StateSelect.always)
                     annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,70})));
  Actuator actuator2(
    reducerParameters=reducerParameters,
    SMparameters=SMparameters,
    initialAngle=initTheta[2],
    alpha=base.beta + base.alpha)
                     annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,70})));
  Actuator actuator3(
    reducerParameters=reducerParameters,
    SMparameters=SMparameters,
    initialAngle=initTheta[3],
    alpha=base.beta + 2*base.alpha)
                     annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={50,70})));
  Interfaces.ControlBus controlBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,0}), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-100,0})));
equation
  motorTorqueDIS[1] = actuator1.torque;
  motorTorqueDIS[2] = actuator2.torque;
  motorTorqueDIS[3] = actuator3.torque;

  motorVelocityDIS[1] = actuator1.velocity;
  motorVelocityDIS[2] = actuator2.velocity;
  motorVelocityDIS[3] = actuator3.velocity;

  connect(actuator1.frame_a, frame_base[1]) annotation (Line(
      points={{-50,80},{-50,89.3333},{0,89.3333}},
      color={95,95,95},
      thickness=0.5));
  connect(actuator2.frame_a, frame_base[2]) annotation (Line(
      points={{0,80},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(actuator3.frame_a, frame_base[3]) annotation (Line(
      points={{50,80},{50,110.667},{0,110.667}},
      color={95,95,95},
      thickness=0.5));
  connect(actuator1.frame_b, upperArm1.frame_a) annotation (Line(
      points={{-50,60},{-50,40}},
      color={95,95,95},
      thickness=0.5));
  connect(actuator2.frame_b, upperArm2.frame_a) annotation (Line(
      points={{0,60},{0,40}},
      color={95,95,95},
      thickness=0.5));
  connect(actuator3.frame_b, upperArm3.frame_a) annotation (Line(
      points={{50,60},{50,40}},
      color={95,95,95},
      thickness=0.5));
  connect(controlBus.axisControlBus1, actuator1.axisControlBus)
    annotation (Line(
      points={{-100.05,0.05},{-100.05,86},{-55,86},{-55,80}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus.axisControlBus2, actuator2.axisControlBus)
    annotation (Line(
      points={{-100.05,0.05},{-100.05,86},{-5,86},{-5,80}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus.axisControlBus3, actuator3.axisControlBus)
    annotation (Line(
      points={{-100.05,0.05},{-100.05,86},{45,86},{45,80}},
      color={255,204,51},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)));
end ThreeArms;
