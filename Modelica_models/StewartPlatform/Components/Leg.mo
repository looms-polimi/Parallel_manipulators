within StewartPlatform.Components;

model Leg "Six-degree-of-freedom leg with electric cylinder and servo motor"
  extends StewartPlatform.Icons.Leg; // Icon

// Imports
  import StewartPlatform.Types.*;

// Parameters
    // Universal joint
    parameter UniversalJointParameters universalJointParameters "Parameters of the universal joint" annotation (Dialog(group="Universal joint"));

    // Electric Cylinder
    parameter ElectricCylinderParameters electricCylinderParameters "Parameters of the electric cylinder" annotation (Dialog(group="Electric cylinder"));

    // Servo Motor
    parameter ServoMotorParameters servoMotorParameters "Parameters of the servo motor" annotation (Dialog(group="Servo motor"));

    // Spherical joint
    parameter SphericalJointParameters sphericalJointParameters "Parameters of the spherical joint" annotation (Dialog(group="Spherical joint"));

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Frame for connection with a base's joint frame" annotation (Placement(transformation(extent={{-140,-16},{-108,16}}), iconTransformation(extent={{-172,-16},{-140,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Frame for connection with a platform's joint frame" annotation (Placement(transformation(extent={{92,-16},{124,16}}), iconTransformation(extent={{122,-16},{154,16}})));

  ElectricCylinder electricCylinder(electricCylinderParameters=electricCylinderParameters) annotation (Placement(transformation(extent={{-8,-10},{12,10}})));

  UniversalJoint universalJoint(universalJointParameters = universalJointParameters) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  ServoMotor servoMotor(servoMotorParameters = servoMotorParameters) annotation(Placement(visible = true, transformation(extent = {{-34, 18}, {-14, 38}}, rotation = 0)));

  SphericalJoint sphericalJoint(sphericalJointParameters=sphericalJointParameters) annotation (Placement(transformation(extent={{42,-10},{62,10}})));
  
  StewartPlatform.Interfaces.AxisControlBus axisControlBus annotation (Placement(transformation(extent={{-110,56},{-90,76}}), iconTransformation(extent={{-19,19},{19,-19}},rotation=90,origin={-101,65})));
    
equation
  connect(frame_a, universalJoint.frame_a) annotation(Line(points = {{-124, 0}, {-60, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(universalJoint.frame_b, electricCylinder.frame_a) annotation(Line(points = {{-40, 0}, {-8, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(electricCylinder.frame_b, sphericalJoint.frame_a) annotation(Line(points = {{12, 0}, {42, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(sphericalJoint.frame_b, frame_b) annotation(Line(points = {{62, 0}, {108, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(servoMotor.flange, electricCylinder.flange_a) annotation(Line(points = {{-14, 28}, {-14, 6.6}, {-8, 6.6}}));
  connect(axisControlBus, servoMotor.axisControlBus) annotation(Line(points = {{-100, 66}, {-60, 66}, {-60, 28.4}, {-29.8, 28.4}}, color = {255, 204, 51}, thickness = 0.5));
end Leg;
