within DeltaRobot.Components;

partial model PartialParallelogram "Partial model of a parallelogram structure to model the lower arms of a Delta Robot"

    // Parameters
      parameter DeltaRobot.Types.ArmParameters armParameters "Parameters of the arm";

public
    // Models
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,-100})));

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder shortSide1(
        r = {0,0,-armParameters.h},
        diameter = armParameters.Dh,
        density = 4*armParameters.Mh/(armParameters.Dh^2*pi*armParameters.h))
        annotation (Placement(transformation(extent={{12,48},{-12,72}})));

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder shortSide2(
        r = {0,0,-armParameters.h},
        diameter = armParameters.Dh,
        density = 4*armParameters.Mh/(armParameters.Dh^2*pi*armParameters.h))
        annotation (Placement(transformation(extent={{12,-72},{-12,-48}})));
        
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(animation=false, r={0,0,armParameters.h/2}) annotation (Placement(transformation(extent={{0,70},{20,90}})));
      Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(animation=false, r={0,0,armParameters.h/2})annotation (Placement(transformation(extent={{0,-90},{20,-70}})));

equation
    connect(frame_a, fixedRotation1.frame_a) annotation(Line(points = {{0, 100}, {0, 100}, {0, 80}, {0, 80}}));
    connect(frame_b, fixedRotation2.frame_a) annotation(Line(points = {{0, -100}, {0, -100}, {0, -80}, {0, -80}}));
    connect(fixedRotation1.frame_b, shortSide1.frame_a) annotation(Line(points = {{20, 80}, {20, 80}, {20, 60}, {12, 60}, {12, 60}}, color = {95, 95, 95}));
    connect(fixedRotation2.frame_b, shortSide2.frame_a) annotation(Line(points = {{20, -80}, {20, -80}, {20, -60}, {12, -60}, {12, -60}}, color = {95, 95, 95}));

end PartialParallelogram;
