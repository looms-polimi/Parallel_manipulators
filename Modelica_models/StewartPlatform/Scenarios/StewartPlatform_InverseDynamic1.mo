within StewartPlatform.Scenarios;

model StewartPlatform_InverseDynamic1
  extends StewartPlatform.Icons.Scenario;
  // Icon
  inner StewartPlatform.Components.GlobalParameters gp annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(origin = {-40, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.Platform platform(basePos = {1, 0, 0}, useGlobalParameters = false)  annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  StewartPlatform.Components.Base base(basePos = {1, 0, 0}, useGlobalParameters = false)  annotation(
    Placement(visible = true, transformation(origin = {-40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.SixLegs sixLegs annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.Controller controller annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.ReferenceSignals.LinearTrajectory linearTrajectory(angles_stop = {20, 20, 20}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, stopPosition = {0, 0, 1.60}) annotation(
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  StewartPlatform.Components.Platform platform1 annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  StewartPlatform.Components.Base base1 annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Components.SixLegs_invDyn sixLegs_invDyn annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  
equation
  connect(platform.frame_b, sixLegs.frame_platform) annotation(
    Line(points = {{-40, 25.2}, {-40, 25.2}, {-40, 19.2}, {-40, 19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base.frame_b, sixLegs.frame_base) annotation(
    Line(points = {{-40, -25.2}, {-40, -25.2}, {-40, -19.2}, {-40, -19.2}}, color = {95, 95, 95}, thickness = 0.5));
  connect(controller.controlBus, sixLegs.controlBus) annotation(
    Line(points = {{-80, -0.2}, {-60, -0.2}}, color = {255, 204, 51}, thickness = 0.5));
  
  connect(linearTrajectory.pose, controller.inputPose) annotation(
    Line(points = {{-121, 0}, {-101, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sixLegs_invDyn.frame_platform, platform1.frame_b) annotation(
    Line(points = {{40, 20}, {40, 20}, {40, 26}, {40, 26}}, color = {95, 95, 95}, thickness = 0.5));
  connect(base1.frame_b, sixLegs_invDyn.frame_base) annotation(
    Line(points = {{40, -26}, {40, -26}, {40, -20}, {40, -20}}, color = {95, 95, 95}, thickness = 0.5));
//input

 sixLegs_invDyn.controlBus.axisControlBus1.angularPos = sixLegs.controlBus.axisControlBus1.angularPos;
 sixLegs_invDyn.controlBus.axisControlBus1.angularVel = sixLegs.controlBus.axisControlBus1.angularVel;
 sixLegs_invDyn.controlBus.axisControlBus1.angularAcc = sixLegs.controlBus.axisControlBus1.angularAcc;
 
 sixLegs_invDyn.controlBus.axisControlBus2.angularPos = sixLegs.controlBus.axisControlBus2.angularPos;
 sixLegs_invDyn.controlBus.axisControlBus2.angularVel = sixLegs.controlBus.axisControlBus2.angularVel;
 sixLegs_invDyn.controlBus.axisControlBus2.angularAcc = sixLegs.controlBus.axisControlBus2.angularAcc;

 sixLegs_invDyn.controlBus.axisControlBus3.angularPos = sixLegs.controlBus.axisControlBus3.angularPos;
 sixLegs_invDyn.controlBus.axisControlBus3.angularVel = sixLegs.controlBus.axisControlBus3.angularVel;
 sixLegs_invDyn.controlBus.axisControlBus3.angularAcc = sixLegs.controlBus.axisControlBus3.angularAcc;

 sixLegs_invDyn.controlBus.axisControlBus4.angularPos = sixLegs.controlBus.axisControlBus4.angularPos;
 sixLegs_invDyn.controlBus.axisControlBus4.angularVel = sixLegs.controlBus.axisControlBus4.angularVel;
 sixLegs_invDyn.controlBus.axisControlBus4.angularAcc = sixLegs.controlBus.axisControlBus4.angularAcc;
 
 sixLegs_invDyn.controlBus.axisControlBus5.angularPos = sixLegs.controlBus.axisControlBus5.angularPos;
 sixLegs_invDyn.controlBus.axisControlBus5.angularVel = sixLegs.controlBus.axisControlBus5.angularVel;
 sixLegs_invDyn.controlBus.axisControlBus5.angularAcc = sixLegs.controlBus.axisControlBus5.angularAcc;

 sixLegs_invDyn.controlBus.axisControlBus6.angularPos = sixLegs.controlBus.axisControlBus6.angularPos;
 sixLegs_invDyn.controlBus.axisControlBus6.angularVel = sixLegs.controlBus.axisControlBus6.angularVel;
 sixLegs_invDyn.controlBus.axisControlBus6.angularAcc = sixLegs.controlBus.axisControlBus6.angularAcc;
 /*
 sixLegs_invDyn.controlBus.axisControlBus1.refTorque = 0;
 sixLegs_invDyn.controlBus.axisControlBus2.refTorque = 0;
 sixLegs_invDyn.controlBus.axisControlBus3.refTorque = 0;
 sixLegs_invDyn.controlBus.axisControlBus4.refTorque = 0;
 sixLegs_invDyn.controlBus.axisControlBus5.refTorque = 0;
 sixLegs_invDyn.controlBus.axisControlBus6.refTorque = 0;
 */
   
end StewartPlatform_InverseDynamic1;
