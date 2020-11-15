within StewartPlatform.Icons;

model ControlBus_signalSelector "Icon for 'ControlBus_signalSelector' model"
    annotation (
    Icon(
      coordinateSystem(
        extent={{-100, -100},{100, 100}}),
        graphics={Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 189}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}),
        Ellipse( fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{25, -10}, {45, 10}}, endAngle = 360),
      Line(points = {{-100, 0}, {-45, 0}}, color = {255, 85, 0}, thickness = 1),
      Line(points = {{45, 0}, {100, 0}}, color = {255, 85, 0}, thickness = 1),
      Line(points = {{-35, 0}, {30, 35}}, color = {255, 85, 0}, thickness = 1),
      Ellipse( fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-45, -10}, {-25, 10}}, endAngle = 360), Text(lineColor = {0, 0, 255}, extent = {{-150, -95}, {150, -55}}, textString = "%name")}));
end ControlBus_signalSelector;
