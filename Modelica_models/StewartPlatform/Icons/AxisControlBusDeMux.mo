within StewartPlatform.Icons;

model AxisControlBusDeMux "Icon for 'AxisControlBusDeMux' model"
    annotation (Icon(graphics={Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 205}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}),
        Line(
          points={{-92,0},{2,0}},
          color={135,135,135}),
        Line(origin = {0.336538, 0}, points = {{98, 50}, {60, 50}, {4, 6}}, color = {0, 127, 0}),
        Line(points = {{98, -40}, {62, -40}, {4, -4}}, color = {255, 0, 0}),
        Ellipse(lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 16}, {16, -14}}, endAngle = 360),         
        Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Line(origin = {49.79, -40.79}, points = {{48.207, -29.207}, {12.207, -29.207}, {-47.793, 28.793}, {-47.793, 28.793}}, color = {255, 85, 255}), Line(origin = {51.8, 46.8}, points = {{46.2047, 33.2047}, {10.2047, 33.2047}, {-45.7953, -32.7953}}, color = {0, 170, 255}), Line(origin = {51.861, 9.86096}, points = {{46.139, 10.139}, {10.139, 10.139}, {-35.861, -5.86096}})
    }));
end AxisControlBusDeMux;
