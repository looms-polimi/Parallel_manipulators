within StewartPlatform.Components;

model SixLegs "Set of six legs of a Stewart platform appropiately connected, composed of electric cylinders and servo motors"
    extends StewartPlatform.Icons.SixLegs;

// Imports
    import StewartPlatform.Functions.*;
    import Modelica.Blocks.Types.Init;

// Parameter
    outer StewartPlatform.Components.GlobalParameters gp;

    parameter StewartPlatform.Types.DiscParameters base = gp.base "Base parameters";
    parameter StewartPlatform.Types.DiscParameters platform = gp.platform "Platform parameters";

// Universal joints
    parameter SI.Angle alpha[6] = gp.alpha "Orientation of the universal joint: rotation around z-axis from frame_a" annotation (Dialog(group="Universal joint"));
    
    parameter StateSelect uj_stateSelect[6] = fill(StateSelect.prefer,6) "Priority to use universal joint coordinates (phi_a, phi_b, w_a, w_b) as states" annotation (Dialog(group="Universal joint"));
    parameter Boolean uj_initialAnglesFixed[6] = fill(false,6) "=true, if you want to use universal joint angles as initial eqation ('fixed' attributes)" annotation (Dialog(group="Universal joint"));
    parameter Boolean uj_initialAngularVelFixed[6] = fill(false,6) "=true, if you want to use universal joint angular velocities (=0) of the joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Universal joint"));
    parameter Boolean uj_initialAngularAccFixed[6] = fill(false,6) "=true, if you want to use universal joint angular accelerations (=0) of the joint as initial eqatio ('fixed' attributes)" annotation (Dialog(group="Universal joint"));

// Electric cylinder
    parameter Types.ElectricCylinderParameters ECparameters=gp.ECparameters "Electric cylinders parameters" annotation (Dialog(group="Electric cylinder"));
    parameter StateSelect ec_stateSelect[6] = fill(StateSelect.prefer,6) "Priority to use cylinder total length and its derivative (velocity) as states" annotation (Dialog(group="Electric cylinder"));
    parameter Boolean ec_initialLengthFixed[6] = fill(false,6) "=true, if you want to use the initial length (=initialLength) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Electric cylinder"));
    parameter Boolean ec_initialVelFixed[6] = fill(false,6) "=true, if you want to use the initial velocity (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Electric cylinder"));
    parameter Boolean ec_initialAccFixed[6] = fill(false,6) "=true, if you want to use the initial acceleration (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Electric cylinder"));

// Servo motor
    parameter StewartPlatform.Types.ServoMotorParameters SMparameters annotation (Dialog(group="Servo motor"));
    parameter SI.Torque sm_initialTorque[6] = fill(0,6) "Initial torque applied by the motor" annotation (Dialog(group="Servo motor"));
    parameter Init sm_initType[6] = fill(Init.NoInit,6) "Type of initialization of servo motor's internal control (1: no init, 2: steady state, 3/4: initial output)" annotation(Evaluate=true, Dialog(group="Servo motor"));

// Spherical joint
    parameter Boolean sj_enforceStates[6] = fill(false,6) "=true, if the variables of the spherical joint have priority to be selected as states" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    parameter Boolean sj_useQuaternions[6] = fill(false,6) "= true, if quaternions shall be used as states otherwise use 3 angles as states (provided sj_enforceStates=true)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    parameter Boolean sj_initialAngularVelFixed[6] = fill(false,6) "=true, if you want to use angular velocities (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    parameter Boolean sj_initialAngularAccFixed[6] = fill(false,6) "=true, if you want to use angular accelerations (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));

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
    parameter Real leg[6,3]=legsDirections(base,platform,initPlatformPos,sequence,angles,true) "Initial legs direction resolved in base frame";
    parameter SI.Length ec_initialLength[6] = legsLength(base,platform,initPlatformPos,sequence,angles) "Initial legs length";
    parameter SI.Angle uj_angles[6,2] = {ujAngles(leg[i],alpha[i]) for i in 1:6} "Initial rotation angles of the universal joints";

  //Variables
public
  SI.Length lengthDIS[6] "Display legs lengths";
  SI.Velocity velocityDIS[6] "Display leg velocities";
  SI.Acceleration accelerationDIS[6] "Display leg accelerations";
  SI.Length strokeDIS[6] "Display actuators strokes";
  SI.Force feedForceDIS[6] "Display actuator feed force";
  SI.Torque motorTorqueDIS[6] "Display torque applied by servomotor";
  NonSI.AngularVelocity_rpm motorSpeedDIS[6] "Display motors' shaft speed";

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
  Interfaces.ControlBus controlBus annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-100,2}), iconTransformation(
        extent={{-16,16},{16,-16}},
        rotation=90,
        origin={-102,0})));
  Leg 
    leg1(
      alpha=alpha[1], // Universal joint
      angles=uj_angles[1],
      uj_stateSelect=uj_stateSelect[1],
      uj_initialAnglesFixed=uj_initialAnglesFixed[1],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[1],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[1],

      ECparameters=ECparameters, // Electric cylinder
      ec_stateSelect=ec_stateSelect[1],
      ec_initialLength=ec_initialLength[1],
      ec_initialLengthFixed=ec_initialLengthFixed[1],
      ec_initialVelFixed=ec_initialVelFixed[1],
      ec_initialAccFixed=ec_initialAccFixed[1],

      SMparameters=SMparameters, // Servo motor
      sm_initialTorque=sm_initialTorque[1],
      sm_initType=sm_initType[1],

      sj_enforceStates=sj_enforceStates[1], // Spherical joint
      sj_useQuaternions=sj_useQuaternions[1],
      sj_initialAngularVelFixed=sj_initialAngularVelFixed[1],
      sj_initialAngularAccFixed=sj_initialAngularAccFixed[1],
      
      sj_sphereDiameter=sj_sphereDiameter, // Animation
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter)
      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-72,0})));
  Leg 
    leg2(
      alpha=alpha[2], // Universal joint
      angles=uj_angles[2],
      uj_stateSelect=uj_stateSelect[2],
      uj_initialAnglesFixed=uj_initialAnglesFixed[2],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[2],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[2],

      ECparameters=ECparameters, // Electric cylinder
      ec_stateSelect=ec_stateSelect[2],
      ec_initialLength=ec_initialLength[2],
      ec_initialLengthFixed=ec_initialLengthFixed[2],
      ec_initialVelFixed=ec_initialVelFixed[2],
      ec_initialAccFixed=ec_initialAccFixed[2],

      SMparameters=SMparameters, // Servo motor
      sm_initialTorque=sm_initialTorque[2],
      sm_initType=sm_initType[2],

      sj_enforceStates=sj_enforceStates[2], // Spherical joint
      sj_useQuaternions=sj_useQuaternions[2],
      sj_initialAngularVelFixed=sj_initialAngularVelFixed[2],
      sj_initialAngularAccFixed=sj_initialAngularAccFixed[2],
      
      sj_sphereDiameter=sj_sphereDiameter, // Animation
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-42,0})));
  Leg 
    leg3(
      alpha=alpha[3], // Universal joint
      angles=uj_angles[3],
      uj_stateSelect=uj_stateSelect[3],
      uj_initialAnglesFixed=uj_initialAnglesFixed[3],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[3],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[3],

      ECparameters=ECparameters, // Electric cylinder
      ec_stateSelect=ec_stateSelect[3],
      ec_initialLength=ec_initialLength[3],
      ec_initialLengthFixed=ec_initialLengthFixed[3],
      ec_initialVelFixed=ec_initialVelFixed[3],
      ec_initialAccFixed=ec_initialAccFixed[3],

      SMparameters=SMparameters, // Servo motor
      sm_initialTorque=sm_initialTorque[3],
      sm_initType=sm_initType[3],

      sj_enforceStates=sj_enforceStates[3], // Spherical joint
      sj_useQuaternions=sj_useQuaternions[3],
      sj_initialAngularVelFixed=sj_initialAngularVelFixed[3],
      sj_initialAngularAccFixed=sj_initialAngularAccFixed[3],
      
      sj_sphereDiameter=sj_sphereDiameter, // Animation
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={-12,0})));
  Leg 
    leg4(
      alpha=alpha[4], // Universal joint
      angles=uj_angles[4],
      uj_stateSelect=uj_stateSelect[4],
      uj_initialAnglesFixed=uj_initialAnglesFixed[4],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[4],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[4],

      ECparameters=ECparameters, // Electric cylinder
      ec_stateSelect=ec_stateSelect[4],
      ec_initialLength=ec_initialLength[4],
      ec_initialLengthFixed=ec_initialLengthFixed[4],
      ec_initialVelFixed=ec_initialVelFixed[4],
      ec_initialAccFixed=ec_initialAccFixed[4],

      SMparameters=SMparameters, // Servo motor
      sm_initialTorque=sm_initialTorque[4],
      sm_initType=sm_initType[4],

      sj_enforceStates=sj_enforceStates[4], // Spherical joint
      sj_useQuaternions=sj_useQuaternions[4],
      sj_initialAngularVelFixed=sj_initialAngularVelFixed[4],
      sj_initialAngularAccFixed=sj_initialAngularAccFixed[4],
      
      sj_sphereDiameter=sj_sphereDiameter, // Animation
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={18,0})));
  Leg 
    leg5(
      alpha=alpha[5], // Universal joint
      angles=uj_angles[5],
      uj_stateSelect=uj_stateSelect[5],
      uj_initialAnglesFixed=uj_initialAnglesFixed[5],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[5],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[5],

      ECparameters=ECparameters, // Electric cylinder
      ec_stateSelect=ec_stateSelect[5],
      ec_initialLength=ec_initialLength[5],
      ec_initialLengthFixed=ec_initialLengthFixed[5],
      ec_initialVelFixed=ec_initialVelFixed[5],
      ec_initialAccFixed=ec_initialAccFixed[5],

      SMparameters=SMparameters, // Servo motor
      sm_initialTorque=sm_initialTorque[5],
      sm_initType=sm_initType[5],

      sj_enforceStates=sj_enforceStates[5], // Spherical joint
      sj_useQuaternions=sj_useQuaternions[5],
      sj_initialAngularVelFixed=sj_initialAngularVelFixed[5],
      sj_initialAngularAccFixed=sj_initialAngularAccFixed[5],
      
      sj_sphereDiameter=sj_sphereDiameter, // Animation
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={48,0})));
  Leg 
    leg6(
      alpha=alpha[6], // Universal joint
      angles=uj_angles[6],
      uj_stateSelect=uj_stateSelect[6],
      uj_initialAnglesFixed=uj_initialAnglesFixed[6],
      uj_initialAngularVelFixed=uj_initialAngularVelFixed[6],
      uj_initialAngularAccFixed=uj_initialAngularAccFixed[6],

      ECparameters=ECparameters, // Electric cylinder
      ec_stateSelect=ec_stateSelect[6],
      ec_initialLength=ec_initialLength[6],
      ec_initialLengthFixed=ec_initialLengthFixed[6],
      ec_initialVelFixed=ec_initialVelFixed[6],
      ec_initialAccFixed=ec_initialAccFixed[6],

      SMparameters=SMparameters, // Servo motor
      sm_initialTorque=sm_initialTorque[6],
      sm_initType=sm_initType[6],

      sj_enforceStates=sj_enforceStates[6], // Spherical joint
      sj_useQuaternions=sj_useQuaternions[6],
      sj_initialAngularVelFixed=sj_initialAngularVelFixed[6],
      sj_initialAngularAccFixed=sj_initialAngularAccFixed[6],      
      sj_sphereDiameter=sj_sphereDiameter, // Animation
      uj_cylinderLength=uj_cylinderLength,
      uj_cylinderDiameter=uj_cylinderDiameter)
    annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={78,0})));

equation
  lengthDIS[1]=leg1.electricCylinder.length;
  lengthDIS[2]=leg2.electricCylinder.length;
  lengthDIS[3]=leg3.electricCylinder.length;
  lengthDIS[4]=leg4.electricCylinder.length;
  lengthDIS[5]=leg5.electricCylinder.length;
  lengthDIS[6]=leg6.electricCylinder.length;

  velocityDIS[1]=leg1.electricCylinder.velocity;
  velocityDIS[2]=leg2.electricCylinder.velocity;
  velocityDIS[3]=leg3.electricCylinder.velocity;
  velocityDIS[4]=leg4.electricCylinder.velocity;
  velocityDIS[5]=leg5.electricCylinder.velocity;
  velocityDIS[6]=leg6.electricCylinder.velocity;

  accelerationDIS[1]=leg1.electricCylinder.acceleration;
  accelerationDIS[2]=leg2.electricCylinder.acceleration;
  accelerationDIS[3]=leg3.electricCylinder.acceleration;
  accelerationDIS[4]=leg4.electricCylinder.acceleration;
  accelerationDIS[5]=leg5.electricCylinder.acceleration;
  accelerationDIS[6]=leg6.electricCylinder.acceleration;

  strokeDIS[1]=leg1.electricCylinder.stroke;
  strokeDIS[2]=leg2.electricCylinder.stroke;
  strokeDIS[3]=leg3.electricCylinder.stroke;
  strokeDIS[4]=leg4.electricCylinder.stroke;
  strokeDIS[5]=leg5.electricCylinder.stroke;
  strokeDIS[6]=leg6.electricCylinder.stroke;

  feedForceDIS[1]=leg1.electricCylinder.feedForce;
  feedForceDIS[2]=leg2.electricCylinder.feedForce;
  feedForceDIS[3]=leg3.electricCylinder.feedForce;
  feedForceDIS[4]=leg4.electricCylinder.feedForce;
  feedForceDIS[5]=leg5.electricCylinder.feedForce;
  feedForceDIS[6]=leg6.electricCylinder.feedForce;

  motorTorqueDIS[1]=leg1.servoMotor.T;
  motorTorqueDIS[2]=leg2.servoMotor.T;
  motorTorqueDIS[3]=leg3.servoMotor.T;
  motorTorqueDIS[4]=leg4.servoMotor.T;
  motorTorqueDIS[5]=leg5.servoMotor.T;
  motorTorqueDIS[6]=leg6.servoMotor.T;

  motorSpeedDIS[1]=leg1.servoMotor.w*60/2/pi;
  motorSpeedDIS[2]=leg2.servoMotor.w*60/2/pi;
  motorSpeedDIS[3]=leg3.servoMotor.w*60/2/pi;
  motorSpeedDIS[4]=leg4.servoMotor.w*60/2/pi;
  motorSpeedDIS[5]=leg5.servoMotor.w*60/2/pi;
  motorSpeedDIS[6]=leg6.servoMotor.w*60/2/pi;

  connect(frame_platform[1], leg1.frame_b) annotation (Line(
      points={{0,86.6667},{-68,86.6667},{-68,15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[2], leg2.frame_b) annotation (Line(
      points={{0,92},{-38,92},{-38,15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[3], leg3.frame_b) annotation (Line(
      points={{0,97.3333},{-8,97.3333},{-8,15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[4], leg4.frame_b) annotation (Line(
      points={{0,102.667},{22,102.667},{22,15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[5], leg5.frame_b) annotation (Line(
      points={{0,108},{52,108},{52,15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_platform[6], leg6.frame_b) annotation (Line(
      points={{0,113.333},{80,113.333},{80,15.8}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[1], leg1.frame_a) annotation (Line(
      points={{0,-113.333},{-68,-113.333},{-68,-13.6}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[2], leg2.frame_a) annotation (Line(
      points={{0,-108},{-38,-108},{-38,-13.6}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[3], leg3.frame_a) annotation (Line(
      points={{0,-102.667},{-8,-102.667},{-8,-13.6}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[4], leg4.frame_a) annotation (Line(
      points={{0,-97.3333},{22,-97.3333},{22,-13.6}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[5], leg5.frame_a) annotation (Line(
      points={{0,-92},{52,-92},{52,-13.6}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_base[6], leg6.frame_a) annotation (Line(
      points={{0,-86.6667},{80,-86.6667},{80,-13.6}},
      color={95,95,95},
      thickness=0.5));
  connect(controlBus.axisControlBus1, leg1.axisControlBus)
    annotation (Line(
      points={{-99.95,2.05},{-99.95,-20},{-74.5,-20},{-74.5,-8.1}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus.axisControlBus2, leg2.axisControlBus)
    annotation (Line(
      points={{-99.95,2.05},{-99.95,-20},{-44.5,-20},{-44.5,-8.1}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus.axisControlBus3, leg3.axisControlBus)
    annotation (Line(
      points={{-99.95,2.05},{-99.95,-20},{-14.5,-20},{-14.5,-8.1}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus.axisControlBus4, leg4.axisControlBus)
    annotation (Line(
      points={{-99.95,2.05},{-99.95,-20},{15.5,-20},{15.5,-8.1}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus.axisControlBus5, leg5.axisControlBus)
    annotation (Line(
      points={{-99.95,2.05},{-99.95,-20},{45.5,-20},{45.5,-8.1}},
      color={255,204,51},
      thickness=0.5));
  connect(controlBus.axisControlBus6, leg6.axisControlBus)
    annotation (Line(
      points={{-99.95,2.05},{-99.95,-20},{73.5,-20},{73.5,-8.1}},
      color={255,204,51},
      thickness=0.5));

end SixLegs;
