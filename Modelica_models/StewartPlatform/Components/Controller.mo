within StewartPlatform.Components;

model Controller "Cascade of controllers to control the axes"
  extends StewartPlatform.Icons.Controller;

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp "Object with all global parameters";

    parameter StewartPlatform.Types.DiscParameters platform = gp.platform "Platform parameters";
    parameter StewartPlatform.Types.DiscParameters base = gp.base "Base parameters";
    parameter StewartPlatform.Types.Pitch spindlePitch = gp.ECparameters.spindlePitch "Spindle pitch of the electric cylinder for rotation-dispacement conversion";
    parameter Real ratio = gp.ECparameters.ratio "Transmission ratio (servomotor.phi/spindle.phi)";
    parameter SI.Torque initOutputs = 0.01107 "Initial value of the torque commands (Controller outputs)";

// Controller
    parameter Modelica.Blocks.Types.SimpleController controllerType = Modelica.Blocks.Types.SimpleController.PID "Type of controllers" annotation(Dialog(group="PID parameters"));
    parameter Real P(min=0, unit="1") = gp.SMparameters.Tmax/500 "Proportional action" annotation(Dialog(group="PID parameters"));
    parameter SI.Time Ti(min=Modelica.Constants.small) = 0.5 "Time constant of Integrator blocks"
      annotation(Dialog(group="PID parameters",enable=controllerType==Modelica.Blocks.Types.SimpleController.PI or controllerType==Modelica.Blocks.Types.SimpleController.PID));
    parameter SI.Time Td(min=0)= 0.01 "Time constant of Derivative blocks"
      annotation(Dialog(group="PID parameters",enable=controllerType==Modelica.Blocks.Types.SimpleController.PD or controllerType==Modelica.Blocks.Types.SimpleController.PID));
    parameter SI.Time preFilterTimeConstant = 0.1 "Time constant of the prefilter applied to legth ref." annotation(Dialog(group="PID parameters"));
    parameter SI.Time postFilterTimeConstant = 0.001 "Time constant of the postfilter (additional pole)" annotation(Dialog(group="PID parameters"));
    parameter SI.Torque maxOutput = gp.SMparameters.Tmax "The controllers output are limited within [-maxOutput,maxOutput]" annotation(Dialog(group="PID parameters"));

// Inverse kinematic
    parameter Boolean limitOutputs = true "=true, if you want to limit the outputs within [minLength,maxLength]"
      annotation(Dialog(group="Inverse kinematic - Limits"), choices(checkBox=true));
    parameter Boolean stopWhenSaturated = true "When a saturation is detected all output signals maintein their current values until all output signals return within the limits"
     annotation(Dialog(group="Inverse kinematic - Limits", enable = limitOutputs));
    parameter SI.Length maxLength = gp.maxLength "Max leg length" annotation(Dialog(group="Inverse kinematic - Limits"));
    parameter SI.Length minLength = gp.minLength "Min leg length" annotation(Dialog(group="Inverse kinematic - Limits"));

    parameter SI.Time T_velocity(min=Modelica.Constants.small) = 0.01 "Time constants for velocity derivative (T>0 required; T=0 is ideal derivative block)"
      annotation(Dialog(group="Inverse kinematic - Additional parameters (no effects on the simulation)"));
    parameter SI.Time T_acc(min=Modelica.Constants.small) = 0.1 "Time constants for acceleration derivative (T>0 required; T=0 is ideal derivative block)"
      annotation(Dialog(group="Inverse kinematic - Additional parameters (no effects on the simulation)"));

// Models
  Interfaces.Pose inputPose "Desired pose for the platform resolved in base frame"
    annotation (Placement(transformation(extent={{-120,-30},{-60,30}}), iconTransformation(extent={{-120,-30},{-60,30}})));
  ReferenceSignals.InverseKinematic inverseKinematic(
    platform=platform,
    base=base,
    limitOutputs=limitOutputs,
    stopWhenSaturated=stopWhenSaturated,
    maxLength=maxLength,
    minLength=minLength,
    T_velocity=T_velocity,
    T_acc=T_acc)
        annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));

  Modelica.Blocks.Continuous.LimPID PID[6](
    each yMax=maxOutput,
    each controllerType=controllerType,
    each k=P,
    each Ti=Ti,
    each Td=Td,
    each y_start=initOutputs,
    each initType=if controllerType <> Modelica.Blocks.Types.SimpleController.P then Modelica.Blocks.Types.Init.InitialOutput else Modelica.Blocks.Types.Init.NoInit)
        annotation (Placement(transformation(extent={{34,-10},{54,10}})));

  Interfaces.ControlBus controlBus 
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={100,0}), iconTransformation(
        extent={{-18,18},{18,-18}},
        rotation=90,
        origin={100,-2})));

  Modelica.Blocks.Math.Gain gain[6](each k=ratio*2*pi*1000/spindlePitch) annotation (Placement(transformation(extent={{2,-10},{22,10}})));

  Modelica.Blocks.Continuous.FirstOrder preFilter[6](each T=preFilterTimeConstant, each initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Continuous.FirstOrder postFilter[6](each initType=Modelica.Blocks.Types.Init.SteadyState, each T=postFilterTimeConstant) annotation (Placement(transformation(extent={{68,-10},{88,10}})));
equation
  connect(inverseKinematic.pose, inputPose) annotation (Line(points={{-65,0},{-90,0}}, color={0,0,0}));
  connect(inverseKinematic.legLength, preFilter.u) annotation (Line(points={{-45.4,0},{-32,0}}, color={0,0,127}));
  connect(preFilter.y, gain.u) annotation (Line(points={{-9,0},{0,0}}, color={0,0,127}));
  connect(gain.y, PID.u_s) annotation (Line(points={{23,0},{32,0}}, color={0,0,127}));
  connect(PID.y, postFilter.u) annotation (Line(points={{55,0},{66,0}}, color={0,0,127}));
  
  connect(postFilter[1].y, controlBus.axisControlBus1.refTorque) annotation (Line(points={{89,0},{94,0},{94,0.05},{100.05,0.05}}, color={0,0,127}));
  connect(postFilter[2].y, controlBus.axisControlBus2.refTorque);
  connect(postFilter[3].y, controlBus.axisControlBus3.refTorque);
  connect(postFilter[4].y, controlBus.axisControlBus4.refTorque);
  connect(postFilter[5].y, controlBus.axisControlBus5.refTorque);
  connect(postFilter[6].y, controlBus.axisControlBus6.refTorque);

  connect(PID[1].u_m, controlBus.axisControlBus1.encoder) annotation (Line(points={{44,-12},{44,-40},{100.05,-40},{100.05,0.05}}, color={0,0,127}));
  connect(PID[2].u_m, controlBus.axisControlBus2.encoder);
  connect(PID[3].u_m, controlBus.axisControlBus3.encoder);
  connect(PID[4].u_m, controlBus.axisControlBus4.encoder);
  connect(PID[5].u_m, controlBus.axisControlBus5.encoder);
  connect(PID[6].u_m, controlBus.axisControlBus6.encoder);
  
end Controller;
