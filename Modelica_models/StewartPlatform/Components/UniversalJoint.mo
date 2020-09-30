within StewartPlatform.Components;

model UniversalJoint "Universal joint with additional fixed rotation"
    extends StewartPlatform.Icons.UniversalJoint;

// Parameters
  parameter SI.Angle alpha = 0 "Orientation of the universal joint: fix rotation around z-axis from frame_a";
  parameter SI.Angle angles[2] = {0, 0} "Initial rotation angles around x-axis and the new y-axis";
  parameter StateSelect uj_stateSelect = StateSelect.prefer "Priority to use joint coordinates and relative derivatives (phi_a, phi_b, w_a, w_b) as states";
  parameter Boolean uj_initialAnglesFixed = false "=true, if you want to use joint angles as initial eqation ('fixed' attributes)" 
    annotation (Dialog(group="Initialization"), choices(checkBox=true));
  parameter Boolean uj_initialAngularVelFixed = false "=true, if you want to use angular velocities (=0) of the joint as initial eqation ('fixed' attributes)"
    annotation (Dialog(group="Initialization"), choices(checkBox=true));
  parameter Boolean uj_initialAngularAccFixed = false "=true, if you want to use angular accelerations (=0) of the joint as initial eqatio ('fixed' attributes)"
    annotation (Dialog(group="Initialization"), choices(checkBox=true));

// Animation
  parameter SI.Distance cylinderLength=1/10 "Length of cylinders representing the universal joint"
    annotation (Dialog(group="Animation"));
  parameter SI.Distance cylinderDiameter=1/20 "Diameter of cylinders representing the universal joint"
    annotation (Dialog(group="Animation"));

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque"
    annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Mechanics.MultiBody.Joints.Universal 
    universal(       
      stateSelect = uj_stateSelect,
      phi_a(fixed = uj_initialAnglesFixed, start = angles[1]), 
      phi_b(fixed = uj_initialAnglesFixed, start = angles[2]),
      w_a(fixed = uj_initialAngularVelFixed, start = 0), 
      w_b(fixed = uj_initialAngularVelFixed, start = 0),
      a_a(fixed = uj_initialAngularAccFixed, start = 0),
      a_b(fixed = uj_initialAngularAccFixed, start = 0),
      cylinderDiameter=cylinderDiameter,
      cylinderLength=cylinderLength)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation 
    fixedRotation(
      animation=false,
      n={0,0,1},
      angle=to_deg(alpha))
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      
equation
  connect(frame_a, fixedRotation.frame_a) annotation (Line(
      points={{-100,0},{-60,0}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedRotation.frame_b, universal.frame_a) annotation (Line(
      points={{-40,0},{-10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(universal.frame_b, frame_b) annotation (Line(
      points={{10,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  
end UniversalJoint;
