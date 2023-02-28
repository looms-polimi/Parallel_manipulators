within StewartPlatform.Tests;

model Package_Interfaces_test
  StewartPlatform.Interfaces.Pose pose annotation(
    Placement(visible = true, transformation(origin = {-22, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant position[3](k = {1.1, 2.2, 3.3})  annotation(
    Placement(visible = true, transformation(origin = {-110, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant sequence[3](k = {1, 2, 3}) annotation(
    Placement(visible = true, transformation(origin = {-110, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant orientation[3](k = {11, 22, 33}) annotation(
    Placement(visible = true, transformation(origin = {-110, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant startTime(k = 101)  annotation(
    Placement(visible = true, transformation(origin = {-110, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant stopTime(k = 202) annotation(
    Placement(visible = true, transformation(origin = {-110, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.PoseDeMux poseDeMux annotation(
    Placement(visible = true, transformation(origin = {28, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.PoseMux poseMux annotation(
    Placement(visible = true, transformation(origin = {-172, 54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  StewartPlatform.Interfaces.Pose pose1 annotation(
    Placement(visible = true, transformation(origin = {-206, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {2, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(position.y, pose.position) annotation(
    Line(points = {{-99, 46}, {-22, 46}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sequence.y, pose.sequence) annotation(
    Line(points = {{-99, 12}, {-20, 12}, {-20, 46}, {-22, 46}}, color = {0, 0, 127}, thickness = 0.5));
  connect(orientation.y, pose.orientation) annotation(
    Line(points = {{-99, -22}, {-24, -22}, {-24, 46}, {-22, 46}}, color = {0, 0, 127}, thickness = 0.5));
  connect(stopTime.y, pose.stopTime) annotation(
    Line(points = {{-99, 78}, {-41.5, 78}, {-41.5, 46}, {-22, 46}}, color = {0, 0, 127}));
  connect(startTime.y, pose.startTime) annotation(
    Line(points = {{-99, 110}, {-26, 110}, {-26, 46}, {-22, 46}}, color = {0, 0, 127}));
  connect(poseDeMux.poseIn, pose) annotation(
    Line(points = {{19, 46}, {-22, 46}}, thickness = 0.5));
  connect(position.y, poseMux.positionIn) annotation(
    Line(points = {{-98, 46}, {-134, 46}, {-134, 62}, {-162, 62}, {-162, 62}}, color = {0, 0, 127}, thickness = 0.5));
  connect(orientation.y, poseMux.orientationIn) annotation(
    Line(points = {{-98, -22}, {-138, -22}, {-138, 56}, {-162, 56}, {-162, 56}}, color = {0, 0, 127}, thickness = 0.5));
  connect(startTime.y, poseMux.startTimeIn) annotation(
    Line(points = {{-98, 110}, {-140, 110}, {-140, 50}, {-162, 50}, {-162, 50}}, color = {0, 0, 127}));
  connect(stopTime.y, poseMux.stopTimeIn) annotation(
    Line(points = {{-98, 78}, {-148, 78}, {-148, 46}, {-162, 46}, {-162, 48}}, color = {0, 0, 127}));
  connect(poseMux.poseOut, pose1) annotation(
    Line(points = {{-180, 54}, {-210, 54}, {-210, 54}, {-206, 54}}, thickness = 0.5));
protected
end Package_Interfaces_test;
