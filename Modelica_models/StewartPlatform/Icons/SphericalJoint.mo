within StewartPlatform.Icons;

model SphericalJoint "Icon for 'SphericalJoint' model"

  annotation (    
         Icon(coordinateSystem(        
        extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          extent={{-70,-70},{70,70}},
          fillPattern=FillPattern.Sphere,
          fillColor={192,192,192}),
        Ellipse(
          extent={{-49,-50},{51,50}},
          lineColor={128,128,128},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{30,70},{71,-68}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,10},{-68,-10}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{23,10},{100,-10}},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Ellipse(
          extent={{-24,25},{26,-25}},
          fillPattern=FillPattern.Sphere,
          fillColor={160,160,164}),
        Text(
          extent={{-150,-115},{150,-75}},
          textString="%name",
          textColor={0,0,255}),
        Text(
          extent={{-136,-25},{-100,-50}},
          textColor={128,128,128},
          textString="a"),
        Text(
          extent={{100,-25},{136,-50}},
          textColor={128,128,128},
          textString="b")}));          
          
end SphericalJoint;
