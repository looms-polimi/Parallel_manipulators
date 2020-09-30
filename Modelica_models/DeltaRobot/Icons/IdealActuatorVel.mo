within DeltaRobot.Icons;

model IdealActuatorVel "Icon for 'IdealActuatorVel' model"
  extends DeltaRobot.Icons.IdealActuator;
equation
  annotation (Icon(graphics={
        Text(
          extent={{-40,-60},{40,-100}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="Vel.")
    }));    
end IdealActuatorVel;
