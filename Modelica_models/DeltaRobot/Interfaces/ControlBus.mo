within DeltaRobot.Interfaces;

expandable connector ControlBus "Data bus for all axes"
    extends DeltaRobot.Icons.ControlBus; // Icon

    AxisControlBus axisControlBus1 "Bus of axis 1";
    AxisControlBus axisControlBus2 "Bus of axis 2";
    AxisControlBus axisControlBus3 "Bus of axis 3";
    
end ControlBus;
