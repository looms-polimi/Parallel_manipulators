within StewartPlatform.Components;

model Leg_invDyn2 "Leg model for inverse dynamic"
  extends StewartPlatform.Icons.Leg_invDyn; // Icon

// Imports
  import StewartPlatform.Types.*;

// Parameters
    // Universal joint
    parameter UniversalJointParameters universalJointParameters "Parameters of the universal joint" annotation (Dialog(group="Universal joint"));

    // Electric Cylinder
    parameter ElectricCylinderParameters electricCylinderParameters "Parameters of the electric cylinder" annotation (Dialog(group="Electric cylinder"));

    // Spherical joint
    parameter SphericalJointParameters sphericalJointParameters "Parameters of the spherical joint" annotation (Dialog(group="Spherical joint"));

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Frame for connection with a base's joint frame" annotation (Placement(transformation(extent={{-140,-16},{-108,16}}), iconTransformation(extent={{-172,-16},{-140,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Frame for connection with a platform's joint frame" annotation (Placement(transformation(extent={{92,-16},{124,16}}), iconTransformation(extent={{122,-16},{154,16}})));

  ElectricCylinder electricCylinder(electricCylinderParameters=electricCylinderParameters) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));

  UniversalJoint universalJoint(universalJointParameters = universalJointParameters) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  ServoMotor_invDyn2 servoMotor annotation(Placement(visible = true, transformation(extent = {{-34, 18}, {-14, 38}}, rotation = 0)));

  SphericalJoint sphericalJoint(sphericalJointParameters=sphericalJointParameters) annotation (Placement(transformation(extent={{42,-10},{62,10}})));
  Modelica.Blocks.Interfaces.RealInput angularPos annotation(
    Placement(visible = true, transformation(origin = {60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput AngularAcc annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput angularVel annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealOutput appliedTorque annotation(
    Placement(visible = true, transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(frame_a, universalJoint.frame_a) annotation(Line(points = {{-124, 0}, {-60, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(universalJoint.frame_b, electricCylinder.frame_a) annotation(Line(points = {{-40, 0}, {-8, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(electricCylinder.frame_b, sphericalJoint.frame_a) annotation(Line(points = {{12, 0}, {42, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sphericalJoint.frame_b, frame_b) annotation(Line(points = {{62, 0}, {108, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(servoMotor.flange, electricCylinder.flange_a) annotation(Line(points = {{-14, 28}, {-14, 6.6}, {-8, 6.6}}));
  connect(angularPos, servoMotor.angularPos) annotation(
    Line(points = {{60, 120}, {60, 50}, {-40, 50}, {-40, 36}, {-36, 36}}, color = {0, 0, 127}));
  connect(angularVel, servoMotor.angularVel) annotation(
    Line(points = {{0, 120}, {0, 60}, {-50, 60}, {-50, 32}, {-36, 32}}, color = {0, 0, 127}));
  connect(AngularAcc, servoMotor.AngularAcc) annotation(
    Line(points = {{-60, 120}, {-60, 28}, {-36, 28}}, color = {0, 0, 127}));
  connect(servoMotor.appliedTorque, appliedTorque) annotation(
    Line(points = {{-34, 22}, {-80, 22}, {-80, -80}, {0, -80}, {0, -110}}, color = {0, 0, 127}));
end Leg_invDyn2;
