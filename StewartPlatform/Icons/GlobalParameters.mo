within StewartPlatform.Icons;

model GlobalParameters "Icon for 'GlobalParameters' model"
    annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-6,78},{-34,72},{-54,60},{-76,34},{-64,20},{-60,6},{-82,-12},{-58,-34},{-54,-58},{-26,-70},{-32,-50},{-8,-18},{-54,4},{-40,30},{-10,32},{-6,78}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid,
            smooth=Smooth.Bezier),
          Polygon(
            points={{50,12},{50,12},{50,4},{90,-2},{50,-74},{44,-22},{14,-14},{44,14},{46,14},{50,12}},
            lineColor={0,0,0},
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid,
            smooth=Smooth.Bezier),      
          Polygon(
            points={{78,6},{64,14},{46,28},{40,40},{46,50},{58,54},{70,40},{78,18},{78,6}},
            lineColor={0,0,0},
            smooth=Smooth.Bezier,
            fillColor={0,127,0},
            fillPattern=FillPattern.Solid),
          Text(
            lineColor={0,0,255},
            extent={{-150,101},{150,141}},
            textString="%name")
            }));
            
end GlobalParameters;
