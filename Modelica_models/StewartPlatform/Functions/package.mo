within StewartPlatform;

package Functions "Library of functions used to model a Stewart platform"
  extends Modelica.Icons.Package;
  
  annotation (Icon(graphics={
        Text(
          lineColor={0,0,255},
          extent={{-150,105},{150,145}},
          textString="%name"),
        Ellipse(
          lineColor = {108,88,49},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-80,-80},{80,80}}),
        Text(
          lineColor={108,88,49},
          extent={{-90.0,-90.0},{90.0,90.0}},
          textString="f")}));
  
end Functions;
