within DeltaRobot.Types;

record ReducerParameters "Parameters of a gear reducer"
    extends DeltaRobot.Icons.Record; // Icon    

    parameter Real ratio(min=0) = 20  "Transmission ratio (flange_a.phi/flange_b.phi)";

end ReducerParameters;