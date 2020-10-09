within StewartPlatform.Interfaces;

expandable connector ControlBus "Data bus for all axes"
    extends StewartPlatform.Icons.ControlBus; // Icon

    AxisControlBus axisControlBus1 "Bus of axis 1";
    AxisControlBus axisControlBus2 "Bus of axis 2";
    AxisControlBus axisControlBus3 "Bus of axis 3";
    AxisControlBus axisControlBus4 "Bus of axis 6";
    AxisControlBus axisControlBus5 "Bus of axis 7";
    AxisControlBus axisControlBus6 "Bus of axis 8";
    
end ControlBus;
