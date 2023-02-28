within DeltaRobot.Icons;

model PoseMux "Icon for 'PoseMux' model"
equation
    annotation (Icon(graphics={Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}),
        Line(origin = {94.3562, -7.31586e-06}, points = {{-92, 0}, {2, 0}}, color = {135, 135, 135}),
        Line(points = {{-98, 60}, {-62, 60}, {2, 0}}, color = {0, 127, 0}),
        Line(origin = {-98.2877, 0}, points = {{0, -60}, {36, -60}, {100, 0}}, color = {255, 0, 0}),
        Line(origin = {-106, 0}, points = {{8, 0}, {108, 0}}, color = {0, 0, 127}),
        Ellipse(lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 16}, {16, -14}}, endAngle = 360),         
        Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name")
    }));
end PoseMux;
