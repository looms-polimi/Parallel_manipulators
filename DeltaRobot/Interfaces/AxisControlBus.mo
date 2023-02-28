within DeltaRobot.Interfaces;

expandable connector AxisControlBus "Data bus for one axis"
    extends DeltaRobot.Icons.AxisControlBus; // Icon

    SI.Angle angularPos "Shaft absolute angle";
    SI.AngularVelocity angularVel "Shaft angular velocity";
    SI.AngularAcceleration angularAcc "Shaft angular acceleration";
    SI.Torque refTorque "Reference value for the torque";
    SI.Torque appliedTorque "Applied torque";

end AxisControlBus;
