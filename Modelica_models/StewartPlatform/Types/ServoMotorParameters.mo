within StewartPlatform.Types;

record ServoMotorParameters "Parameters of a servo motor"
    extends StewartPlatform.Icons.Record; // Icon  

    parameter SI.Inertia J(min=0) = 1.37e-4 "Rotor moment of inertia";
    parameter SI.Mass weight = 3.8 "Mass";
    parameter SI.Torque Tmax(min=0) = 8.2 "Max torque";
    parameter SI.Frequency bandwidth(min=0) = 10000 "Bandwidth of the torque control";

end ServoMotorParameters;
