within DeltaRobot.Icons;

model SpeedCommand "Icon for 'SpeedCommand' model"
    extends Command;

    annotation (
    Icon(graphics={Text(
          extent={{-54,-70},{50,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={175,175,175},
          textString="Speed")}));
end SpeedCommand;
