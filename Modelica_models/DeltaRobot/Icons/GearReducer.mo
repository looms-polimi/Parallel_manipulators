within DeltaRobot.Icons;

model GearReducer "Icon for 'GearReducer' model"
    extends Modelica.Mechanics.Rotational.Icons.Gearbox;
    annotation (Icon(graphics={
            Text(
              extent={{-150,150},{150,110}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-150,70},{150,100}},
              lineColor={0,0,0},
              textString="ratio=%reducerParameters.ratio")
    }));
end GearReducer;
