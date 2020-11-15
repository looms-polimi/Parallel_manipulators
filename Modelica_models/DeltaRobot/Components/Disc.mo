within DeltaRobot.Components;

model Disc "Cylindrical disc used to model the base and the platform"
    extends DeltaRobot.Icons.Disc; // Icon

    // Imports
    import DeltaRobot.Types.Units.Direction;
    import DeltaRobot.Functions.*;

    // Parameters
    parameter DeltaRobot.Types.DiscParameters discParameters(D=1) "Parameters of the disc";
    parameter Direction direction = Direction.down "Cylinder direction from x-y plane along z-axis";

protected
    parameter SI.Position J[3, 3] = jointsCoordinates(discParameters) "Coordinates of the joints resolved in disc frame";
    parameter NonSI.Angle_deg alpha[3, 3] = actuatorsJointsRotationAngles(discParameters) "Rotation angles to rotate disc frame into the frames of base/platform joints";
    parameter Modelica.Mechanics.MultiBody.Types.RotationSequence rotationSequence = {3,1,3} "Sequence of rotations relative to function 'actuatorsJointsRotationAngles'";

    // Models
public
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(angles = {alpha[1, 1], alpha[1, 2], alpha[1, 3]}, r={J[1, 1],J[1, 2],J[1, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence, animation=false) annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={0,-50})));
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(angles = {alpha[2, 1], alpha[2, 2], alpha[2, 3]}, r={J[2, 1],J[2, 2],J[2, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence, animation=false) annotation (Placement(transformation(extent={{10,10},{-10,-10}},rotation=180,origin={50,40})));
    Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(angles = {alpha[3, 1], alpha[3, 2], alpha[3, 3]}, r={J[3, 1],J[3, 2],J[3, 3]}, rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = rotationSequence, animation=false) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-50,40})));

    Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Frame in the center of the disc" annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,-100})));
    Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b[3] "Frames where the joints are located" annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100})));

    Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(
        r=if direction == Direction.up then {0,0,discParameters.thickness} else {0,0,-discParameters.thickness},
        lengthDirection=if direction == Direction.up then {0,0,1} else {0,0,-1},
        length=discParameters.thickness,
        diameter=discParameters.De,
        density=discParameters.density)
    annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));

equation

  assert(discParameters.D<=discParameters.De,
  "Disc: the disc external diameter should be bigger or equal to the diameter of the circumference where the joints are located",
  level = AssertionLevel.warning);

  assert(0<discParameters.De,
  "Disc: the disc external diameter MUST be bigger then zero");

  assert(0<discParameters.D,
  "Disc: the diameter of the circumference where the joints are located MUST be bigger then zero");

  assert(0<discParameters.thickness,
  "Disc: the thickness of the disc MUST be bigger then zero");

  assert(0<=discParameters.mass,
  "Disc: the mass of the disc MUST be bigger or equal to zero");

  connect(fixedRotation1.frame_a, bodyCylinder.frame_a) annotation (Line(points={{0,-40},{0,0},{-20,0}},color={95,95,95},thickness=0.5));
  connect(fixedRotation2.frame_a, bodyCylinder.frame_a) annotation (Line(points={{40,40},{0,40},{0,0},{-20,0}},color={95,95,95},thickness=0.5));
  connect(fixedRotation3.frame_a, bodyCylinder.frame_a) annotation (Line(points={{-40,40},{0,40},{0,0},{-20,0}},color={95,95,95},thickness=0.5));

  connect(fixedRotation1.frame_b, frame_b[1]) annotation (Line(points={{0,-60},{20,-60},{20,89.3333},{0,89.3333}},color={95,95,95},thickness=0.5));
  connect(fixedRotation2.frame_b, frame_b[2]) annotation (Line(points={{60,40},{60,100},{0,100}},color={95,95,95},thickness=0.5));
  connect(fixedRotation3.frame_b, frame_b[3]) annotation (Line(points={{-60,40},{-60,110.667},{0,110.667}},color={95,95,95},thickness=0.5));
      
  connect(frame_a, bodyCylinder.frame_a) annotation (Line(points={{0,-100},{-20,-100},{-20,0}},color={95,95,95},thickness=0.5));

end Disc;
