within DeltaRobot.Types;

record ReducerParameters "Parameters of a gear reducer"
    extends DeltaRobot.Icons.Record; // Icon    

    parameter Real ratio(min=0) = 20  "Transmission ratio (flange_a.phi/flange_b.phi)";
    parameter SI.Torque coulombOffset_a(min=0) = 0 "Static friction in bearing friction torque on the flange_a side";
    parameter SI.Torque coulombOffset_b(min=0) = 0 "Static friction in bearing friction torque on the flange_b side";
    parameter Real viscousCoeff_a(min=0) = 0 "Viscous friction coefficient in bearing friction torque on the flange_a side";
    parameter Real viscousCoeff_b(min=0) = 0 "Viscous friction coefficient in bearing friction torque on the flange_b side";
    parameter Real eta_mf1(unit="1") = 1 "Mesh efficiency in case that flange_a is driving";
    parameter Real eta_mf2(unit="1") = 1 "Mesh efficiency in case that flange_b is driving";
end ReducerParameters;