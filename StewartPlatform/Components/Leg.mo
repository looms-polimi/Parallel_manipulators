within StewartPlatform.Components;

model Leg "Six-degree-of-freedom leg with electric cylinder and servo motor"
  extends StewartPlatform.Icons.Leg;

// Imports
  import Modelica.Blocks.Types.Init;

// Universal joint
    parameter SI.Angle alpha=0 "Orientation of the universal joint: rotation around z-axis from frame_a" annotation (Dialog(group="Universal joint"));
    parameter SI.Angle angles[2] = {0,0} "Initial rotation angles around x-axis and the new y-axis" annotation (Dialog(group="Universal joint"));
    
    parameter StateSelect uj_stateSelect = StateSelect.prefer "Priority to use universal joint coordinates (phi_a, phi_b, w_a, w_b) as states"
      annotation (Dialog(group="Universal joint"));
    parameter Boolean uj_initialAnglesFixed = false "=true, if you want to use universal joint angles as initial eqation ('fixed' attributes)" 
      annotation (Dialog(group="Universal joint"), choices(checkBox=true));
    parameter Boolean uj_initialAngularVelFixed = false "=true, if you want to use universal joint angular velocities (=0) of the joint as initial eqation ('fixed' attributes)"
      annotation (Dialog(group="Universal joint"), choices(checkBox=true));
    parameter Boolean uj_initialAngularAccFixed = false "=true, if you want to use universal joint angular accelerations (=0) of the joint as initial eqatio ('fixed' attributes)"
      annotation (Dialog(group="Universal joint"), choices(checkBox=true));

// Electric Cylinder
    parameter Types.ElectricCylinderParameters ECparameters "Electric cylinder parameters" annotation (Dialog(group="Electric cylinder"));

    parameter StateSelect ec_stateSelect = StateSelect.prefer "Priority to use electric cylinder total length and its derivative (velocity) as states"annotation (Dialog(group="Electric cylinder"));

    parameter SI.Length 
      ec_initialLength(
        min=ECparameters.boxLength+ECparameters.minPistonLength,
        max=ECparameters.boxLength+ECparameters.minPistonLength+ECparameters.workingStroke)=
      ECparameters.boxLength+ECparameters.minPistonLength+ECparameters.workingStroke/2
      "Initial total length, distance between frame_a and frame_b"
      annotation (Dialog(group="Electric cylinder"));
    parameter Boolean ec_initialLengthFixed = false "=true, if you want to use the initial length (=initialLength) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Electric cylinder"),choices(checkBox=true));
    parameter Boolean ec_initialVelFixed = false "=true, if you want to use the initial velocity (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Electric cylinder"),choices(checkBox=true));
    parameter Boolean ec_initialAccFixed = false "=true, if you want to use the initial acceleration (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Electric cylinder"),choices(checkBox=true));

// Servo Motor
    parameter StewartPlatform.Types.ServoMotorParameters SMparameters annotation (Dialog(group="Servo motor"));
    parameter SI.Torque sm_initialTorque = 0 "Initial torque applied by the motor" annotation (Dialog(group="Servo motor"));
    parameter Boolean sm_initialTorqueFixed = false "=true, if you want to use initial torque as initial eqation ('fixed' attributes)" annotation (choices(checkBox=true), Dialog(group="Servo motor"));
    parameter Init sm_initType = Init.NoInit "Type of initialization of servo motor's internal control (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true, Dialog(group="Servo motor"));

// Spherical joint
    parameter Boolean sj_EnforceStates = false "=true, if the variables of the spherical joint have priority to be selected as states" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    parameter Boolean sj_useQuaternions = false "= true, if quaternions shall be used as states otherwise use 3 angles as states (provided sj_enforceStates=true)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    parameter Boolean sj_initialAngularVelFixed = false "=true, if you want to use angular velocities (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    parameter Boolean sj_initialAngularAccFixed = false "=true, if you want to use angular accelerations (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));

// Animation
    parameter SI.Diameter sphereDiameter(displayUnit = "mm") = 1/16 "Diameter of sphere representing the spherical joint" annotation (Dialog(group="Animation"));
    parameter SI.Distance cylinderLength(displayUnit = "mm") = 1/10 "Length of cylinders representing the universal joint" annotation (Dialog(group="Animation"));
    parameter SI.Distance cylinderDiameter(displayUnit = "mm") = 1/20 "Diameter of cylinders representing the universal joint" annotation (Dialog(group="Animation"));

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Frame for connection with a base's joint frame" annotation (Placement(transformation(extent={{-140,-16},{-108,16}}), iconTransformation(extent={{-172,-16},{-140,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Frame for connection with a platform's joint frame" annotation (Placement(transformation(extent={{92,-16},{124,16}}), iconTransformation(extent={{122,-16},{154,16}})));

  ElectricCylinder 
    electricCylinder(
      ECparameters=ECparameters,
      pj_stateSelect=ec_stateSelect, 
      pj_initialLength=ec_initialLength,
      pj_initialLengthFixed=ec_initialLengthFixed,  
      pj_initialVelFixed=ec_initialVelFixed,
      pj_initialAccFixed=ec_initialAccFixed)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));

  UniversalJoint 
    universalJoint(
      alpha=alpha,
      angles=angles,
      uj_stateSelect=uj_stateSelect,      
      uj_initialAnglesFixed=uj_initialAnglesFixed,
      uj_initialAngularVelFixed=uj_initialAngularVelFixed,
      uj_initialAngularAccFixed=uj_initialAngularAccFixed,
      cylinderLength=cylinderLength,
      cylinderDiameter=cylinderDiameter)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  SimpleServoMotor 
    simpleServoMotor(
        SMparameters = SMparameters,
        sm_initialTorque=sm_initialTorque,
        sm_initialTorqueFixed=sm_initialTorqueFixed,
        sm_initType=sm_initType) 
    annotation(Placement(visible = true, transformation(extent = {{-34, 18}, {-14, 38}}, rotation = 0)));

  Modelica.Mechanics.MultiBody.Joints.Spherical 
    spherical(
      enforceStates=sj_EnforceStates,
      useQuaternions=sj_useQuaternions,
      w_rel_a_fixed = sj_initialAngularVelFixed,
      z_rel_a_fixed = sj_initialAngularAccFixed,
      sphereDiameter=sphereDiameter)
    annotation (Placement(transformation(extent={{42,-10},{62,10}})));
  
  Interfaces.AxisControlBus axisControlBus 
    annotation (Placement(transformation(extent={{-110,56},{-90,76}}), iconTransformation(
        extent={{-19,19},{19,-19}},
        rotation=90,
        origin={-101,65})));
    
equation
  connect(frame_a, universalJoint.frame_a) annotation(
    Line(points = {{-124, 0}, {-60, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(universalJoint.frame_b, electricCylinder.frame_a) annotation(
    Line(points = {{-40, 0}, {-8, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(electricCylinder.frame_b, spherical.frame_a) annotation(
    Line(points = {{12, 0}, {42, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(spherical.frame_b, frame_b) annotation(
    Line(points = {{62, 0}, {108, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(simpleServoMotor.flange, electricCylinder.flange_a) annotation(
    Line(points = {{-14, 28}, {-14, 6.6}, {-8, 6.6}}));
  connect(axisControlBus, simpleServoMotor.axisControlBus) annotation(
    Line(points = {{-100, 66}, {-60, 66}, {-60, 28.4}, {-29.8, 28.4}}, color = {255, 204, 51}, thickness = 0.5));
end Leg;
