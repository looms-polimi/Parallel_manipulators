within DeltaRobot.Components;

model SphericalJoint "Model of a spherical joint"
  extends DeltaRobot.Icons.SphericalJoint; // Icon

// Parameters
  parameter DeltaRobot.Types.SphericalJointParameters sphericalJointParameters "Parameters of the spherical joint";

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));

  Modelica.Mechanics.MultiBody.Joints.Spherical spherical(
    enforceStates = sphericalJointParameters.enforceStates, 
    sphereDiameter = sphericalJointParameters.sphereDiameter, 
    useQuaternions = sphericalJointParameters.useQuaternions, 
    w_rel_a_fixed = sphericalJointParameters.initialAngularVelFixed, 
    z_rel_a_fixed = sphericalJointParameters.initialAngularAccFixed)  
    annotation(Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(frame_a, spherical.frame_a) annotation(Line(points = {{-100, 0}, {-12, 0}, {-12, 0}, {-10, 0}}));
  connect(spherical.frame_b, frame_b) annotation(Line(points = {{10, 0}, {98, 0}, {98, 0}, {100, 0}}));
end SphericalJoint;
