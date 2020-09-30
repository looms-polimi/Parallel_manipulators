within DeltaRobot.Components;
partial model PartialActuator "Partial model of a rotary actuator"

  //Parameters
    parameter SI.Angle alpha = 0 "Fix rotation around z-axis of frame_a to make x-axis normal and z-axis tangent to the base circumference";

    //Reducer
    parameter DeltaRobot.Types.ReducerParameters reducerParameters "Parameters of the gear reducer" annotation (Dialog(group="Servo motor"));

    //Initialization
    parameter SI.Angle initialAngle = 0 "Initial joint angle" annotation(Dialog(group="Initialization"));
    parameter Boolean initialAngleFixed = false "=true, if you want to use 'initialAngle' as initial eqation" annotation(Dialog(group="Initialization"));
    parameter StateSelect stateSelect = StateSelect.prefer "Priority to use actuator angle phi and w=der(phi) as states" annotation(Dialog(group="Initialization"));

    //Animation
    parameter SI.Distance cylinderLength = 1/30 "Length of cylinder representing the joint axis" annotation(Dialog(group="Animation"));
    parameter SI.Diameter cylinderDiameter = 1/30 "Diameter of cylinder representing the joint axis" annotation(Dialog(group="Animation"));

  //Variables
    SI.Angle theta "Rotation angle around z-axis from frame_a to frame_b";
    SI.AngularVelocity velocity "First derivative of 'theta' (=der(theta))";
    SI.AngularAcceleration acceleration "Second derivative of 'theta' (=der(velocity))";
    SI.Torque torque "Torque applied to the arm, after the reducer";
    SI.Torque drivingTorque "Torque applied to the gearbor reducer";
    SI.AngularVelocity drivingSpeed "Speed applied to the gearbor reducer";

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation(
    rotationType=Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence,
    sequence={3,1,3},
    angles={to_deg(alpha),-90,0})                                annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange=true,
    stateSelect=stateSelect,
    phi(fixed=initialAngleFixed, start=initialAngle),
    cylinderLength=cylinderLength,
    cylinderDiameter=cylinderDiameter)                                               annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  GearReducer gearReducer(reducerParameters=reducerParameters)
                          annotation (Placement(transformation(extent={{-22,26},{-2,46}})));
equation
  theta = revolute.phi;
  velocity = revolute.w;
  acceleration = revolute.a;
  torque = revolute.tau;
  drivingTorque = gearReducer.flange_a.tau;
  drivingSpeed = gearReducer.w_a;

  connect(frame_a, fixedRotation.frame_a) annotation (Line(
      points={{-100,0},{-54,0}},
      color={95,95,95},
      thickness=0.5));

  connect(fixedRotation.frame_b, revolute.frame_a) annotation (Line(
      points={{-34,0},{-10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute.frame_b, frame_b) annotation (Line(
      points={{10,0},{100,0}},
      color={95,95,95},
      thickness=0.5));
  connect(gearReducer.flange_b, revolute.axis) annotation (Line(points={{-2,36},{0,36},{0,10}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="Finito");
end PartialActuator;
