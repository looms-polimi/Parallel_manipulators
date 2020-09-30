within DeltaRobot.Components;
model Controller
  extends DeltaRobot.Icons.Controller;

  //Parameters
    outer DeltaRobot.Components.GlobalParameters gp "Object with all global parameters";

    parameter DeltaRobot.Types.DiscParameters platform = gp.platform "Platform parameters";
    parameter DeltaRobot.Types.DiscParameters base = gp.base "Base parameters";
    parameter DeltaRobot.Types.ArmParameters armParameters = gp.armParameters "Arms parameters";
    parameter Real ratio = gp.reducerParameters.ratio "Reducer ratio";
    parameter SI.Torque initOutputs = -1.33135 "Initial value of the torque commands (Controller outputs)";

    //Controller
    parameter Modelica.Blocks.Types.SimpleController controllerType = Modelica.Blocks.Types.SimpleController.PID "Type of controllers" annotation(Dialog(group="PID parameters"));
    parameter Real P(min=0, unit="1") = gp.SMparameters.Tmax/500 "Proportional action" annotation(Dialog(group="PID parameters"));
    parameter SI.Time Ti(min=Modelica.Constants.small) = 0.5 "Time constant of Integrator blocks"
      annotation(Dialog(group="PID parameters",enable=controllerType==Modelica.Blocks.Types.SimpleController.PI or controllerType==Modelica.Blocks.Types.SimpleController.PID));
    parameter SI.Time Td(min=0)= 0.01 "Time constant of Derivative blocks"
      annotation(Dialog(group="PID parameters",enable=controllerType==Modelica.Blocks.Types.SimpleController.PD or controllerType==Modelica.Blocks.Types.SimpleController.PID));
    parameter SI.Time preFilterTimeConstant = 0.1 "Time constant of the prefilter applied to legth ref." annotation(Dialog(group="PID parameters"));
    parameter SI.Time postFilterTimeConstant = 0.001 "Time constant of the postfilter (additional pole)" annotation(Dialog(group="PID parameters"));
    parameter SI.Torque maxOutput = gp.SMparameters.Tmax "The controllers output are limited within [-maxOutput,maxOutput]" annotation(Dialog(group="PID parameters"));

    //Inverse kinematic
    parameter Boolean limitOutputs = true "=true, if you want to limit the outputs within [minTheta,maxTheta]"
      annotation(Dialog(group="Inverse kinematic - Limits"), choices(checkBox=true));
    parameter Boolean stopWhenSaturated = true "When a saturation is detected all output signals maintein their current values until all output signals return within the limits"
     annotation(Dialog(group="Inverse kinematic - Limits", enable = limitOutputs));
    parameter SI.Angle maxTheta = gp.maxTheta "Max leg length" annotation(Dialog(group="Inverse kinematic - Limits"));
    parameter SI.Angle minTheta = gp.minTheta "Min leg length" annotation(Dialog(group="Inverse kinematic - Limits"));

    parameter SI.Time T_velocity(min=Modelica.Constants.small) = 0.01 "Time constants for velocity derivative (T>0 required; T=0 is ideal derivative block)"
      annotation(Dialog(group="Inverse kinematic - Additional parameters (no effects on the simulation)"));
    parameter SI.Time T_acc(min=Modelica.Constants.small) = 0.1 "Time constants for acceleration derivative (T>0 required; T=0 is ideal derivative block)"
      annotation(Dialog(group="Inverse kinematic - Additional parameters (no effects on the simulation)"));

  Interfaces.Pose inputPose "Desired pose for the platform resolved in base frame" annotation (Placement(transformation(extent={{-130,-30},{-70,30}})));
  ReferenceSignals.InverseKinematic inverseKinematic(platform=platform, base=base,
    armParameters=armParameters,
    limitOutputs=limitOutputs,
    stopWhenSaturated=stopWhenSaturated,
    maxTheta=maxTheta,
    minTheta=minTheta,
    T_velocity=T_velocity,
    T_acc=T_acc)                                                                   annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
  Modelica.Blocks.Continuous.FirstOrder preFilter[3](each T=preFilterTimeConstant, each initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Blocks.Math.Gain gain[3](each k=ratio) annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Continuous.LimPID PID[3](
    each controllerType=controllerType,
    each k=P,
    each Ti=Ti,
    each Td=Td,
    each yMax=maxOutput,
    each initType=Modelica.Blocks.Types.InitPID.InitialOutput,
    each xi_start=initOutputs,
    each y_start=initOutputs,
    each xd_start=0)     annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Continuous.FirstOrder postFilter[3](each T=postFilterTimeConstant) annotation (Placement(transformation(extent={{56,-10},{76,10}})));
  Interfaces.ControlBus controlBus
    annotation (Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
        extent={{-22,-22},{22,22}},
        rotation=90,
        origin={100,0})));
equation
  connect(inverseKinematic.pose, inputPose) annotation (Line(points={{-72,0},{-100,0}}, color={0,0,0}));
  connect(preFilter.u, inverseKinematic.theta) annotation (Line(points={{-44,0},{-51.4,0}}, color={0,0,127}));
  connect(preFilter.y, gain.u) annotation (Line(points={{-21,0},{-14,0}}, color={0,0,127}));
  connect(gain.y, PID.u_s) annotation (Line(points={{9,0},{18,0}}, color={0,0,127}));
  connect(PID.y, postFilter.u) annotation (Line(points={{41,0},{54,0}}, color={0,0,127}));
  connect(postFilter[1].y, controlBus.axisControlBus1.refTorque) annotation (Line(points={{77,0},{88,0},{88,0.05},{100.05,0.05}}, color={0,0,127}));
  connect(postFilter[2].y, controlBus.axisControlBus2.refTorque) annotation (Line(points={{77,0},{88,0},{88,0.05},{100.05,0.05}}, color={0,0,127}));
  connect(postFilter[3].y, controlBus.axisControlBus3.refTorque) annotation (Line(points={{77,0},{88,0},{88,0.05},{100.05,0.05}}, color={0,0,127}));
  connect(PID[1].u_m, controlBus.axisControlBus1.encoder) annotation (Line(points={{30,-12},{30,-40},{100.05,-40},{100.05,0.05}}, color={0,0,127}));
  connect(PID[2].u_m, controlBus.axisControlBus2.encoder) annotation (Line(points={{30,-12},{30,-40},{100.05,-40},{100.05,0.05}}, color={0,0,127}));
  connect(PID[3].u_m, controlBus.axisControlBus3.encoder) annotation (Line(points={{30,-12},{30,-40},{100.05,-40},{100.05,0.05}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Controller;
