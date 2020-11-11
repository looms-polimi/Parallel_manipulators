within StewartPlatform.Icons;

model PoseMux "Icon for 'PoseMux' model"
    annotation (Icon(graphics={Rectangle(lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}),
        Line(origin = {100, 0}, points = {{-92, 0}, {2, 0}}, color = {135, 135, 135}),
        Line(origin = {0.336538, 0}, points = {{-92, 50}, {-68, 50}, {4, 6}}, color = {0, 127, 0}),
        Line(points = {{-90, -40}, {-66, -40}, {4, -4}}, color = {255, 0, 0}),
        Ellipse(lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-14, 16}, {16, -14}}, endAngle = 360),         
        Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name"), Line(origin = {49.79, -40.79}, points = {{-139.793, -29.207}, {-117.793, -29.207}, {-47.793, 28.793}, {-47.793, 28.793}}, color = {255, 85, 255}), Line(origin = {51.8, 46.8}, points = {{-141.795, 33.2047}, {-119.795, 33.2047}, {-45.7953, -32.7953}}, color = {0, 170, 255}), Line(origin = {32.9211, 32.4559}, points = {{-123.861, -11.861}, {-99.861, -11.861}, {-43.861, -25.861}})
    }));
          
end PoseMux;
