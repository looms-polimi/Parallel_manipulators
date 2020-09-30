within DeltaRobot.Components;
model Actuator "Model of a rotary actuator with servo motor and reducer"
  extends DeltaRobot.Icons.Actuator;
  extends DeltaRobot.Components.PartialActuator;

  //Parameters
    //Servo motor
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters "Servo motor parameters" annotation (Dialog(group="Servo motor"));

  ServoMotor servoMotor(SMparameters=SMparameters)
                        annotation (Placement(transformation(extent={{-60,26},{-40,46}})));
  Interfaces.AxisControlBus axisControlBus annotation (Placement(transformation(extent={{-110,40},{-90,60}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,50})));
equation
  connect(axisControlBus, servoMotor.axisControlBus) annotation (Line(
      points={{-100,50},{-80,50},{-80,36.4},{-55.8,36.4}},
      color={255,204,51},
      thickness=0.5));
  connect(servoMotor.flange, gearReducer.flange_a) annotation (Line(points={{-40,36},{-22,36}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)));
end Actuator;
