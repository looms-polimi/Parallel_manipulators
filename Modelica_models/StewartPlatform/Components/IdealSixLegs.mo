within StewartPlatform.Components;

model IdealSixLegs "Set of six legs of a Stewart Platform appropiately connected, composed of ideal linear actuators"
  extends StewartPlatform.Icons.IdealSixLegs; // Icon

// Imports
  import StewartPlatform.Functions.*;

// Parameter
  outer StewartPlatform.Components.GlobalParameters gp;

  parameter StewartPlatform.Types.DiscParameters base = gp.base "Base parameters";
  parameter StewartPlatform.Types.DiscParameters platform = gp.platform "Platform parameters";

// Ideal linear actuators
  parameter Types.ElectricCylinderParameters 
    ECparameters(
      spindlePitch=gp.ECparameters.spindlePitch,
      totalMass=gp.ECparameters.totalMass,
      movingMass=gp.ECparameters.movingMass,
      workingStroke=gp.ECparameters.workingStroke,
      boxLength=gp.ECparameters.boxLength,
      boxWidth=gp.ECparameters.boxWidth,
      minPistonLength=gp.ECparameters.minPistonLength,
      pistonTotLength=gp.ECparameters.pistonTotLength,
      pistonDiameter=gp.ECparameters.pistonDiameter,
      maxForce=gp.ECparameters.maxForce,
      maxSpeed=gp.ECparameters.maxSpeed,
      maxAcceleration=gp.ECparameters.maxAcceleration,
      maxRotationalSpeed=gp.ECparameters.maxRotationalSpeed,
      maxDrivingTorque=gp.ECparameters.maxDrivingTorque) 
    "Electric cylinders parameters"
    annotation (Dialog(group="Ideal linear actuators"));
  
  parameter StateSelect ila_stateSelect[6] = fill(StateSelect.prefer,6) "Priority to use cylinder total length and its derivative (velocity) as states" annotation (Dialog(group="Ideal linear actuators"));
  parameter Boolean ila_initialLengthFixed[6] = fill(false,6) "=true, if you want to use the initial length (=initialLength) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Ideal linear actuators"));
  parameter Boolean ila_initialVelFixed[6] = fill(false,6) "=true, if you want to use the initial velocity (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Ideal linear actuators"));
  parameter Boolean ila_initialAccFixed[6] = fill(false,6) "=true, if you want to use the initial acceleration (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Ideal linear actuators"));

  parameter Boolean enableLimiters = true
    "=true, if you want to limit the input ref. length within [minLength, maxLength] with (minLength = boxLength+minPistonLength ) and ( maxLength=minLength+workingStroke)"
    annotation (Dialog(group="Ideal linear actuators"));
  parameter Real Tf = 0.05 "Time constant of the first order filter applied to the length ref. input" annotation (Dialog(group="Ideal linear actuators"));

// Spherical joint
  parameter Boolean sj_enforceStates[6] = fill(false,6) "=true, if the variables of the spherical joint have priority to be selected as states" annotation (Dialog(group="Spherical joint"));
  parameter Boolean sj_useQuaternions[6] = fill(false,6) "= true, if quaternions shall be used as states otherwise use 3 angles as states (provided sj_enforceStates=true)" annotation (Dialog(group="Spherical joint"));

// Universal joints
  parameter SI.Angle alpha[6] = gp.alpha "Universal joints orientation" annotation (Dialog(group="Universal joints"));
  parameter StateSelect uj_stateSelect[6] = fill(StateSelect.prefer,6) "Priority to use universal joint coordinates (phi_a, phi_b, w_a, w_b) as states" annotation (Dialog(group="Universal joints"));
  parameter Boolean uj_initialAnglesFixed[6] = fill(false,6) "=true, if you want to use universal joint angles as initial eqation ('fixed' attributes)" 
    annotation (Dialog(group="Universal joints"));
  parameter Boolean uj_initialAngularVelFixed[6] = fill(false,6) "=true, if you want to use universal joint angular velocities (=0) of the joint as initial eqation ('fixed' attributes)"
    annotation (Dialog(group="Universal joints"));
  parameter Boolean uj_initialAngularAccFixed[6] = fill(false,6) "=true, if you want to use universal joint angular accelerations (=0) of the joint as initial eqatio ('fixed' attributes)"
    annotation (Dialog(group="Universal joints"));

// Initialization: initial platform position and orientation
  parameter SI.Position initPlatformPos[3] = gp.initPlatformPos "Coordinates of the platform frame resolved in base frame"
    annotation(Dialog(group="Initialization: initial platform position and orientation"));
  parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence = gp.initSequence "Sequence of rotations from base frame to platform frame along axis sequence[i]"
    annotation(Dialog(group="Initialization: initial platform position and orientation"));
  parameter SI.Angle angles[3] = gp.initAngles "Rotation angles around the axes defined in 'sequence'"
    annotation(Dialog(group="Initialization: initial platform position and orientation"));

// Animation
  parameter SI.Distance uj_cylinderLength(displayUnit = "mm") = 1/10 "Length of cylinders representing the universal joints"
    annotation (Dialog(tab="Animation", group="Universal joints"),HideResult=true);
  parameter SI.Distance uj_cylinderDiameter(displayUnit = "mm") = 1/20 "Diameter of cylinders representing the universal joints"
    annotation (Dialog(tab="Animation", group="Universal joints"),HideResult=true);
  parameter SI.Diameter sj_sphereDiameter(displayUnit = "mm") = 1/16 "Diameter of spheres representing the spherical joints"
    annotation (Dialog(tab="Animation", group="Spherical joints"),HideResult=true);

protected
  final parameter Real leg[6,3] = legsDirections(base,platform,initPlatformPos,sequence,angles,true) "Initial legs direction resolved in base frame";
  final parameter SI.Length initialLength[6] = legsLength(base,platform,initPlatformPos,sequence,angles) "Initial legs length";
  final parameter SI.Angle ujangles[6,2] = {ujAngles(leg[i],alpha[i]) for i in 1:6} "Initial rotation angles of the universal joints";

// Variables
public
  SI.Length lengthDIS[6] "Current legs lengths";
  SI.Velocity velocityDIS[6] "Display leg velocities";
  SI.Acceleration accelerationDIS[6] "Display leg accelerations";
  SI.Length strokeDIS[6] "Current actuators strokes";
  SI.Force feedForceDIS[6] "Current actuator feed force";

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_base[6] "Frames for connection with the platform's joints"
    annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,-100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_platform[6] "Frames for connection with the platform's joints"
    annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={0,100})));
  Modelica.Blocks.Interfaces.RealInput lengthRef[6] "Reference signals for the lengths of the six legs" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  IdealLeg 
    idealLeg1(
      ila_stateSelect=ila_stateSelect[1],
      initialLengthFixed=ila_initialLengthFixed[1],
      initialVelFixed=ila_initialVelFixed[1],
      initialAccFixed=ila_initialAccFixed[1],
      alpha=alpha[1],
      angles=ujangles[1],
      initialLength=initialLength[1],
      Tf=Tf,
      sj_sphereDiameter=sj_sphereDiameter,
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter,             
      enableLimiter=enableLimiters,
      uj_stateSelect=uj_stateSelect[1],
      uj_initialAnglesFixed=uj_initialAnglesFixed[1],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[1],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[1],
      sj_enforceStates=sj_enforceStates[1],
      sj_useQuaternions=sj_useQuaternions[1],
      ECparameters(
        spindlePitch=ECparameters.spindlePitch,
        totalMass=ECparameters.totalMass,
        movingMass=ECparameters.movingMass,
        workingStroke=ECparameters.workingStroke,
        boxLength=ECparameters.boxLength,
        boxWidth=ECparameters.boxWidth,
        minPistonLength=ECparameters.minPistonLength,
        pistonTotLength=ECparameters.pistonTotLength,
        pistonDiameter=ECparameters.pistonDiameter,
        maxForce=ECparameters.maxForce,
        maxSpeed=ECparameters.maxSpeed,
        maxAcceleration=ECparameters.maxAcceleration,
        maxRotationalSpeed=ECparameters.maxRotationalSpeed,
        maxDrivingTorque=ECparameters.maxDrivingTorque))
      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-72,0})));
  IdealLeg 
    idealLeg2(
      ila_stateSelect=ila_stateSelect[2],
      initialLengthFixed=ila_initialLengthFixed[2],
      initialVelFixed=ila_initialVelFixed[2],
      initialAccFixed=ila_initialAccFixed[2],
      alpha=alpha[2],
      angles=ujangles[2],
      initialLength=initialLength[2],
      Tf=Tf,
      sj_sphereDiameter=sj_sphereDiameter,
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter,             
      enableLimiter=enableLimiters,
      uj_stateSelect=uj_stateSelect[2],
      uj_initialAnglesFixed=uj_initialAnglesFixed[2],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[2],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[2],
      sj_enforceStates=sj_enforceStates[2],
      sj_useQuaternions=sj_useQuaternions[2],
      ECparameters(
        spindlePitch=ECparameters.spindlePitch,
        totalMass=ECparameters.totalMass,
        movingMass=ECparameters.movingMass,
        workingStroke=ECparameters.workingStroke,
        boxLength=ECparameters.boxLength,
        boxWidth=ECparameters.boxWidth,
        minPistonLength=ECparameters.minPistonLength,
        pistonTotLength=ECparameters.pistonTotLength,
        pistonDiameter=ECparameters.pistonDiameter,
        maxForce=ECparameters.maxForce,
        maxSpeed=ECparameters.maxSpeed,
        maxAcceleration=ECparameters.maxAcceleration,
        maxRotationalSpeed=ECparameters.maxRotationalSpeed,
        maxDrivingTorque=ECparameters.maxDrivingTorque))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-42,0})));
  IdealLeg 
    idealLeg3(
      ila_stateSelect=ila_stateSelect[3],
      initialLengthFixed=ila_initialLengthFixed[3],
      initialVelFixed=ila_initialVelFixed[3],
      initialAccFixed=ila_initialAccFixed[3],
      alpha=alpha[3],
      angles=ujangles[3],
      initialLength=initialLength[3],
      Tf=Tf,
      sj_sphereDiameter=sj_sphereDiameter,
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter,             
      enableLimiter=enableLimiters,
      uj_stateSelect=uj_stateSelect[3],
      uj_initialAnglesFixed=uj_initialAnglesFixed[3],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[3],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[3],
      sj_enforceStates=sj_enforceStates[3],
      sj_useQuaternions=sj_useQuaternions[3],
      ECparameters(
        spindlePitch=ECparameters.spindlePitch,
        totalMass=ECparameters.totalMass,
        movingMass=ECparameters.movingMass,
        workingStroke=ECparameters.workingStroke,
        boxLength=ECparameters.boxLength,
        boxWidth=ECparameters.boxWidth,
        minPistonLength=ECparameters.minPistonLength,
        pistonTotLength=ECparameters.pistonTotLength,
        pistonDiameter=ECparameters.pistonDiameter,
        maxForce=ECparameters.maxForce,
        maxSpeed=ECparameters.maxSpeed,
        maxAcceleration=ECparameters.maxAcceleration,
        maxRotationalSpeed=ECparameters.maxRotationalSpeed,
        maxDrivingTorque=ECparameters.maxDrivingTorque))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-12,0})));
  IdealLeg 
    idealLeg4(
      ila_stateSelect=ila_stateSelect[4],
      initialLengthFixed=ila_initialLengthFixed[4],
      initialVelFixed=ila_initialVelFixed[4],
      initialAccFixed=ila_initialAccFixed[4],
      alpha=alpha[4],
      angles=ujangles[4],
      initialLength=initialLength[4],
      Tf=Tf,
      sj_sphereDiameter=sj_sphereDiameter,
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter,             
      enableLimiter=enableLimiters,
      uj_stateSelect=uj_stateSelect[4],
      uj_initialAnglesFixed=uj_initialAnglesFixed[4],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[4],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[4],
      sj_enforceStates=sj_enforceStates[4],
      sj_useQuaternions=sj_useQuaternions[4],
      ECparameters(
        spindlePitch=ECparameters.spindlePitch,
        totalMass=ECparameters.totalMass,
        movingMass=ECparameters.movingMass,
        workingStroke=ECparameters.workingStroke,
        boxLength=ECparameters.boxLength,
        boxWidth=ECparameters.boxWidth,
        minPistonLength=ECparameters.minPistonLength,
        pistonTotLength=ECparameters.pistonTotLength,
        pistonDiameter=ECparameters.pistonDiameter,
        maxForce=ECparameters.maxForce,
        maxSpeed=ECparameters.maxSpeed,
        maxAcceleration=ECparameters.maxAcceleration,
        maxRotationalSpeed=ECparameters.maxRotationalSpeed,
        maxDrivingTorque=ECparameters.maxDrivingTorque))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={18,0})));
  IdealLeg 
    idealLeg5(
      ila_stateSelect=ila_stateSelect[5],
      initialLengthFixed=ila_initialLengthFixed[5],
      initialVelFixed=ila_initialVelFixed[5],
      initialAccFixed=ila_initialAccFixed[5],
      alpha=alpha[5],
      angles=ujangles[5],
      initialLength=initialLength[5],
      Tf=Tf,
      sj_sphereDiameter=sj_sphereDiameter,
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter,             
      enableLimiter=enableLimiters,
      uj_stateSelect=uj_stateSelect[5],
      uj_initialAnglesFixed=uj_initialAnglesFixed[5],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[5],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[5],
      sj_enforceStates=sj_enforceStates[5],
      sj_useQuaternions=sj_useQuaternions[5],
      ECparameters(
        spindlePitch=ECparameters.spindlePitch,
        totalMass=ECparameters.totalMass,
        movingMass=ECparameters.movingMass,
        workingStroke=ECparameters.workingStroke,
        boxLength=ECparameters.boxLength,
        boxWidth=ECparameters.boxWidth,
        minPistonLength=ECparameters.minPistonLength,
        pistonTotLength=ECparameters.pistonTotLength,
        pistonDiameter=ECparameters.pistonDiameter,
        maxForce=ECparameters.maxForce,
        maxSpeed=ECparameters.maxSpeed,
        maxAcceleration=ECparameters.maxAcceleration,
        maxRotationalSpeed=ECparameters.maxRotationalSpeed,
        maxDrivingTorque=ECparameters.maxDrivingTorque))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={48,0})));
  IdealLeg 
    idealLeg6(
      ila_stateSelect=ila_stateSelect[6],
      initialLengthFixed=ila_initialLengthFixed[6],
      initialVelFixed=ila_initialVelFixed[6],
      initialAccFixed=ila_initialAccFixed[6],
      alpha=alpha[6],
      angles=ujangles[6],
      initialLength=initialLength[6],
      Tf=Tf,
      sj_sphereDiameter=sj_sphereDiameter,
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter,             
      enableLimiter=enableLimiters,
      uj_stateSelect=uj_stateSelect[6],
      uj_initialAnglesFixed=uj_initialAnglesFixed[6],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[6],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[6],
      sj_enforceStates=sj_enforceStates[6],
      sj_useQuaternions=sj_useQuaternions[6],
      ECparameters(
        spindlePitch=ECparameters.spindlePitch,
        totalMass=ECparameters.totalMass,
        movingMass=ECparameters.movingMass,
        workingStroke=ECparameters.workingStroke,
        boxLength=ECparameters.boxLength,
        boxWidth=ECparameters.boxWidth,
        minPistonLength=ECparameters.minPistonLength,
        pistonTotLength=ECparameters.pistonTotLength,
        pistonDiameter=ECparameters.pistonDiameter,
        maxForce=ECparameters.maxForce,
        maxSpeed=ECparameters.maxSpeed,
        maxAcceleration=ECparameters.maxAcceleration,
        maxRotationalSpeed=ECparameters.maxRotationalSpeed,
        maxDrivingTorque=ECparameters.maxDrivingTorque))
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={78,0})));

equation
  lengthDIS[1]=idealLeg1.idealLinearActuator.length;
  lengthDIS[2]=idealLeg2.idealLinearActuator.length;
  lengthDIS[3]=idealLeg3.idealLinearActuator.length;
  lengthDIS[4]=idealLeg4.idealLinearActuator.length;
  lengthDIS[5]=idealLeg5.idealLinearActuator.length;
  lengthDIS[6]=idealLeg6.idealLinearActuator.length;

  velocityDIS[1]=idealLeg1.idealLinearActuator.velocity;
  velocityDIS[2]=idealLeg2.idealLinearActuator.velocity;
  velocityDIS[3]=idealLeg3.idealLinearActuator.velocity;
  velocityDIS[4]=idealLeg4.idealLinearActuator.velocity;
  velocityDIS[5]=idealLeg5.idealLinearActuator.velocity;
  velocityDIS[6]=idealLeg6.idealLinearActuator.velocity;

  accelerationDIS[1]=idealLeg1.idealLinearActuator.acceleration;
  accelerationDIS[2]=idealLeg2.idealLinearActuator.acceleration;
  accelerationDIS[3]=idealLeg3.idealLinearActuator.acceleration;
  accelerationDIS[4]=idealLeg4.idealLinearActuator.acceleration;
  accelerationDIS[5]=idealLeg5.idealLinearActuator.acceleration;
  accelerationDIS[6]=idealLeg6.idealLinearActuator.acceleration;

  strokeDIS[1]=idealLeg1.idealLinearActuator.stroke;
  strokeDIS[2]=idealLeg2.idealLinearActuator.stroke;
  strokeDIS[3]=idealLeg3.idealLinearActuator.stroke;
  strokeDIS[4]=idealLeg4.idealLinearActuator.stroke;
  strokeDIS[5]=idealLeg5.idealLinearActuator.stroke;
  strokeDIS[6]=idealLeg6.idealLinearActuator.stroke;

  feedForceDIS[1]=idealLeg1.idealLinearActuator.feedForce;
  feedForceDIS[2]=idealLeg2.idealLinearActuator.feedForce;
  feedForceDIS[3]=idealLeg3.idealLinearActuator.feedForce;
  feedForceDIS[4]=idealLeg4.idealLinearActuator.feedForce;
  feedForceDIS[5]=idealLeg5.idealLinearActuator.feedForce;
  feedForceDIS[6]=idealLeg6.idealLinearActuator.feedForce;

  connect(frame_base[1], idealLeg1.frame_a) annotation (Line(
      points={{0,-113.333},{-72,-113.333},{-72,-15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[2], idealLeg2.frame_a) annotation (Line(
      points={{0,-108},{-42,-108},{-42,-15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[3], idealLeg3.frame_a) annotation (Line(
      points={{0,-102.667},{-12,-102.667},{-12,-15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[4], idealLeg4.frame_a) annotation (Line(
      points={{0,-97.3333},{18,-97.3333},{18,-15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[5], idealLeg5.frame_a) annotation (Line(
      points={{0,-92},{48,-92},{48,-15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[6], idealLeg6.frame_a) annotation (Line(
      points={{0,-86.6667},{78,-86.6667},{78,-15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[1], idealLeg1.frame_b) annotation (Line(
      points={{0,86.6667},{-72,86.6667},{-72,13.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[2], idealLeg2.frame_b) annotation (Line(
      points={{0,92},{-42,92},{-42,13.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[3], idealLeg3.frame_b) annotation (Line(
      points={{0,97.3333},{-12,97.3333},{-12,13.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[4], idealLeg4.frame_b) annotation (Line(
      points={{0,102.667},{18,102.667},{18,13.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[5], idealLeg5.frame_b) annotation (Line(
      points={{0,108},{48,108},{48,13.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[6], idealLeg6.frame_b) annotation (Line(
      points={{0,113.333},{78,113.333},{78,13.8}},
      color={95,95,95},
      thickness=0.5));
  connect(lengthRef[1], idealLeg1.lengthRef) annotation (Line(points={{-120,-16.6667},{-90.2,-16.6667},{-90.2,0},{-82.2,0}}, color={0,0,127}));
  connect(idealLeg2.lengthRef, lengthRef[2]) annotation (Line(points={{-52.2,0},{-60,0},{-60,-10},{-120,-10}}, color={0,0,127}));
  connect(lengthRef[3], idealLeg3.lengthRef) annotation (Line(points={{-120,-3.33333},{-30.2,-3.33333},{-30.2,4.44089e-016},{-22.2,4.44089e-016}}, color={0,0,127}));
  connect(lengthRef[4], idealLeg4.lengthRef) annotation (Line(points={{-120,3.33333},{-0.2,3.33333},{-0.2,4.44089e-016},{7.8,4.44089e-016}}, color={0,0,127}));
  connect(lengthRef[5], idealLeg5.lengthRef) annotation (Line(points={{-120,10},{29.8,10},{29.8,0},{37.8,0}}, color={0,0,127}));
  connect(lengthRef[6], idealLeg6.lengthRef) annotation (Line(points={{-120,16.6667},{59.8,16.6667},{59.8,4.44089e-016},{67.8,4.44089e-016}}, color={0,0,127}));
  
end IdealSixLegs;
