within DeltaRobot.Types;

record ServoMotorParameters "Parameters of a servo motor"
    extends DeltaRobot.Icons.Record; // Icon  

    parameter SI.Inertia J(min=0) = 1.37e-4 "Rotor moment of inertia";
    parameter SI.Mass weight = 3.8 "Mass";
    parameter SI.Torque Tmax(min=0) = 8.2 "Max torque";
    parameter Boolean enableLimiter = true "=true, if you want to limit the input reference torque within interval [-Tmax, Tmax]"; annotation (choices(checkBox=true));

end ServoMotorParameters;
