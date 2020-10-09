within DeltaRobot.Types;

record ServoMotorParameters "Parameters of a servo motor"
    extends DeltaRobot.Icons.Record; // Icon    

    parameter SI.Inertia J(min=0) = 1.37e-4 "Rotor moment of inertia" annotation (Dialog(group="Servo motor"));
    parameter SI.Mass weight = 3.8 "Mass" annotation (Dialog(group="Servo motor"));
    parameter SI.Torque Tmax(min=0) = 8.2 "Max torque" annotation (Dialog(group="Servo motor"));
    parameter SI.Frequency bandwidth(min=0) = 10000 "Bandwidth of the torque control"; annotation (Dialog(group="Servo motor"));

end ServoMotorParameters;
