within DeltaRobot.Types;

record ActuatorParameters "Parameters of a rotatry actuator"
    extends DeltaRobot.Icons.Record; // Icon

    parameter StateSelect stateSelect = StateSelect.prefer "Priority to use actuator angle phi and w=der(phi) as states (revolute joint model)";

    // Initialization
    parameter SI.Angle initialAngle = 0 "Initial angle" annotation(Dialog(group="Initialization"));
    final parameter SI.AngularVelocity initialAngularVel = 0 "Initial angular velocity" annotation(Dialog(group="Initialization"));
    final parameter SI.AngularAcceleration initialAngularAcc = 0 "Initial angular acceleration" annotation(Dialog(group="Initialization"));
    parameter Boolean initialAngleFixed = false "=true, if you want to use the joint initial angle (=initialAngle) as initial equation ('fixed' attributes)" annotation(Dialog(group="Initialization"));
    parameter Boolean initialAngularVelFixed = false "=true, if you want to use the joint initial angular velocity (=0) as initial equation ('fixed' attributes)" annotation(Dialog(group="Initialization"));
    parameter Boolean initialAngularAccFixed = false "=true, if you want to use the joint initial angular acceleration (=0) as initial equation ('fixed' attributes)" annotation(Dialog(group="Initialization"));

    // First order filter (IdealActuatorPos and IdealActuatorVel)
    parameter Real Tf = 0.01 "Time constant of the first order filter applied to the input reference signal" annotation (Dialog(group="First order filter"));
    parameter Modelica.Blocks.Types.Init initType = Modelica.Blocks.Types.Init.NoInit "Type of initialization of first order filter (1: no init, 2: steady state, 3/4: initial output)" annotation(Dialog(group="First order filter"));
    parameter Real y_start = 0 "Initial or guess value of first order filter output (= state)" annotation (Dialog(group="First order filter"));
    parameter Boolean y_startFixed = false "=true, if you want to use the filter initial output as initial equation" annotation (Dialog(group="First order filter"));
    
    // Limits (only IdealActuatorPos)
    parameter Boolean enableLimiter = true "=true, if you want to limit the input reference angle within interval [minTheta, maxTheta]" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxTheta = from_deg(85) "Max actuator angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle minTheta = from_deg(-85) "Min actuator angle" annotation(Dialog(group="Limits"));


    // Animation
    parameter SI.Distance cylinderLength = 1/30 "Length of cylinder representing the actuator revolute joint" annotation(Dialog(group="Animation"));
    parameter SI.Diameter cylinderDiameter = 1/30 "Diameter of cylinder representing the actuator revolute joint" annotation(Dialog(group="Animation"));

end ActuatorParameters;
