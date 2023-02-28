within DeltaRobot.Components;

partial model PartialActuator "Partial model of a rotary actuator"

    // Parameters
    parameter DeltaRobot.Types.ReducerParameters reducerParameters "Parameters of the gearbox reducer";
    parameter DeltaRobot.Types.ActuatorParameters actuatorParameters "Parameters of the rotary actuator";  

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
        phi(fixed = actuatorParameters.initialAngleFixed, start = actuatorParameters.initialAngle),
        w(fixed = actuatorParameters.initialAngularVelFixed, start = actuatorParameters.initialAngularVel),
        a(fixed = actuatorParameters.initialAngularAccFixed, start = actuatorParameters.initialAngularAcc),
        cylinderDiameter = actuatorParameters.cylinderDiameter,
        cylinderLength = actuatorParameters.cylinderLength,        
        stateSelect = actuatorParameters.stateSelect,
        useAxisFlange = true)
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
