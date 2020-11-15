within StewartPlatform.ReferenceSignals.Paths;

model Path_example1 "Designed for ideal scenario"
    extends StewartPlatform.Icons.Path; // Icon

    Interfaces.Pose pose annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

    TrapezoidalTrajectory                  trapezoidalTrajectory(stopPosition={0,0,1.77}, startTime=1) annotation (Placement(transformation(extent={{-54,52},{-34,72}})));
    TrapezoidalTrajectory                  trapezoidalTrajectory1(
      startPosition={0,0,1.77},
      stopPosition={0,0,0.97},
      startTime=2.27) annotation (Placement(transformation(extent={{-54,20},{-34,40}})));
    TrapezoidalTrajectory                  trapezoidalTrajectory2(
      startTime=4.06,
      startPosition={0,0,0.97},
      stopPosition={0,0,1.37}) annotation (Placement(transformation(extent={{-54,-8},{-34,12}})));
    CubicTrajectory                  cubicTrajectory(
      startTime=5.33,
      transitionTime=1.67,
      startPosition={0,0,1.37},
      angles_stop={20,0,40},
      stopPosition={0.5,0.5,1.37},
      sequence_stop={3,2,1}) annotation (Placement(transformation(extent={{-56,-34},{-36,-14}})));
    CubicTrajectory                  cubicTrajectory1(
      sequence_stop={3,2,1},
      startPosition={0.5,0.5,1.37},
      stopPosition={-0.5,-0.5,1.37},
      angles_stop={-20,0,-40},
      startTime=7,
      transitionTime=2,
      sequence_start={3,2,1},
      angles_start={20,0,40}) annotation (Placement(transformation(extent={{-56,-62},{-36,-42}})));
    CubicTrajectory                  cubicTrajectory2(
      sequence_start={3,2,1},
      startPosition={-0.5,-0.5,1.37},
      angles_start={-20,0,-40},
      angles_stop={0,0,0},
      transitionTime=1,
      startTime=9,
      stopPosition={0,0,1.37}) annotation (Placement(transformation(extent={{-56,-92},{-36,-72}})));
    Switch2 switch2(n=6) annotation (Placement(transformation(extent={{10,4},{30,24}})));
  equation
    connect(trapezoidalTrajectory.pose, switch2.poseInput[1]) annotation (Line(points={{-35,62},{11,62},{11,11.5}}, color={0,0,0}));
    connect(trapezoidalTrajectory1.pose, switch2.poseInput[2]) annotation (Line(points={{-35,30},{11,30},{11,12.5}}, color={0,0,0}));
    connect(trapezoidalTrajectory2.pose, switch2.poseInput[3]) annotation (Line(points={{-35,2},{11,2},{11,13.5}}, color={0,0,0}));
    connect(cubicTrajectory.pose, switch2.poseInput[4]) annotation (Line(points={{-37,-24},{11,-24},{11,14.5}}, color={0,0,0}));
    connect(cubicTrajectory1.pose, switch2.poseInput[5]) annotation (Line(points={{-37,-52},{11,-52},{11,15.5}}, color={0,0,0}));
    connect(cubicTrajectory2.pose, switch2.poseInput[6]) annotation (Line(points={{-37,-82},{11,-82},{11,16.5}}, color={0,0,0}));
    connect(switch2.poseOutput, pose) annotation (Line(points={{29,14},{48,14},{48,20},{90,20},{90,0}}, color={0,0,0}), Text(string="%second",index=1,extent={{6,3},{6,3}}));
    
end Path_example1;
