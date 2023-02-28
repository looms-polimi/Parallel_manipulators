within StewartPlatform.ReferenceSignals.Paths;

model Path_example3 "Example of path for the Stewart Platform"
    extends StewartPlatform.Icons.Path; 
// Icon
    Interfaces.Pose pose annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

    CubicTrajectory cubicTrajectory1(angle_stop = 40, n_stop = {0, 0, 1}, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, startTime = 1, stopPosition = {0, 0, 1.7})  annotation (Placement(transformation(extent={{-78,56},{-58,76}})));    
    CubicTrajectory cubicTrajectory4(angle_start = 30, angle_stop = 0, n_start = {1, 0, 0}, n_stop = {1, 0, 0}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, startPosition = {0.4, 0.2, 1.4}, startTime = 6, stopPosition = {0, 0, 1.7}, transitionTime = 1)  annotation (Placement(transformation(extent={{-78,-30},{-58,-10}})));    
    CubicTrajectory cubicTrajectory2(angle_start = 40, angle_stop = -40, n_start = {0, 0, 1}, n_stop = {0, 0, 1}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, startPosition = {0, 0, 1.7}, startTime = 2, stopPosition = {0, 0, 1}, transitionTime = 2)   annotation (Placement(transformation(extent={{-78,28},{-58,48}})));
    CubicTrajectory cubicTrajectory3(angle_start = -40, angle_stop = 30, n_start = {0, 0, 1}, n_stop = {1, 0, 0}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, startPosition = {0, 0, 1}, startTime = 4.5, stopPosition = {0.4, 0.2, 1.4}, transitionTime = 1.5)   annotation (Placement(transformation(extent={{-78,2},{-58,22}})));
    CubicTrajectory cubicTrajectory5(angle_start = 0, angle_stop = 30, n_start = {1, 0, 0}, n_stop = {0, 1, 0}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, startPosition = {0, 0, 1.7}, startTime = 7, stopPosition = {-0.4, -0.2, 1.4}, transitionTime = 1)  annotation (Placement(transformation(extent={{-78,-58},{-58,-38}})));
    CubicTrajectory cubicTrajectory6(angle_start = 30, angle_stop = 0, n_start = {0, 1, 0}, n_stop = {0, 1, 0}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis,startPosition = {-0.4, -0.2, 1.4}, startTime = 8, stopPosition = {0, 0, 1}, transitionTime = 1)  annotation (Placement(transformation(extent={{-76,-86},{-56,-66}})));
    Switch2 switch2(n= 7) annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  StewartPlatform.ReferenceSignals.CubicTrajectory cubicTrajectory7(angle_start = 0, angle_stop = 0, n_start = {0, 1, 0}, n_stop = {0, 1, 0}, rotationType_start = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, rotationType_stop = Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis, startPosition = {0, 0, 1}, startTime = 9, stopPosition = {0, 0, 1.45}, transitionTime = 1) annotation(
    Placement(visible = true, transformation(extent = {{-68, -122}, {-48, -102}}, rotation = 0)));  equation
    connect(cubicTrajectory1.pose, switch2.poseInput[1]) annotation(
    Line(points = {{-59, 66}, {-17, 66}, {-17, -2.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory2.pose, switch2.poseInput[2]) annotation(
    Line(points = {{-59, 38}, {-17, 38}, {-17, -1.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory3.pose, switch2.poseInput[3]) annotation(
    Line(points = {{-59, 12}, {-17, 12}, {-17, -0.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory4.pose, switch2.poseInput[4]) annotation(
    Line(points = {{-59, -20}, {-18, -20}, {-18, 0.5}, {-17, 0.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory5.pose, switch2.poseInput[5]) annotation(
    Line(points = {{-59, -48}, {-17, -48}, {-17, 1.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory6.pose, switch2.poseInput[6]) annotation(
    Line(points = {{-57, -76}, {-17, -76}, {-17, 2.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory7.pose, switch2.poseInput[7]) annotation(
    Line(points = {{-49, -112}, {-49, -58.75}, {-17, -58.75}, {-17, 2.5}}));
    connect(switch2.poseOutput, pose) annotation(
    Line(points = {{1, 0}, {90, 0}}, color = {0, 0, 0}));
annotation(
    Diagram);
end Path_example3;
