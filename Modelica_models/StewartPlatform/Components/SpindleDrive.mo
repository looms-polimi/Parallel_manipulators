within StewartPlatform.Components;

model SpindleDrive "Spindle drive transforming rotational into translational motion"
  extends StewartPlatform.Icons.SpindleDrive;

// Imports
  import StewartPlatform.Types.Units.Pitch;

// Parameters
  parameter Pitch spindlePitch = 5 "Spindle pitch";
  final parameter Real ratio(final unit = "rad/mm", min = 0) = 1000 * 2 * pi / spindlePitch "Transmission ratio (flangeR.phi/flangeT.s)";

// Models
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flangeR "Flange of rotational shaft" annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_b flangeT "Flange of translational rod" annotation(Placement(transformation(extent = {{90, -10}, {110, 10}})));
  Modelica.Mechanics.Rotational.Components.IdealGearR2T rotationToTranslation(ratio = ratio) annotation(Placement(visible = true, transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
equation
  connect(flangeR, rotationToTranslation.flangeR) annotation(Line(points = {{-100, 0}, {-10, 0}, {-10, 0}, {-10, 0}}));
  connect(rotationToTranslation.flangeT, flangeT) annotation(Line(points = {{10, 0}, {98, 0}, {98, 0}, {100, 0}}, color = {0, 127, 0}));

end SpindleDrive;
