within DeltaRobot.Types;

record ArmParameters "Parameters of a Delta Robot's arm"
    extends DeltaRobot.Icons.Record; // Icon    

    // Upper arm
    parameter SI.Distance L = 0.2575 "Length" annotation(Dialog(group="Upper arm"));
    parameter SI.Diameter D = 0.03 "Diameter" annotation(Dialog(group="Upper arm"));
    parameter SI.Mass M = 5.2 "Mass" annotation(Dialog(group="Upper arm"));

    // Parallelogram
    parameter SI.Distance l = 0.7 "Long side length" annotation(Dialog(group="Parallelogram"));
    parameter SI.Distance h = 0.1 "Short side length" annotation(Dialog(group="Parallelogram"));
    parameter SI.Diameter Dl = 0.01 "Diameter of the long side" annotation(Dialog(group="Parallelogram"));
    parameter SI.Diameter Dh = 0.01 "Diameter of the short side" annotation(Dialog(group="Parallelogram"));
    parameter SI.Mass Ml = 3.2 "Mass of the long side" annotation(Dialog(group="Parallelogram"));
    parameter SI.Mass Mh = 0.8 "Mass of the short side" annotation(Dialog(group="Parallelogram"));

    // Limits
    parameter SI.Angle maxTheta = from_deg(85) "Max actuator angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle minTheta = from_deg(-85) "Min actuator angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxElbowAngle = from_deg(160) "Max internal angle between the upper arm and the parallelogram (180° means allignment)" annotation(Dialog(group="Limits"));
    parameter SI.Angle minElbowAngle = from_deg(20) "Min internal angle between the upper arm and the parallelogram (0° means overlap)" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxParallelogramAngle = from_deg(30) "Max parallelogram direction angle (0° means rectangular shape)" annotation(Dialog(group="Limits"));
    parameter SI.Angle minParallelogramAngle = from_deg(-30) "Min parallelogram direction angle (0° means rectangular shape)" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxPlatformAngle = from_deg(180) "Max angle between parallelogram and platform (180° means allignment)" annotation(Dialog(group="Limits"));
    parameter SI.Angle minPlatformAngle = from_deg(80) "Min angle between parallelogram and platform (0° means overlap)" annotation(Dialog(group="Limits"));

    // Animation
    parameter SI.Distance actCylinderLength = 1/30 "Length of cylinder representing the actuator revolute joint" annotation(Dialog(group="Animation"));
    parameter SI.Diameter actCylinderDiameter = 1/30 "Diameter of cylinder representing the actuator revolute joint" annotation(Dialog(group="Animation"));
    parameter SI.Distance univCylinderLength = 1/30 "Length of cylinder representing the universal joint" annotation(Dialog(group="Animation"));
    parameter SI.Diameter univCylinderDiameter = 1/30 "Diameter of cylinder representing the universal joint" annotation(Dialog(group="Animation"));
    parameter SI.Diameter sphereDiameter = 1/30 "Diameter of sphere representing the spherical joint" annotation(Dialog(group="Animation"));
end ArmParameters;
