within StewartPlatform.Tests;

model simplifiedModel_test2
  // Imports
  import StewartPlatform.Functions.*;
  // Universal joints
  parameter SI.Angle alpha[6] = {0, 0, 0, 0, 0, 0} "Universal joints orientation" annotation(
    Dialog(group = "Universal joints"));
  StewartPlatform.Components.Platform platform(_enforceStates = true,fixInitOrientation = true, fixInitPosition = true, initPosition = {0, 0, 1.45}, useGlobalParameters = true)  annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 80}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  StewartPlatform.Components.Base base(useGlobalParameters = true)  annotation(
    Placement(visible = true, transformation(origin = {0, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0, 0, 1}, s(fixed = true, start = initialLength[1]), stateSelect = StateSelect.never, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(n = {0, 0, 1}, s(fixed = true, start = initialLength[2]), stateSelect = StateSelect.never, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic3(n = {0, 0, 1}, s(fixed = true, start = initialLength[3]), stateSelect = StateSelect.never, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic4(n = {0, 0, 1}, s(fixed = true, start = initialLength[4]), stateSelect = StateSelect.never, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic5(n = {0, 0, 1}, s(fixed = true, start = initialLength[5]), stateSelect = StateSelect.never, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic6(n = {0, 0, 1}, s(fixed = true, start = initialLength[6]), stateSelect = StateSelect.never, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Universal universal1(phi_a(start = ujangles[1, 1]), phi_b(start = ujangles[1, 2]), stateSelect = StateSelect.never) annotation(
    Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Universal universal2(phi_a(start = ujangles[2, 1]), phi_b(start = ujangles[2, 2]), stateSelect = StateSelect.never) annotation(
    Placement(visible = true, transformation(origin = {-40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Universal universal3(phi_a(start = ujangles[3, 1]), phi_b(start = ujangles[3, 2]), stateSelect = StateSelect.never) annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Universal universal4(phi_a(start = ujangles[4, 1]), phi_b(start = ujangles[4, 2]), stateSelect = StateSelect.never) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Universal universal5(phi_a(start = ujangles[5, 1]), phi_b(start = ujangles[5, 2]), stateSelect = StateSelect.never) annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Universal universal6(phi_a(start = ujangles[6, 1]), phi_b(start = ujangles[6, 2]), stateSelect = StateSelect.never) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical1(enforceStates = false, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical2(enforceStates = false, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical3(enforceStates = false, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical4(enforceStates = false, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical5(enforceStates = false, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Spherical spherical6(enforceStates = false, useQuaternions = false) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Position position1(f_crit = 300, useSupport = false) annotation(
    Placement(visible = true, transformation(extent = {{-120, 40}, {-100, 60}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position2(f_crit = 300, useSupport = false) annotation(
    Placement(visible = true, transformation(extent = {{-120, 22}, {-100, 42}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position3(f_crit = 300, useSupport = false) annotation(
    Placement(visible = true, transformation(extent = {{-120, 0}, {-100, 20}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position4(f_crit = 300, useSupport = false) annotation(
    Placement(visible = true, transformation(extent = {{-120, -18}, {-100, 2}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position5(f_crit = 300, useSupport = false) annotation(
    Placement(visible = true, transformation(extent = {{-120, -38}, {-100, -18}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sources.Position position6(f_crit = 300, useSupport = false) annotation(
    Placement(visible = true, transformation(extent = {{-120, -60}, {-100, -40}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(n = {0, 0, -1}) annotation(
    Placement(visible = true, transformation(origin = {-94, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.05, y_start = 1.45) annotation(
    Placement(visible = true, transformation(extent = {{-156, 4}, {-136, 24}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1.45) annotation(
    Placement(visible = true, transformation(origin = {-190, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.2, f = 1, offset = 1.47333, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-190, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner StewartPlatform.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {80, 96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  final parameter Real leg[6, 3] = legsDirections(base.base, platform.platform, platform.initPosition, {1, 2, 3}, platform.initAngles, true) "Initial legs direction resolved in base frame";
  final parameter SI.Length initialLength[6] = legsLength(base.base, platform.platform, platform.initPosition, {1, 2, 3}, platform.initAngles) "Initial legs length";
  final parameter SI.Angle ujangles[6, 2] = {ujAngles(leg[i], alpha[i]) for i in 1:6} "Initial rotation angles of the universal joints";
equation
  connect(base.frame_b[1], universal1.frame_a) annotation(
    Line(points = {{0, -66}, {-70, -66}, {-70, -40}, {-70, -40}}, color = {95, 95, 95}));
  connect(base.frame_b[2], universal2.frame_a) annotation(
    Line(points = {{0, -66}, {-40, -66}, {-40, -40}, {-40, -40}}, color = {95, 95, 95}));
  connect(base.frame_b[3], universal3.frame_a) annotation(
    Line(points = {{0, -66}, {-10, -66}, {-10, -40}, {-10, -40}}, color = {95, 95, 95}));
  connect(base.frame_b[4], universal4.frame_a) annotation(
    Line(points = {{0, -66}, {10, -66}, {10, -40}, {10, -40}}, color = {95, 95, 95}));
  connect(base.frame_b[5], universal5.frame_a) annotation(
    Line(points = {{0, -66}, {40, -66}, {40, -40}, {40, -40}}, color = {95, 95, 95}));
  connect(base.frame_b[6], universal6.frame_a) annotation(
    Line(points = {{0, -66}, {70, -66}, {70, -40}, {70, -40}}, color = {95, 95, 95}));
//
  connect(universal1.frame_b, prismatic1.frame_a) annotation(
    Line(points = {{-70, -20}, {-70, -20}, {-70, 0}, {-70, 0}}));
  connect(universal2.frame_b, prismatic2.frame_a) annotation(
    Line(points = {{-40, -20}, {-40, -20}, {-40, 0}, {-40, 0}}));
  connect(universal3.frame_b, prismatic3.frame_a) annotation(
    Line(points = {{-10, -20}, {-10, -20}, {-10, 0}, {-10, 0}}, color = {95, 95, 95}));
  connect(universal4.frame_b, prismatic4.frame_a) annotation(
    Line(points = {{10, -20}, {10, -20}, {10, 0}, {10, 0}}));
  connect(universal5.frame_b, prismatic5.frame_a) annotation(
    Line(points = {{40, -20}, {40, -20}, {40, 0}, {40, 0}}));
  connect(universal6.frame_b, prismatic6.frame_a) annotation(
    Line(points = {{70, -20}, {70, -20}, {70, 0}, {70, 0}}));
//
  connect(prismatic1.frame_b, spherical1.frame_a) annotation(
    Line(points = {{-70, 20}, {-70, 20}, {-70, 40}, {-70, 40}}));
  connect(prismatic2.frame_b, spherical2.frame_a) annotation(
    Line(points = {{-40, 20}, {-40, 20}, {-40, 40}, {-40, 40}}));
  connect(prismatic3.frame_b, spherical3.frame_a) annotation(
    Line(points = {{-10, 20}, {-10, 20}, {-10, 40}, {-10, 40}}, color = {95, 95, 95}));
  connect(prismatic4.frame_b, spherical4.frame_a) annotation(
    Line(points = {{10, 20}, {10, 20}, {10, 40}, {10, 40}}));
  connect(prismatic5.frame_b, spherical5.frame_a) annotation(
    Line(points = {{40, 20}, {40, 20}, {40, 40}, {40, 40}}));
  connect(prismatic6.frame_b, spherical6.frame_a) annotation(
    Line(points = {{70, 20}, {70, 20}, {70, 40}, {70, 40}}, color = {95, 95, 95}));
//
  connect(platform.frame_b[1], spherical1.frame_b) annotation(
    Line(points = {{0, 66}, {-70, 66}, {-70, 60}, {-70, 60}}, color = {95, 95, 95}));
  connect(platform.frame_b[2], spherical2.frame_b) annotation(
    Line(points = {{0, 66}, {-40, 66}, {-40, 60}, {-40, 60}}, color = {95, 95, 95}));
  connect(platform.frame_b[3], spherical3.frame_b) annotation(
    Line(points = {{0, 66}, {-10, 66}, {-10, 60}, {-10, 60}}, color = {95, 95, 95}));
  connect(platform.frame_b[4], spherical4.frame_b) annotation(
    Line(points = {{0, 66}, {10, 66}, {10, 60}, {10, 60}}, color = {95, 95, 95}));
  connect(platform.frame_b[5], spherical5.frame_b) annotation(
    Line(points = {{0, 66}, {40, 66}, {40, 60}, {40, 60}}, color = {95, 95, 95}));
  connect(platform.frame_b[6], spherical6.frame_b) annotation(
    Line(points = {{0, 66}, {70, 66}, {70, 60}, {70, 60}}, color = {95, 95, 95}));
//
  connect(position1.flange, prismatic1.axis);
  connect(position2.flange, prismatic2.axis);
  connect(position3.flange, prismatic3.axis);
  connect(position4.flange, prismatic4.axis);
  connect(position5.flange, prismatic5.axis);
  connect(position6.flange, prismatic6.axis);
//
  connect(firstOrder.y, position1.s_ref);
  connect(firstOrder.y, position2.s_ref);
  connect(firstOrder.y, position3.s_ref);
  connect(firstOrder.y, position4.s_ref);
  connect(firstOrder.y, position5.s_ref);
  connect(firstOrder.y, position6.s_ref);
  connect(sine.y, firstOrder.u) annotation(
    Line(points = {{-178, 12}, {-160, 12}, {-160, 14}, {-158, 14}, {-158, 14}}, color = {0, 0, 127}));
//
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-06, Interval = 0.01));
end simplifiedModel_test2;
