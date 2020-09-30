within DeltaRobot.Types;

package Units "Library of new type and unit definitions"
    extends DeltaRobot.Icons.Units; // Icon

    type Direction = enumeration(
        up   "up: direction from x-y plane along positive z axis",
        down "down: direction from x-y plane along negative z axis") 
            "Enumeration used to select the cylinder direction in the model 'Disc'";

    type PolePairs = Integer(
        final quantity="PolePairs",
        min=1);
end Units;