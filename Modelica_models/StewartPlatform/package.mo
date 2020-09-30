package StewartPlatform "Package with all the elements used to model a Stewart platform"
  extends Modelica.Icons.Package;
  
  //Imports
    import SI = Modelica.Units.SI;
    import NonSI = Modelica.Units.NonSI;
    import Cv = Modelica.Units.Conversions;
    import Modelica.Constants.pi;
    import Modelica.Units.Conversions.from_deg;
    import Modelica.Units.Conversions.to_deg;   
    
    annotation (Icon(graphics={
        Polygon(
          points={{0,-60},{-12,-60},{-50,60},{-40,60},{0,-60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,80},{60,60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-82,-60},{80,-80}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-52,-60},{-64,-60},{-50,60},{-40,60},{-52,-60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-70,-60},{-48,-60},{-6,60},{-22,60},{-70,-60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-60},{12,-60},{50,60},{40,60},{0,-60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{52,-60},{64,-60},{50,60},{40,60},{52,-60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{70,-60},{48,-60},{6,60},{22,60},{70,-60}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid)}));
      
end StewartPlatform;
