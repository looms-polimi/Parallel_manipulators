within StewartPlatform.Components;

partial model PartialElectricCylinder "Partial model of an electric cylinder"

// Parameters
  parameter Types.ElectricCylinderParameters electricCylinderParameters "Parameters of the electric cylinder";  

// Variables
  SI.Length stroke "Current stroke, (=length-minPistonLength-boxLength-workingStroke/2)";
  SI.Length length "Total length, distance between frame_a and frame_b";
  SI.Velocity velocity "First derivative of 'length' (relative velocity)";
  SI.Acceleration acceleration "Second derivative of 'length' (relative acceleration)";
  SI.Force feedForce "Actuation force, in piston direction";
  Real revolutions "Total number of rotations of the spindle for the given position (revolutions=0 <-> length=0)";
  NonSI.AngularVelocity_rpm rotationalSpeed "Rotational speed of the spindle";

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic 
    prismatic(
      stateSelect=electricCylinderParameters.stateSelect,
      animation=false,
      n={0,0,1},
      useAxisFlange=true,
      s(fixed = electricCylinderParameters.initialLengthFixed, start=electricCylinderParameters.initialLength),        
      v(fixed = electricCylinderParameters.initialVelFixed, start=0),
      a(fixed = electricCylinderParameters.initialAccFixed, start=0))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox 
    bodyBox(
      r={0,0,electricCylinderParameters.boxLength},
      width=electricCylinderParameters.boxWidth,
      density=(electricCylinderParameters.totalMass - electricCylinderParameters.movingMass)/(electricCylinderParameters.boxWidth^2*electricCylinderParameters.boxLength)) 
    annotation (Placement(transformation(extent={{-60,-34},{-40,-14}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder 
    bodyCylinder(
      r={0,0,electricCylinderParameters.pistonTotLength},
      diameter=electricCylinderParameters.pistonDiameter,
      density=4*electricCylinderParameters.movingMass/(electricCylinderParameters.pistonDiameter^2*pi*electricCylinderParameters.pistonTotLength),
      color={255,0,0})
    annotation (Placement(transformation(extent={{40,-34},{60,-14}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));

equation
  assert(abs(stroke)<=electricCylinderParameters.workingStroke/2, "PartialElectricCylinder: The current stroke is over the working stroke.", level = AssertionLevel.warning);
  assert(abs(feedForce)<=electricCylinderParameters.maxForce, "PartialElectricCylinder: The feed force exceeds the maximum value.", level = AssertionLevel.warning);
  assert(abs(velocity)<=electricCylinderParameters.maxSpeed, "PartialElectricCylinder: The velocity exceeds the maximum value.", level = AssertionLevel.warning);
  assert(abs(acceleration)<=electricCylinderParameters.maxAcceleration, "PartialElectricCylinder: The acceleration exceeds the maximum value.", level = AssertionLevel.warning);
  assert(abs(rotationalSpeed)<=electricCylinderParameters.maxRotationalSpeed, "PartialElectricCylinder: The rotational speed exceeds the maximum value.", level = AssertionLevel.warning);

  assert(electricCylinderParameters.minLength<electricCylinderParameters.maxLength,"PartialElectricCylinder: Limits must be consistent; however minLength>=maxLength");
  assert(electricCylinderParameters.initialLength<=electricCylinderParameters.maxLength and electricCylinderParameters.initialLength>=electricCylinderParameters.minLength, "PartialElectricCylinder: Initial length is not within [minLength, maxLength]",level = AssertionLevel.warning);

  length = prismatic.s;
  velocity = prismatic.v;
  acceleration = prismatic.a;
  feedForce = prismatic.f;
  stroke=length-electricCylinderParameters.boxLength-electricCylinderParameters.minPistonLength-electricCylinderParameters.workingStroke/2;
  revolutions=length*1000/electricCylinderParameters.spindlePitch;
  rotationalSpeed=velocity*1000/electricCylinderParameters.spindlePitch;

  connect(frame_a, prismatic.frame_a) annotation (Line(points={{-100,0},{-10,0}},color={95,95,95},thickness=0.5));
  connect(prismatic.frame_b, frame_b) annotation (Line(points={{10,0},{100,0}},color={95,95,95},thickness=0.5));
  connect(bodyBox.frame_a, prismatic.frame_a) annotation (Line(points={{-60,-24},{-60,0},{-10,0}},color={95,95,95},thickness=0.5));
  connect(bodyCylinder.frame_b, frame_b) annotation (Line(points={{60,-24},{60,0},{100,0}},color={95,95,95},thickness=0.5));
  
end PartialElectricCylinder;
