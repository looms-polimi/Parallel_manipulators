within DeltaRobot.Components;

partial model PartialThreeArms

    // Imports
    import DeltaRobot.Functions.*;

    // Parameters
    outer DeltaRobot.Components.GlobalParameters gp;

    parameter Boolean useGlobalParameters = true "=true, if you want to use the parameters defined in the 'gp' (GlobalParameters) object" annotation (choices(checkBox=true));
    parameter DeltaRobot.Types.DiscParameters base(D=0.30) "Base parameters";
    parameter DeltaRobot.Types.DiscParameters platform(D=0.07) "Platform parameters";
    parameter DeltaRobot.Types.ArmParameters armParameters "Arm parameters";

    parameter SI.Position initPlatformPosition[3] = {0,0,-0.543}  "Initial coordinates of the platform frame resolved in base frame";

protected
    parameter DeltaRobot.Types.DiscParameters base_in = if useGlobalParameters then gp.base else base;
    parameter DeltaRobot.Types.DiscParameters platform_in = if useGlobalParameters then gp.platform else platform;
    parameter DeltaRobot.Types.ArmParameters armParameters_in = if useGlobalParameters then gp.armParameters else armParameters;

    parameter SI.Angle initTheta[3] = inverseKinematic(initPlatformPosition, armParameters_in.L, armParameters_in.l, base_in.D, platform_in.D, base.beta) "Initial angles of the three actuators";
    parameter SI.Angle parallAngles[3,3] = parallelogramAngles(initPlatformPosition, armParameters_in.L, armParameters_in.l, base_in.D, platform_in.D, base.beta) "Rotation angles. In sequence: around upper revolute joint, parallelogram joint, lower revolute joint";

public
    // Models
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_base[3] annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_platform[3] annotation (Placement(transformation(extent={{-17,-16},{17,16}},rotation=90,origin={-1,-100})));

    Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm1(
    r={armParameters_in.L,0,0},
    diameter=armParameters_in.D,
    density=4*armParameters_in.M/(armParameters_in.D^2*pi*armParameters_in.L))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-50,30})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm2(
    r={armParameters_in.L,0,0},
    density=4*armParameters_in.M/(armParameters_in.D^2*pi*armParameters_in.L),
    diameter=armParameters_in.D)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={0,30})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm3(
    r={armParameters_in.L,0,0},
    diameter=armParameters_in.D,
    density=4*armParameters_in.M/(armParameters_in.D^2*pi*armParameters_in.L))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={50,30})));

equation

end PartialThreeArms;
