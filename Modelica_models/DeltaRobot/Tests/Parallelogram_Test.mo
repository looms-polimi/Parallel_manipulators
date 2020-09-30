within DeltaRobot.Tests;
model Parallelogram_Test

  inner Modelica.Mechanics.MultiBody.World world(animateGravity=false, n={0,-1,0})
                                                 annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-32,20})));
  Components.Parallelogram parallelogram2_1(initialAnglesFixedSJ=true, initLowerAngle=0.5235987755983)
                                    annotation (Placement(transformation(extent={{-42,-22},{-22,-2}})));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(
    r={0.5,0,0},
    enforceStates=false,
    r_0(fixed=false),
    v_0(fixed=false),
    a_0(fixed=false),
    useQuaternions=false,
    animation=false)      annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-32,-40})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(color_x={0,0,255}, animation=true) annotation (Placement(transformation(extent={{-12,-34},{8,-14}})));
equation
  connect(parallelogram2_1.frame_b, bodyCylinder.frame_a) annotation (Line(
      points={{-32,-22},{-32,-30}},
      color={95,95,95},
      thickness=0.5));
  connect(world.frame_b, parallelogram2_1.frame_a) annotation (Line(
      points={{-32,10},{-32,-2}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedFrame1.frame_a, parallelogram2_1.frame_b) annotation (Line(
      points={{-12,-24},{-22,-24},{-22,-22},{-32,-22}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Parallelogram_Test;
