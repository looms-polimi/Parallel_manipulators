within StewartPlatform.Components;

model IdealLeg "Six-degrees-of-freedom leg with controlled length composed of an ideal linear actuator"
    extends StewartPlatform.Icons.IdealLeg;

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

// Ideal linear actuator
    parameter Types.ElectricCylinderParameters 
        ECparameters "Electric cylinder parameters" 
        annotation (Dialog(group="Ideal linear actuator"));

    parameter StateSelect ila_stateSelect = StateSelect.prefer "Priority to use cylinder total length and its derivative (velocity) as states"annotation (Dialog(group="Ideal linear actuator"));

    parameter SI.Length
        initialLength(
            min=ECparameters.boxLength+ECparameters.minPistonLength,
            max=ECparameters.boxLength+ECparameters.minPistonLength+ECparameters.workingStroke)
                =ECparameters.boxLength+ECparameters.minPistonLength+ECparameters.workingStroke/2
      "Initial total length, distance between frame_a and frame_b"
      annotation (Dialog(group="Ideal linear actuator"));

    parameter Boolean initialLengthFixed = true "=true, if you want to use the initial length (=initialLength) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Ideal linear actuator"),choices(checkBox=true));
    parameter Boolean initialVelFixed = false "=true, if you want to use the initial velocity (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Ideal linear actuator"),choices(checkBox=true));
    parameter Boolean initialAccFixed = false "=true, if you want to use the initial acceleration (=0) as initial eqation ('fixed' attributes)" annotation (Dialog(group="Ideal linear actuator"),choices(checkBox=true));

    parameter Real Tf = 0.05 "Time constant of the first order filter applied to the length ref. input" annotation (Dialog(group="Ideal linear actuator"));
    parameter Boolean enableLimiter = true
      "=true, if you want to limit the input ref. length within [minLength, maxLength] with (minLength = boxLength+minPistonLength ) and ( maxLength=minLength+workingStroke)"
      annotation (Dialog(group="Ideal linear actuator"));

// Spherical joint
    parameter Boolean sj_EnforceStates = false "=true, if the variables of the spherical joint have priority to be selected as states" annotation (Dialog(group="Spherical joint"));
    parameter Boolean sj_useQuaternions = false "= true, if quaternions shall be used as states otherwise use 3 angles as states (provided sj_enforceStates=true)" annotation (Dialog(group="Spherical joint"));
    parameter Boolean sj_initialAngularVelFixed = false "=true, if you want to use angular velocities (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    parameter Boolean sj_initialAngularAccFixed = false "=true, if you want to use angular accelerations (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Spherical joint"), choices(checkBox=true));
    
// Animation
    parameter SI.Diameter sphereDiameter(displayUnit = "mm") = 1/16 "Diameter of sphere representing the spherical joint" annotation (Dialog(group="Animation"));
    parameter SI.Distance cylinderLength(displayUnit = "mm") = 1/10 "Length of cylinders representing the universal joint" annotation (Dialog(group="Animation"));
    parameter SI.Distance cylinderDiameter(displayUnit = "mm") = 1/20 "Diameter of cylinders representing the universal joint" annotation (Dialog(group="Animation"));
    
// Models
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Frame for connection with a base's joint frame"
                                                            annotation (Placement(transformation(extent={{-174,-16},{-142,16}}), iconTransformation(extent={{-174,-16},{-142,16}})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Frame for connection with a platform's joint frame"
                                                            annotation (Placement(transformation(extent={{122,-16},{154,16}}), iconTransformation(extent={{122,-16},{154,16}})));
    Modelica.Mechanics.MultiBody.Joints.Spherical 
        spherical(
            enforceStates=sj_EnforceStates,
            useQuaternions=sj_useQuaternions,
            w_rel_a_fixed = sj_initialAngularVelFixed,
            z_rel_a_fixed = sj_initialAngularAccFixed,
            sphereDiameter=sphereDiameter)
        annotation (Placement(transformation(extent={{42,-10},{62,10}})));
    Modelica.Blocks.Interfaces.RealInput lengthRef "Leg length reference signal"
        annotation (Placement(transformation(
            extent={{20,-20},{-20,20}},
            rotation=90,
            origin={0,102})));
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
    IdealLinearActuator 
        idealLinearActuator(
            pj_stateSelect=ila_stateSelect,
            pj_initialLength=initialLength,
            pj_initialLengthFixed=initialLengthFixed,
            pj_initialVelFixed=initialVelFixed,
            pj_initialAccFixed=initialAccFixed,        
            enableLimiter=enableLimiter,
            Tf=Tf,
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
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation
  connect(spherical.frame_b, frame_b) annotation (Line(
      points={{62,0},{138,0}},
      color={95,95,95},
      thickness=0.5));
  connect(frame_a, universalJoint.frame_a) annotation (Line(
      points={{-158,0},{-110,0},{-110,0},{-60,0}},
      color={95,95,95},
      thickness=0.5));
  connect(universalJoint.frame_b, idealLinearActuator.frame_a) annotation (Line(
      points={{-40,0},{-10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(idealLinearActuator.frame_b, spherical.frame_a) annotation (Line(
      points={{10,0},{42,0}},
      color={95,95,95},
      thickness=0.5));
  connect(lengthRef, idealLinearActuator.lengthRef) annotation (Line(points={{0,102},{0,10.2}}, color={0,0,127}));

end IdealLeg;
