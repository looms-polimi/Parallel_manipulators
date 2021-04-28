within StewartPlatform.ReferenceSignals.Paths;

model Path_example2 "Example of path for the Stewart Platform"
    extends StewartPlatform.Icons.Path; 
// Icon
    Interfaces.Pose pose annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

    CubicTrajectory                  cubicTrajectory(
      startPosition={0,0,1.37},
      startTime=15.6,
      transitionTime=3,
      sequence_stop={3,2,1},
      angles_stop={20,0,40},
      stopPosition={0.4,0.4,1.37})
                        annotation (Placement(transformation(extent={{-78,-30},{-58,-10}})));
    TrapezoidalTrajectory                  trapezoidalTrajectory(
      stopPosition={0,0,1.77},
      startTime=1,
      maxAcceleration=0.1,
      maxSpeed=0.2)        annotation (Placement(transformation(extent={{-78,56},{-58,76}})));
    Switch2                  switch2(n=6) annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
    TrapezoidalTrajectory                  trapezoidalTrajectory1(
      maxAcceleration=0.1,
      maxSpeed=0.2,
      startPosition={0,0,1.77},
      stopPosition={0,0,0.97},
      startTime=5)         annotation (Placement(transformation(extent={{-78,28},{-58,48}})));
    TrapezoidalTrajectory                  trapezoidalTrajectory2(
      maxAcceleration=0.1,
      maxSpeed=0.2,
      startPosition={0,0,0.97},
      startTime=11.2,
      stopPosition={0,0,1.37})
                           annotation (Placement(transformation(extent={{-78,2},{-58,22}})));
    CubicTrajectory                  cubicTrajectory1(
      sequence_stop={3,2,1},
      sequence_start={3,2,1},
      angles_start={20,0,40},
      angles_stop={-20,0,-40},
      startTime=18.8,
      transitionTime=6,
      stopPosition={-0.4,-0.4,1.37},
      startPosition={0.4,0.4,1.37})
                        annotation (Placement(transformation(extent={{-78,-58},{-58,-38}})));
    CubicTrajectory                  cubicTrajectory2(
      sequence_start={3,2,1},
      startTime=25,
      transitionTime=3,
      startPosition={-0.4,-0.4,1.37},
      stopPosition={0,0,1.37},
      angles_start={-20,0,-40},
      angles_stop={0,0,0})
                        annotation (Placement(transformation(extent={{-76,-86},{-56,-66}})));
  equation
    connect(trapezoidalTrajectory.pose, switch2.poseInput[1]) annotation(
    Line(points = {{-59, 66}, {-17, 66}, {-17, -2.5}}, color = {0, 0, 0}));
    connect(trapezoidalTrajectory1.pose, switch2.poseInput[2]) annotation(
    Line(points = {{-59, 38}, {-17, 38}, {-17, -1.5}}, color = {0, 0, 0}));
    connect(trapezoidalTrajectory2.pose, switch2.poseInput[3]) annotation(
    Line(points = {{-59, 12}, {-17, 12}, {-17, -0.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory.pose, switch2.poseInput[4]) annotation(
    Line(points = {{-59, -20}, {-18, -20}, {-18, 0.5}, {-17, 0.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory1.pose, switch2.poseInput[5]) annotation(
    Line(points = {{-59, -48}, {-17, -48}, {-17, 1.5}}, color = {0, 0, 0}));
    connect(cubicTrajectory2.pose, switch2.poseInput[6]) annotation(
    Line(points = {{-57, -76}, {-17, -76}, {-17, 2.5}}, color = {0, 0, 0}));
    connect(switch2.poseOutput, pose) annotation(
    Line(points = {{1, 0}, {90, 0}}, color = {0, 0, 0}));
end Path_example2;
