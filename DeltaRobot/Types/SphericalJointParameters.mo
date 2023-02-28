within DeltaRobot.Types;

record SphericalJointParameters "Parameters of the spherical joint model"
    extends DeltaRobot.Icons.Record; // Icon

    parameter Boolean enforceStates = false "=true, if the variables of the spherical joint have priority to be selected as states" annotation (choices(checkBox=true));
    parameter Boolean useQuaternions = false "= true, if quaternions shall be used as states otherwise use 3 angles as states (provided 'enforceStates=true')" annotation (choices(checkBox=true));
    parameter Boolean initialAngularVelFixed = false "=true, if you want to use angular velocities (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean initialAngularAccFixed = false "=true, if you want to use angular accelerations (=0) of the spherical joint as initial eqation ('fixed' attributes)" annotation (Dialog(group="Initialization"), choices(checkBox=true));

    // Animation
    parameter SI.Diameter sphereDiameter(displayUnit = "mm") = 1/16 "Diameter of sphere representing the spherical joint" annotation (Dialog(group="Animation"));
    
end SphericalJointParameters;
