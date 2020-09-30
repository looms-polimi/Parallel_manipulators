within DeltaRobot.Components;
model ServoMotor "Permanent magnet synchronous induction machine"
  extends DeltaRobot.Icons.ServoMotor;

  //Parameter
    parameter DeltaRobot.Types.ServoMotorParameters SMparameters;

    //(Redefinition of parameters to simplify the code below)
protected
    parameter SI.Frequency bandwidth = SMparameters.bandwidth "Bandwidth of the internal torque control" annotation(HideResult=true);
    parameter Integer np = SMparameters.np "Number of pole pairs (Integer)" annotation(HideResult=true);
    parameter SI.Resistance Rs = SMparameters.Rs "Stator resistance per phase" annotation(HideResult=true);
    parameter SI.Inductance L = SMparameters.L "Stator inductance per phase" annotation(HideResult=true);
    parameter SI.ElectricalTorqueConstant Psi = SMparameters.Psi "Torque constant, T=np*Psi*i_sq" annotation(HideResult=true);
    parameter Real Ke(unit="V/(rad/s)",min=0) = SMparameters.Ke "Voltage constant, the induced motor EMF is E=Ke*omega, omega = electrical_speed" annotation(HideResult=true);

    parameter SI.Voltage Vmax= SMparameters.Vmax "Inverter max voltage" annotation(HideResult=true);
    parameter SI.Torque Tmax = SMparameters.Tmax "Max torque" annotation(HideResult=true);
    parameter SI.Current Imax = SMparameters.Imax "Inverter max current" annotation(HideResult=true);

    parameter SI.Inductance Ls = SMparameters.Ls "Synchronous inductance" annotation(HideResult=true);

  //Variables
public
    SI.Torque Tref "Reference mechanical torque for shaft (flange.tau), limited in [-Tmax,Tmax]";
    SI.Torque T "Mechanical torque of shaft (flange.tau)";

    SI.Angle theta "Absolute electrical rotation angle (theta = phi*np)";
    SI.AngularVelocity omega "Electrical angular velocity (der(theta))";

    SI.Angle phi "Absolute mechanical rotation angle (flange.phi)";
    SI.AngularVelocity w "Mechanical angular velocity (der(phi))";

    SI.Current is_d "Stator current space phasor with respect to the rotor fixed frame d-q";
    SI.Current is_q "Stator current space phasor with respect to the rotor fixed frame d-q";
    SI.Voltage Vs_d "Stator voltage space phasor with respect to the rotor fixed frame d-q";
    SI.Voltage Vs_q "Stator voltage space phasor with respect to the rotor fixed frame d-q";
    SI.Current is "Module of the stator current space phasor";
    SI.Voltage Vs "Module of the stator voltage space phasor";
    SI.Voltage EMF "Induced electromotive force";

    SI.Current is_q0 "Current component required to reproduce Tref";

    SI.Angle alpha "Angle between Vs_q axis and the space phasor Vs = Vs_d + j*Vs_q";
    SI.Power Pmecc "Output mechanical power";
    SI.Power Pelect "Input electric power";
    SI.AngularVelocity omega_b "Base velocity";

  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Shaft" annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Interfaces.AxisControlBus axisControlBus
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}}), iconTransformation(
        extent={{-24,24},{24,-24}},
        rotation=90,
        origin={-58,4})));

protected
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Tmax, uMin=-Tmax) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation (Placement(transformation(extent={{80,-50},{60,-30}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (Placement(transformation(extent={{80,30},{60,50}})));
  Modelica.Blocks.Continuous.FirstOrder controlBandwidth(T=1/bandwidth)
                                                         annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Real C_omega_b[2,2] "Variable for complex solutions of omega_b";


public
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=SMparameters.J) annotation (Placement(transformation(extent={{66,-10},{86,10}})));
equation
  //Check correctness of the parameters
  assert(SMparameters.Vmax>=SMparameters.Imax*SMparameters.Rs,"ServoMotor: The max voltage is not sufficient to provide the max current (Vmax<Imax*Rs).", level = AssertionLevel.error);
  assert(SMparameters.Psi>0,"ServoMotor: The parameter 'Psi' must be greater then zero, otherwise no torque can be applied.", level = AssertionLevel.error);
  assert(SMparameters.L>0,"ServoMotor: The parameter 'L' must be greater then zero.", level = AssertionLevel.warning);
  assert(SMparameters.Ke>0,"ServoMotor: The parameter 'Ke must be greater then zero.", level = AssertionLevel.warning);
  assert(SMparameters.bandwidth>0,"ServoMotor: The parameter 'bandwidth' must be greater then zero.", level = AssertionLevel.error);

  phi = angleSensor.phi;
  w = speedSensor.w;

  theta = phi*np;
  omega = w*np;

  torque.tau = T;

  Tref = controlBandwidth.y; //Saturation of input torqueRef within [Tmax, -Tmax] -> signal Tref

  is_q0 = Tref/np/Psi; //Computation of the current component required to reproduce Tref

  (is_d,is_q) = DeltaRobot.Functions.servoMotorCurrents(
    Rs,
    omega,
    Ls,
    Ke,
    Vmax,
    Imax,
    is_q0); //Computation of the current components is_q and is_d that can be applied with respect to the current and voltage limits

  Vs_d = Rs*is_d-omega*Ls*is_q;
  Vs_q = Rs*is_q+omega*Ke+omega*Ls*is_d;

  T = np*Psi*is_q;

  is = sqrt(is_d^2+is_q^2);
  Vs = sqrt(Vs_d^2+Vs_q^2);
  EMF = omega*Ke;
  alpha = Modelica.Math.atan2(Vs_d,Vs_q);
  Pmecc = w*T;
  Pelect = Vs_d*is_d + Vs_q*is_q; //Real(Vs*conj(is)) with Vs and is space phasor vectors

  C_omega_b = Modelica.Math.Vectors.Utilities.roots({(Ls^2*is_q^2+Ke^2), (2*Rs*Ke*is_q), (Rs^2*is_q^2-Vmax^2)});
  omega_b = if sign(C_omega_b[1,1])==sign(omega) then C_omega_b[1,1] else C_omega_b[2,1];

  connect(angleSensor.flange, flange) annotation (Line(points={{80,-40},{100,-40},{100,0}}, color={0,0,0}));
  connect(speedSensor.flange, flange) annotation (Line(points={{80,40},{100,40},{100,0}}, color={0,0,0}));
  connect(limiter.y, controlBandwidth.u) annotation (Line(points={{-19,0},{-12,0}}, color={0,0,127}));
  connect(axisControlBus.refTorque, limiter.u) annotation (Line(
      points={{-59.95,0.05},{-50,0.05},{-50,0},{-42,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(angleSensor.phi, axisControlBus.encoder)
    annotation (Line(points={{59,-40},{-59.95,-40},{-59.95,0.05}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(flange, inertia.flange_b) annotation (Line(points={{100,0},{86,0}}, color={0,0,0}));
  connect(torque.flange, inertia.flange_a) annotation (Line(points={{52,0},{66,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="CopiatoDaSP");
end ServoMotor;
