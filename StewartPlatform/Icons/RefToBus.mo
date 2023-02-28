within StewartPlatform.Icons;

model RefToBus "Icon for 'RefToBus' model"
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255}),
        Text(
          extent={{-100,20},{16,-16}},
          lineColor={0,0,0},
          textString="torque")
    }));
    
end RefToBus;
