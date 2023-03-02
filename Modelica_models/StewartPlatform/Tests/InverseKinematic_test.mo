within StewartPlatform.Tests;

model InverseKinematic_test "Test for 'jointsCoordinates', 'legsDirections' and 'legsLength' functions"

// Imports
  import StewartPlatform.Functions.*;
  import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

// Parameters
  parameter StewartPlatform.Types.DiscParameters base(D=0.3,alpha=pi/6) "Base data";
  parameter StewartPlatform.Types.DiscParameters platform(D=0.2,alpha=pi/2) "Platform data";

// Platform pose
  parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence= {1,2,3} "Sequence of rotations from base frame to platform frame along axis sequence[i]";
  parameter SI.Angle angles[3] = {from_deg(0),from_deg(0),from_deg(0)} "Rotation angles around the axes defined in 'sequence'";
  parameter SI.Position position[3] = {0,0,0.15} "Coordinates of the platform frame resolved in base frame";

  final parameter Real leg[6, 3] = legsDirections(base,platform,position,sequence,angles,true);
  final parameter SI.Position B_b[6, 3] = jointsCoordinates(base);
  final parameter SI.Position P_p[6, 3] = jointsCoordinates(platform);
  final parameter SI.Position platformCenter[6,3] = -1*changeRefFrame(P_p,sequence,angles);
  final parameter SI.Length legs_Length[6] = legsLength(base,platform,position,sequence,angles);

  final parameter TM.Orientation T = TM.axesRotations(sequence, angles);
  final parameter Real v1[3] = TM.resolve1(T,{1,0,0});
  
  
function changeRefFrame "Change the reference frame of a set of 6 points"
  extends Modelica.Icons.Function;
  //Imports
  import SI = Modelica.Units.SI;
  import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;

//Variables
  input SI.Position in_points[6,3];
  input Integer sequence[3] "Sequence of rotations from frame 1 to frame 2 along axis sequence[i]";
  input SI.Angle angles[3] "Rotation angles around the axes defined in 'sequence'";
  output SI.Position out_points[6,3];

  protected
    TM.Orientation T "Transformation matrix from base frame to platform frame (v_1=T*v_2)";
    Real out_points_i[3] "Temporary variable for out_points[i,:]";

algorithm
    T := TM.axesRotations(sequence, angles);

    for i in 1:6 loop
      out_points_i := TM.resolve1(T,{in_points[i,1], in_points[i,2], in_points[i,3]});
      
      out_points[i,1] := out_points_i[1];
      out_points[i,2] := out_points_i[2];
      out_points[i,3] := out_points_i[3];
    end for;
end changeRefFrame;

inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, defaultSpecularCoefficient=0, n = {0, 0, -1}, nominalLength = base.D / 2) annotation (
    Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseJoint1(r = B_b[1], shapeType = "box")  annotation (
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseJoint2(r = B_b[2], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseJoint3(r = B_b[3], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseJoint4(r = B_b[4], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-40,-30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseJoint5(r = B_b[5], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation baseJoint6(r = B_b[6], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation leg1(r=legs_Length[1]*leg[1]) annotation (
    Placement(visible = true, transformation(origin = {38, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation leg2(r=legs_Length[2]*leg[2]) annotation (
    Placement(visible = true, transformation(origin = {-20, 58}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation leg3(r=legs_Length[3]*leg[3]) annotation (
    Placement(visible = true, transformation(origin = {-40, 58}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation leg4(r=legs_Length[4]*leg[4]) annotation (
    Placement(visible = true, transformation(origin = {-40, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation leg5(r=legs_Length[5]*leg[5])  annotation (
    Placement(visible = true, transformation(origin = {-20, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation leg6(r=legs_Length[6]*leg[6]) annotation (
    Placement(visible = true, transformation(origin = {38, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation platformCenter2(r = platformCenter[2], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-20, 84}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation platformCenter3(r = platformCenter[3], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-40, 84}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation platformCenter4(r = platformCenter[4], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-40, -82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation platformCenter5(r = platformCenter[5], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {-20, -82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation platformCenter6(r = platformCenter[6], shapeType = "box") annotation (
    Placement(visible = true, transformation(origin = {66, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Visualizers.FixedFrame fixedFrame1(length=world.axisLength) annotation (
    Placement(visible = true, transformation(origin = {96, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedRotation platformCenter1(angles = {to_deg(angles[1]), to_deg(angles[2]), to_deg(angles[3])}, r = platformCenter[1], rotationType = Modelica.Mechanics.MultiBody.Types.RotationTypes.PlanarRotationSequence, sequence = sequence)  annotation (
    Placement(visible = true, transformation(origin = {66, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(platformCenter1.frame_b, fixedFrame1.frame_a) annotation (
    Line(points = {{76, 10}, {86, 10}, {86, 10}, {86, 10}}, color = {95, 95, 95}));
  connect(platformCenter1.frame_a, leg1.frame_b) annotation (
    Line(points = {{56, 10}, {48, 10}, {48, 10}, {48, 10}}, color = {95, 95, 95}));
  connect(leg5.frame_b, platformCenter5.frame_a) annotation (
    Line(points = {{-20, -66}, {-20, -66}, {-20, -72}, {-20, -72}}, color = {95, 95, 95}));
  connect(leg4.frame_b, platformCenter4.frame_a) annotation (
    Line(points = {{-40, -66}, {-40, -66}, {-40, -72}, {-40, -72}}, color = {95, 95, 95}));
  connect(platformCenter2.frame_a, leg2.frame_b) annotation (
    Line(points = {{-20, 74}, {-20, 74}, {-20, 68}, {-20, 68}}, color = {95, 95, 95}));
  connect(platformCenter3.frame_a, leg3.frame_b) annotation (
    Line(points = {{-40, 74}, {-40, 74}, {-40, 68}, {-40, 68}}, color = {95, 95, 95}));
  connect(leg6.frame_b, platformCenter6.frame_a) annotation (
    Line(points = {{48, -10}, {56, -10}, {56, -10}, {56, -10}}, color = {95, 95, 95}));
  connect(baseJoint5.frame_b, leg5.frame_a) annotation (
    Line(points = {{-20, -40}, {-20, -40}, {-20, -46}, {-20, -46}}, color = {95, 95, 95}));
  connect(baseJoint4.frame_b, leg4.frame_a) annotation (
    Line(points = {{-40, -40}, {-40, -40}, {-40, -46}, {-40, -46}}, color = {95, 95, 95}));
  connect(leg3.frame_a, baseJoint3.frame_b) annotation (
    Line(points = {{-40, 48}, {-40, 48}, {-40, 40}, {-40, 40}}, color = {95, 95, 95}));
  connect(leg2.frame_a, baseJoint2.frame_b) annotation (
    Line(points = {{-20, 48}, {-20, 48}, {-20, 40}, {-20, 40}}, color = {95, 95, 95}));
  connect(baseJoint6.frame_b, leg6.frame_a) annotation (
    Line(points = {{20, -10}, {28, -10}, {28, -10}, {28, -10}}, color = {95, 95, 95}));
  connect(baseJoint1.frame_b, leg1.frame_a) annotation (
    Line(points = {{20, 10}, {28, 10}, {28, 10}, {28, 10}}, color = {95, 95, 95}));
  connect(world.frame_b, baseJoint6.frame_a) annotation (
    Line(points = {{-24, 0}, {0, 0}, {0, -10}, {0, -10}}, color = {95, 95, 95}));
  connect(world.frame_b, baseJoint1.frame_a) annotation (
    Line(points = {{-24, 0}, {0, 0}, {0, 10}, {0, 10}}, color = {95, 95, 95}));
  connect(world.frame_b, baseJoint5.frame_a) annotation (
    Line(points = {{-24, 0}, {-20, 0}, {-20, -20}, {-20, -20}}, color = {95, 95, 95}));
  connect(world.frame_b, baseJoint2.frame_a) annotation (
    Line(points = {{-24, 0}, {-20, 0}, {-20, 20}, {-20, 20}}, color = {95, 95, 95}));
  connect(baseJoint4.frame_a, baseJoint5.frame_a) annotation (
    Line(points = {{-40, -20}, {-20, -20}, {-20, -20}, {-20, -20}}, color = {95, 95, 95}));
  connect(baseJoint3.frame_a, baseJoint2.frame_a) annotation (
    Line(points = {{-40, 20}, {-20, 20}, {-20, 20}, {-20, 20}}, color = {95, 95, 95}));  

end InverseKinematic_test;
