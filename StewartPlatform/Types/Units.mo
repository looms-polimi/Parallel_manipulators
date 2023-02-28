within StewartPlatform.Types;

package Units "Library of new type and unit definitions"
    extends StewartPlatform.Icons.Units; // Icon

    type Pitch = Real (final quantity="Pitch",final  unit="mm/rev",min=0) "Millimeters of displacement for each revolution of the spindle/screw";

    type Direction = enumeration(
        up   "up: direction from x-y plane along positive z axis",
        down "down: direction from x-y plane along negative z axis") 
            "Enumeration used to select the cylinder direction in the model 'Disc'";

    type SwitchTimeDef = enumeration(
        periods   "periods: define the duration of each signal",
        swithInstants   "swithInstants: define when to switch between two signals") 
            "Enumeration used to select how to define the switch time instants.";
            
end Units;