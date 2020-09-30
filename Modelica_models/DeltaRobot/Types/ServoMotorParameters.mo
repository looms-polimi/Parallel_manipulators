within DeltaRobot.Types;

record ServoMotorParameters "Parameters of a servo motor"
    extends DeltaRobot.Icons.Record; // Icon    

    parameter DeltaRobot.Types.Units.PolePairs np = 4 "Number of pole pairs (Integer)" annotation (Dialog(group="Servo motor"));
    parameter SI.Resistance Rs(min=0) = 3.14 "Stator resistance per phase" annotation (Dialog(group="Servo motor"));
    parameter SI.Inductance L(min=0) = 0.0033 "Stator inductance per phase" annotation (Dialog(group="Servo motor"));
    parameter SI.ElectricalTorqueConstant Psi(min=0) = 0.12 "Torque constant (T=np*Psi*i_sq)" annotation (Dialog(group="Servo motor"));
    parameter Real Ke(unit="V/(rad/s)",min=0) = Psi "Voltage constant, the induced motor EMF is 'E=Ke*omega' where 'omega=electrical_speed'" annotation (Dialog(group="Servo motor"));
    parameter SI.Inertia J(min=0) = 1.37e-4 "Rotor moment of inertia" annotation (Dialog(group="Servo motor"));
    parameter SI.Mass weight = 3.8 "Mass" annotation (Dialog(group="Servo motor"));
    parameter SI.Torque Tmax(min=0) = 8.2 "Max torque" annotation (Dialog(group="Servo motor"));

    parameter SI.Frequency bandwidth(min=0) = 10000 "Bandwidth of the torque control"; annotation (Dialog(group="Servo drive"));
    parameter SI.Voltage Vmax(min=0)= 200 "Inverter max voltage" annotation (Dialog(group="Servo drive"));    

    final parameter SI.Current Imax(min=0) = Tmax/np/Psi "Inverter max current";
    final parameter SI.Inductance Ls(min=0) = 3/2*L "Synchronous inductance";
end ServoMotorParameters;
