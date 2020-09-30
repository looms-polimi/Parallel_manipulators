within DeltaRobot.Icons;

model IdealActuatorPos "Icon for 'IdealActuatorPos' model"
  extends DeltaRobot.Icons.IdealActuator;
equation
  annotation (Icon(graphics={
        Text(
          extent={{-40,-60},{40,-100}},
          lineColor={0,0,0},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="Pos.")
    }));    
end IdealActuatorPos;
