within DeltaRobot.Types;

package Units "Library of new type and unit definitions"
    extends DeltaRobot.Icons.Units; // Icon

    type Direction = enumeration(
        up   "up: direction from x-y plane along positive z axis",
        down "down: direction from x-y plane along negative z axis") 
            "Enumeration used to select the cylinder direction in the model 'Disc'";

    type SwitchTimeDef = enumeration(
        periods   "periods: define the duration of each signal",
        swithInstants   "swithInstants: define when to switch between two signals") 
            "Enumeration used to select how to define the switch time instants.";

end Units;