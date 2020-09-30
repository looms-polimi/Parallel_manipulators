within DeltaRobot.Components;
model IdealThreeArmsPos
  extends DeltaRobot.Icons.ThreeArms;
  extends DeltaRobot.Components.PartialThreeArms;

    //Ideal linear actuator (Position)
    parameter Real Tf = 0.02 "Time constant of the first order filter applied to the angle ref. input" annotation(Dialog(group="Ideal linear actuators (Position)"));
    parameter Boolean enableLimiter = true "=true, if you want to limit the input ref. angle within [minTheta, maxTheta]" annotation(Dialog(group="Ideal linear actuators (Position)"));
    parameter DeltaRobot.Types.ReducerParameters reducerParameters = gp.reducerParameters "Parameters of the gear reducer" annotation(Dialog(group="Ideal linear actuators (Position)"));

  Modelica.Blocks.Interfaces.RealInput angleRef[3] annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  IdealActuatorPos idealActPos1(
    alpha=base.beta,
    initialAngle=initTheta[1],
    stateSelect=StateSelect.always,
    Tf=Tf,
    enableLimiter=enableLimiter,
    reducerParameters=reducerParameters,
    maxTheta=armParameters.maxTheta,
    minTheta=armParameters.minTheta) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-50,70})));
  IdealActuatorPos idealActPos2(
    alpha=base.beta + base.alpha,
    initialAngle=initTheta[2],
    Tf=Tf,
    enableLimiter=enableLimiter,
    reducerParameters=reducerParameters,
    maxTheta=armParameters.maxTheta,
    minTheta=armParameters.minTheta) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,70})));
  IdealActuatorPos idealActPos3(
    alpha=base.beta + 2*base.alpha,
    initialAngle=initTheta[3],
    Tf=Tf,
    enableLimiter=enableLimiter,
    reducerParameters=reducerParameters,
    maxTheta=armParameters.maxTheta,
    minTheta=armParameters.minTheta) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={50,70})));
equation
  motorTorqueDIS[1] =idealActPos1.torque;
  motorTorqueDIS[2] =idealActPos2.torque;
  motorTorqueDIS[3] =idealActPos3.torque;

  motorVelocityDIS[1] =idealActPos1.velocity;
  motorVelocityDIS[2] =idealActPos2.velocity;
  motorVelocityDIS[3] =idealActPos3.velocity;

  connect(angleRef[3], idealActPos3.angleRef) annotation (Line(points={{-120,13.3333},{-66,13.3333},{-66,50},{24,50},{24,70},{38,70}}, color={0,0,127}));
  connect(angleRef[2], idealActPos2.angleRef) annotation (Line(points={{-120,0},{-76,0},{-76,56},{-24,56},{-24,70},{-12,70}}, color={0,0,127}));
  connect(angleRef[1], idealActPos1.angleRef) annotation (Line(points={{-120,-13.3333},{-86,-13.3333},{-86,70},{-62,70}}, color={0,0,127}));
  connect(idealActPos1.frame_b, upperArm1.frame_a) annotation (Line(
      points={{-50,60},{-50,40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActPos2.frame_b, upperArm2.frame_a) annotation (Line(
      points={{0,60},{0,40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActPos3.frame_b, upperArm3.frame_a) annotation (Line(
      points={{50,60},{50,40}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActPos1.frame_a, frame_base[1]) annotation (Line(
      points={{-50,80},{-50,89.3333},{0,89.3333}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActPos2.frame_a, frame_base[2]) annotation (Line(
      points={{0,80},{0,100}},
      color={95,95,95},
      thickness=0.5));
  connect(idealActPos3.frame_a, frame_base[3]) annotation (Line(
      points={{50,80},{50,110.667},{0,110.667}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true), graphics={Text(
          extent={{-98,-76},{-38,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={135,135,135},
          textString="Pos.")}),                                  Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="Finito");
end IdealThreeArmsPos;
