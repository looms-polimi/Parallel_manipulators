within StewartPlatform.Components;

partial model PartialElectricCylinder "Partial model of an electric cylinder"

// Parameters
  parameter Types.ElectricCylinderParameters ECparameters "Electric cylinder parameters";
  parameter StateSelect pj_stateSelect = StateSelect.prefer "Priority to use cylinder total length and its derivative (velocity) as states (prismatic joint)";

// Initialization
  parameter SI.Length 
    pj_initialLength(
      min=ECparameters.boxLength+ECparameters.minPistonLength,
      max=ECparameters.boxLength+ECparameters.minPistonLength+ECparameters.workingStroke)
        = ECparameters.boxLength+ECparameters.minPistonLength+ECparameters.workingStroke/2
    "Initial length, distance between frame_a and frame_b" annotation (Dialog(group="Initialization"));
  parameter Boolean pj_initialLengthFixed = false "=true, if you want to use the initial length (=pj_initialLength) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Initialization"),choices(checkBox=true));
  parameter Boolean pj_initialVelFixed = false "=true, if you want to use the initial velocity (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Initialization"),choices(checkBox=true));
  parameter Boolean pj_initialAccFixed = false "=true, if you want to use the initial acceleration (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Initialization"),choices(checkBox=true));    

// Variables
  SI.Length stroke "Current stroke, (=length-minPistonLength-boxLength-workingStroke/2)";
  SI.Length length "Total length, distance between frame_a and frame_b";
  SI.Velocity velocity "First derivative of 'length' (relative velocity)";
  SI.Acceleration acceleration "Second derivative of 'length' (relative acceleration)";
  SI.Force feedForce "Actuation force, in piston direction";
  Real revolutions "Total number of rotations of the spindle for the given position (revolutions=0 <-> length=0)";
  SI.Torque drivingTorque "External torque applied to the spindle"; //computed in models that extend this partial model
  NonSI.AngularVelocity_rpm rotationalSpeed "Rotational speed of the spindle";

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic 
    prismatic(
      stateSelect=pj_stateSelect,
      animation=false,
      n={0,0,1},
      useAxisFlange=true,
      s(fixed = pj_initialLengthFixed, start=pj_initialLength),        
      v(fixed = pj_initialVelFixed, start=0),
      a(fixed = pj_initialAccFixed, start=0))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox 
    bodyBox(
      r={0,0,ECparameters.boxLength},
      width=ECparameters.boxWidth,
      density=(ECparameters.totalMass - ECparameters.movingMass)/(ECparameters.boxWidth^2*ECparameters.boxLength)) 
    annotation (Placement(transformation(extent={{-60,-34},{-40,-14}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder 
    bodyCylinder(
      r={0,0,ECparameters.pistonTotLength},
      diameter=ECparameters.pistonDiameter,
      density=4*ECparameters.movingMass/(ECparameters.pistonDiameter^2*pi*ECparameters.pistonTotLength),
      color={255,0,0})
    annotation (Placement(transformation(extent={{40,-34},{60,-14}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));

equation
  assert(abs(stroke)<=ECparameters.workingStroke/2, "PartialElectricCylinder: The current stroke is over the working stroke.", level = AssertionLevel.warning);
  assert(abs(feedForce)<=ECparameters.maxForce, "PartialElectricCylinder: The feed force exceeds the maximum value.", level = AssertionLevel.warning);
  assert(abs(velocity)<=ECparameters.maxSpeed, "PartialElectricCylinder: The velocity exceeds the maximum value.", level = AssertionLevel.warning);
  assert(abs(acceleration)<=ECparameters.maxAcceleration, "PartialElectricCylinder: The acceleration exceeds the maximum value.", level = AssertionLevel.warning);
  assert(abs(drivingTorque)<=ECparameters.maxDrivingTorque, "PartialElectricCylinder: The driving torque exceeds the maximum value.", level = AssertionLevel.warning);
  assert(abs(rotationalSpeed)<=ECparameters.maxRotationalSpeed, "PartialElectricCylinder: The rotational speed exceeds the maximum value.", level = AssertionLevel.warning);

  assert(ECparameters.minLength<ECparameters.maxLength,"PartialElectricCylinder: Limits must be consistent; however minLength>=maxLength");
  assert(pj_initialLength<=ECparameters.maxLength and pj_initialLength>=ECparameters.minLength, "PartialElectricCylinder: Initial length is not within [minLength, maxLength]",level = AssertionLevel.warning);

  length = prismatic.s;
  velocity = prismatic.v;
  acceleration = prismatic.a;
  feedForce = prismatic.f;
  stroke=length-ECparameters.boxLength-ECparameters.minPistonLength-ECparameters.workingStroke/2;
  revolutions=length*1000/ECparameters.spindlePitch;
  rotationalSpeed=velocity*1000/ECparameters.spindlePitch;

  connect(frame_a, prismatic.frame_a) annotation (Line(
      points={{-100,0},{-10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic.frame_b, frame_b) annotation (Line(
      points={{10,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyBox.frame_a, prismatic.frame_a) annotation (Line(
      points={{-60,-24},{-60,0},{-10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(bodyCylinder.frame_b, frame_b) annotation (Line(
      points={{60,-24},{60,0},{100,0}},
      color={95,95,95},
      thickness=0.5));

end PartialElectricCylinder;
