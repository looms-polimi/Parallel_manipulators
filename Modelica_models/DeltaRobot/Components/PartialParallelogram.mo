within DeltaRobot.Components;

partial model PartialParallelogram "Partial model of a parallelogram structure to model the lower arms of a Delta Robot"

    // Parameters
    parameter DeltaRobot.Types.ArmParameters armParameters "Arm parameters";

protected
    parameter SI.Distance l = armParameters.l "Long side length";
    parameter SI.Distance h = armParameters.h "Short side length";
    parameter SI.Diameter Dl = armParameters.Dl "Diameter of the long side";
    parameter SI.Diameter Dh = armParameters.Dh "Diameter of the short side";
    parameter SI.Mass Ml = armParameters.Ml "Mass of the long side";
    parameter SI.Mass Mh = armParameters.Mh "Mass of the short side";

    parameter SI.Distance univCylinderLength = armParameters.univCylinderLength "Length of cylinder representing the universal joint";
    parameter SI.Diameter univCylinderDiameter = armParameters.univCylinderDiameter "Diameter of cylinder representing the universal joint";
    parameter SI.Diameter sphereDiameter = armParameters.sphereDiameter "Diameter of sphere representing the spherical joints in arms";

public
    // Models
    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,-100})));

    Modelica.Mechanics.MultiBody.Parts.BodyCylinder shortSide1(
      r={0,0,-h},
      diameter=Dh,
      density=4*Mh/(Dh^2*pi*h))
      annotation (Placement(transformation(extent={{12,48},{-12,72}})));
    Modelica.Mechanics.MultiBody.Parts.BodyCylinder shortSide2(
      r={0,0,-h},
      diameter=Dh,
      density=4*Mh/(Dh^2*pi*h))
      annotation (Placement(transformation(extent={{12,-72},{-12,-48}})));
      
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(animation=false, r={0,0,h/2}) annotation (Placement(transformation(extent={{0,70},{20,90}})));
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(animation=false, r={0,0,h/2})annotation (Placement(transformation(extent={{0,-90},{20,-70}})));

equation
    connect(frame_a, fixedRotation1.frame_a) annotation(Line(points = {{0, 100}, {0, 100}, {0, 80}, {0, 80}}));
    connect(frame_b, fixedRotation2.frame_a) annotation(Line(points = {{0, -100}, {0, -100}, {0, -80}, {0, -80}}));
    connect(fixedRotation1.frame_b, shortSide1.frame_a) annotation(Line(points = {{20, 80}, {20, 80}, {20, 60}, {12, 60}, {12, 60}}, color = {95, 95, 95}));
    connect(fixedRotation2.frame_b, shortSide2.frame_a) annotation(Line(points = {{20, -80}, {20, -80}, {20, -60}, {12, -60}, {12, -60}}, color = {95, 95, 95}));

end PartialParallelogram;
