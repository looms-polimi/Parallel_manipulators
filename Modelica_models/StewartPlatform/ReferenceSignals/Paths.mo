within StewartPlatform.ReferenceSignals;

package Paths
  model Path_example1 "Designed for ideal scenario"
    extends StewartPlatform.ReferenceSignals.Paths.PartialPath;

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
    connect(switch2.poseOutput, pose)
      annotation (Line(points={{29,14},{48,14},{48,20},{90,20},{90,0}}, color={0,0,0}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Path_example1;

  model PartialPath "Partial model to define a path"
    Interfaces.Pose pose annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));
    annotation (Icon(graphics={
                                  Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-150,150},{150,110}},
          textString="%name",
          lineColor={0,0,255}),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,78},{-80,-82}}, color={192,192,192}),
          Line(points={{-90,0},{82,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-42,55},{29,12}},
            lineColor={192,192,192},
            textString="w"),
          Line(points={{-80,0},{-41,69},{26,69},{58,0}})}));
  end PartialPath;

  model Path_example2 "Designed for real scenario"
    extends StewartPlatform.ReferenceSignals.Paths.PartialPath;
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
    Switch2                  switch2_1(n=6) annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
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
    connect(trapezoidalTrajectory.pose,switch2_1. poseInput[1]) annotation (Line(points={{-59,66},{-17,66},{-17,-2.5}},                   color={0,0,0}));
    connect(trapezoidalTrajectory1.pose,switch2_1. poseInput[2]) annotation (Line(points={{-59,38},{-17,38},{-17,-1.5}},                   color={0,0,0}));
    connect(trapezoidalTrajectory2.pose,switch2_1. poseInput[3]) annotation (Line(points={{-59,12},{-17,12},{-17,-0.5}},                    color={0,0,0}));
    connect(cubicTrajectory.pose,switch2_1. poseInput[4]) annotation (Line(points={{-59,-20},{-18,-20},{-18,0.5},{-17,0.5}}, color={0,0,0}));
    connect(cubicTrajectory1.pose,switch2_1. poseInput[5]) annotation (Line(points={{-59,-48},{-17,-48},{-17,1.5}},                     color={0,0,0}));
    connect(cubicTrajectory2.pose, switch2_1.poseInput[6]) annotation (Line(points={{-57,-76},{-17,-76},{-17,2.5}}, color={0,0,0}));
    connect(switch2_1.poseOutput, pose) annotation (Line(points={{1,0},{90,0}}, color={0,0,0}));
    
  end Path_example2;
end Paths;