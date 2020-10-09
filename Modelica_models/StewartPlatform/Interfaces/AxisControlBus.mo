within StewartPlatform.Interfaces;

expandable connector AxisControlBus "Data bus for one axis"
    extends StewartPlatform.Icons.AxisControlBus; // Icon

    SI.Angle encoder "Shaft absolute angle";
    SI.Torque refTorque "Reference value for the torque";

end AxisControlBus;
