within StewartPlatform.Types;

record UniversalJointParameters "Parameters of the universal joint model"
    extends StewartPlatform.Icons.Record; // Icon

    parameter SI.Angle alpha = 0 "Orientation of the universal joint: fix rotation around z-axis from frame_a";    
    parameter StateSelect stateSelect = StateSelect.prefer "Priority to use joint coordinates and relative derivatives (phi_a, phi_b, w_a, w_b) as states";
    parameter SI.Angle angles[2] = {0, 0} "Initial rotation angles around x-axis and the new y-axis" annotation (Dialog(group="Initialization"));
    parameter Boolean initialAnglesFixed = false "=true, if you want to use joint angles as initial equation ('fixed' attributes)" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean initialAngularVelFixed = false "=true, if you want to use angular velocities (=0) of the joint as initial equation ('fixed' attributes)" annotation (Dialog(group="Initialization"), choices(checkBox=true));
    parameter Boolean initialAngularAccFixed = false "=true, if you want to use angular accelerations (=0) of the joint as initial equation ('fixed' attributes)" annotation (Dialog(group="Initialization"), choices(checkBox=true));

    // Animation
    parameter SI.Distance cylinderLength = 1/10 "Length of the cylinders representing the universal joint" annotation (Dialog(group="Animation"));
    parameter SI.Distance cylinderDiameter = 1/20 "Diameter of the cylinders representing the universal joint" annotation (Dialog(group="Animation"));
    
end UniversalJointParameters;
