within StewartPlatform.Components;

model UniversalJoint "Universal joint with additional fixed rotation"
  extends StewartPlatform.Icons.UniversalJoint; // Icon

// Parameters
  parameter StewartPlatform.Types.UniversalJointParameters universalJointParameters "Parameters of the universal joint";

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Base" annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Leg" annotation (Placement(transformation(extent={{84,-16},{116,16}})));

  Modelica.Mechanics.MultiBody.Joints.Universal 
    universal(       
      stateSelect = universalJointParameters.stateSelect,
      phi_a(fixed = universalJointParameters.initialAnglesFixed, start = universalJointParameters.angles[1]), 
      phi_b(fixed = universalJointParameters.initialAnglesFixed, start = universalJointParameters.angles[2]),
      w_a(fixed = universalJointParameters.initialAngularVelFixed, start = 0), 
      w_b(fixed = universalJointParameters.initialAngularVelFixed, start = 0),
      a_a(fixed = universalJointParameters.initialAngularAccFixed, start = 0),
      a_b(fixed = universalJointParameters.initialAngularAccFixed, start = 0),
      cylinderDiameter= universalJointParameters.cylinderDiameter,
      cylinderLength= universalJointParameters.cylinderLength)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    
  Modelica.Mechanics.MultiBody.Parts.FixedRotation 
    fixedRotation(
      animation=false,
      n={0,0,1},
      angle=to_deg(universalJointParameters.alpha))
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      
equation
  connect(frame_a, fixedRotation.frame_a) annotation (Line(points={{-100,0},{-60,0}},color={95,95,95},thickness=0.5));
  connect(fixedRotation.frame_b, universal.frame_a) annotation (Line(points={{-40,0},{-10,0}},color={95,95,95},thickness=0.5));
  connect(universal.frame_b, frame_b) annotation (Line(points={{10,0},{100,0}},color={95,95,95},thickness=0.5));
  
end UniversalJoint;
