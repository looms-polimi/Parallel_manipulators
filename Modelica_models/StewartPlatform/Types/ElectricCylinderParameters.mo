within StewartPlatform.Types;

record ElectricCylinderParameters "Parameters of an electric cylinder with spindle drive"
    extends StewartPlatform.Icons.Record; // Icon

    parameter StateSelect stateSelect = StateSelect.prefer "Priority to use cylinder total length and its derivative (velocity) as states (prismatic joint model)";

    // Initialization
    parameter SI.Length initialLength(min=boxLength+minPistonLength, max=boxLength+minPistonLength+workingStroke) = boxLength+minPistonLength+workingStroke/2
        "Initial length, distance between frame_a and frame_b" annotation (Dialog(group="Initialization"));
    parameter Boolean initialLengthFixed = false "=true, if you want to use the initial length (=initialLength) as initial equation ('fixed' attributes)" annotation (Dialog(group="Initialization"),choices(checkBox=true));
    parameter Boolean initialVelFixed = false "=true, if you want to use the initial velocity (=0) as initial equation ('fixed' attributes)" annotation (Dialog(group="Initialization"),choices(checkBox=true));
    parameter Boolean initialAccFixed = false "=true, if you want to use the initial acceleration (=0) as initial equation ('fixed' attributes)" annotation (Dialog(group="Initialization"),choices(checkBox=true));    

    // Cylinder parameters
    parameter Units.Pitch spindlePitch = 5 "Spindle pitch";
    parameter SI.Mass totalMass = 5 "Total mass";
    parameter SI.Mass movingMass = 2.5 "Moving mass";
    parameter Real ratio(min=0) = 3 "Transmission ratio (servomotor.phi/spindle.phi)";

    // Geometry
    parameter SI.Distance workingStroke(displayUnit = "mm") = 0.8 "Working stroke" annotation (Dialog(group="Geometry"));
    parameter SI.Distance boxLength(displayUnit = "mm", min = workingStroke) = 0.944 "Length of the cover box" annotation (Dialog(group="Geometry"));
    parameter SI.Distance boxWidth(displayUnit = "mm") = 0.054 "Width of the cover box (animation)" annotation (Dialog(group="Geometry"));
    parameter SI.Distance minPistonLength(displayUnit = "mm") = 0.054 "Length of the outside part of the piston at -workingStroke/2 of stroke" annotation (Dialog(group="Geometry"));

    parameter SI.Distance pistonTotLength(displayUnit = "mm",min=workingStroke+minPistonLength,max=boxLength+minPistonLength) = boxLength+minPistonLength
        "Length of the cylinder that represents the piston (animation)" annotation (Dialog(group="Geometry"));
    parameter SI.Diameter pistonDiameter(displayUnit = "mm", max=boxWidth) = 0.024 "Piston diameter (animation)" annotation (Dialog(group="Geometry"));

    // Limits
    parameter SI.Force maxForce(min=0) = 3000 "Max feed force" annotation (Dialog(group="Limits"));
    parameter SI.Velocity maxSpeed(min=0) = 0.4 "Max speed" annotation (Dialog(group="Limits"));
    parameter SI.Acceleration maxAcceleration(min=0) = 5 "Max acceleration" annotation (Dialog(group="Limits"));
    parameter NonSI.AngularVelocity_rpm maxRotationalSpeed(min=0) = 4800 "Max rotational speed" annotation (Dialog(group="Limits"));

    final parameter SI.Distance minLength = boxLength+minPistonLength "Min value for variable 'length'";
    final parameter SI.Distance maxLength = minLength+workingStroke "Max value for variable 'length'";
    final parameter SI.Length minStroke(max=0) = -workingStroke/2 "Min value for variable 'stroke'";
    final parameter SI.Length maxStroke(min=0) = workingStroke/2 "Max value for variable 'stroke'";
    
end ElectricCylinderParameters;