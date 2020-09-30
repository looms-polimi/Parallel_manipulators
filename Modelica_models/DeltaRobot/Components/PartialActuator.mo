within DeltaRobot.Components;

partial model PartialActuator "Partial model of a rotary actuator"

    // Parameters
    // GearReducer
    parameter DeltaRobot.Types.ReducerParameters reducerParameters "Parameters of the gearbox reducer" annotation (Dialog(group="Gearbox reducer"));

    // Initialization
    parameter SI.Angle initAngle = 0 "Initial angle" annotation(Dialog(group="Initialization"));
    parameter SI.AngularVelocity initAngularVel = 0 "Initial angular velocity" annotation(Dialog(group="Initialization"));
    parameter SI.AngularAcceleration initAngularAcc = 0 "Initial angular acceleration" annotation(Dialog(group="Initialization"));
    parameter Boolean initAngleFixed = false "=true, if you want to use the joint initial angle as initial equation" annotation(Dialog(group="Initialization"));
    parameter Boolean initAngularVelFixed = false "=true, if you want to use the joint initial angular velocity as initial equation" annotation(Dialog(group="Initialization"));
    parameter Boolean initAngularAccFixed = false "=true, if you want to use the joint initial angular acceleration as initial equation" annotation(Dialog(group="Initialization"));
    parameter StateSelect stateSelect = StateSelect.prefer "Priority to use actuator angle phi and w=der(phi) as states" annotation(Dialog(group="Initialization"));

    // Animation
    parameter SI.Distance actCylinderLength = 1/30 "Length of cylinder representing the actuator revolute joint" annotation(Dialog(group="Animation"));
    parameter SI.Diameter actCylinderDiameter = 1/30 "Diameter of cylinder representing the actuator revolute joint" annotation(Dialog(group="Animation"));

    // Variables (useful to plot results of simulations)
    SI.Angle theta "Rotation angle around z-axis from frame_a to frame_b";
    SI.AngularVelocity velocity "First derivative of 'theta' (=der(theta))";
    SI.AngularAcceleration acceleration "Second derivative of 'theta' (=der(velocity))";
    SI.Torque torque "Torque applied to the arm, after the reducer";
    /* // RIMUOVI COMMENTI SE USI 'Modelica.Mechanics.Rotational.Components.LossyGear'
    SI.Torque drivingTorque "Torque applied to the gearbox reducer";
    SI.AngularVelocity drivingSpeed "Speed applied to the gearbox reducer";
    */

    // Models
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{84,-16},{116,16}})));
    
    Modelica.Mechanics.MultiBody.Joints.Revolute revolute(
        phi(fixed= initAngleFixed, start=initAngle),
        w(fixed = initAngularVelFixed, start = initAngularVel),
        a(fixed = initAngularAccFixed, start = initAngularAcc),
        cylinderDiameter=actCylinderDiameter,
        cylinderLength=actCylinderLength,        
        stateSelect=stateSelect,
        useAxisFlange=true)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

    GearReducer gearReducer(reducerParameters=reducerParameters) annotation (Placement(transformation(extent={{-22,26},{-2,46}})));

equation
  theta = revolute.phi;
  velocity = revolute.w;
  acceleration = revolute.a;
  torque = revolute.tau;
  /* // RIMUOVI COMMENTI SE USI 'Modelica.Mechanics.Rotational.Components.LossyGear'
  drivingTorque = gearReducer.flange_a.tau;
  drivingSpeed = gearReducer.w_a;
  */

  connect(revolute.frame_b, frame_b) annotation (Line(points={{10,0},{100,0}},color={95,95,95},thickness=0.5));
  connect(gearReducer.flange_b, revolute.axis) annotation (Line(points={{-2,36},{0,36},{0,10}}, color={0,0,0}));
  connect(frame_a, revolute.frame_a) annotation(Line(points = {{-100, 0}, {-10, 0}, {-10, 0}, {-10, 0}}));  

end PartialActuator;
