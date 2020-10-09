within StewartPlatform.Icons;

model Disc "Icon for 'Disc' model"
    annotation (Icon(graphics = {
        Ellipse(fillColor = {0, 128, 255}, 
        fillPattern = FillPattern.VerticalCylinder, 
        extent = {{-100, 20}, {100, -60}}, endAngle = 360), 
        Rectangle(fillColor = {0, 128, 255}, 
        pattern = LinePattern.None, 
        fillPattern = FillPattern.VerticalCylinder, 
        extent = {{-100, -20}, {100, 20}}), 
        Ellipse(fillColor = {0, 0, 188}, 
        fillPattern = FillPattern.Sphere, 
        extent = {{-100, 60}, {100, -20}}, endAngle = 360), 
        Ellipse(fillColor = {255, 0, 0}, 
        fillPattern = FillPattern.Sphere, 
        extent = {{8, 4}, {32, -20}}, endAngle = 360), 
        Ellipse(fillColor = {255, 0, 0}, 
        fillPattern = FillPattern.Sphere, 
        extent = {{54, 50}, {78, 26}}, endAngle = 360), 
        Ellipse(fillColor = {255, 0, 0}, 
        fillPattern = FillPattern.Sphere, 
        extent = {{-48, 58}, {-24, 34}}, endAngle = 360), 
        Ellipse(fillColor = {255, 0, 0}, 
        fillPattern = FillPattern.Sphere, 
        extent = {{-78, 50}, {-54, 26}}, endAngle = 360), 
        Ellipse(fillColor = {255, 0, 0}, 
        fillPattern = FillPattern.Sphere, 
        extent = {{-34, 4}, {-10, -20}}, endAngle = 360), 
        Ellipse(fillColor = {255, 0, 0}, 
        fillPattern = FillPattern.Sphere, 
        extent = {{24, 58}, {48, 34}}, endAngle = 360)}, 
        coordinateSystem(initialScale = 0.1)));

end Disc;
