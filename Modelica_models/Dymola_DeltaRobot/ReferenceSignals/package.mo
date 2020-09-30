within DeltaRobot;
package ReferenceSignals "Package with models to define trajectories for a Delta robot"
  extends Modelica.Icons.SourcesPackage;

  model Switch2 "Switch between two or more Pose signals, the definition of the swith times is not required"
    extends DeltaRobot.Icons.Switch2;

    //Parameters
      parameter Integer n(min=2) = 2 "Number of different input signals";

    //Variables
      Integer count "Number of the current signal";

public
    Interfaces.Pose poseInput[n] annotation (Placement(transformation(extent={{-120,-30},{-60,30}}), iconTransformation(extent={{-120,-30},{-60,30}})));
    Interfaces.Pose poseOutput annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

    Modelica.Blocks.Routing.RealPassThrough positionIn[n,3] annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    Modelica.Blocks.Routing.RealPassThrough positionOut[3] annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica.Blocks.Routing.RealPassThrough firstStartTimeIn annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    Modelica.Blocks.Routing.RealPassThrough lastStopTimeIn annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  initial equation
    count=1;
  equation
    assert(n>=2,"Switch: Must be n>=2, there must be more then one signal connected.");

    when pre(count)<=n-1 and time>=poseInput[pre(count)].stopTime then
      count = pre(count) + 1;
    end when;

    for i in 1:3 loop
      positionIn[count,i].y=positionOut[i].u;
    end for;

    for i in 1:n loop
      connect(positionIn[i, :].u, poseInput[i].position);
    end for;

    connect(firstStartTimeIn.u, poseInput[1].startTime);
    connect(lastStopTimeIn.u, poseInput[n].stopTime);

    connect(positionOut.y, poseOutput.position)
      annotation (Line(points={{41,0},{70,0},{70,0.15},{90.15,0.15}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}}));
  connect(firstStartTimeIn.y, poseOutput.startTime)
    annotation (Line(points={{-19,30},{90.15,30},{90.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(lastStopTimeIn.y, poseOutput.stopTime)
    annotation (Line(points={{-19,-30},{90.15,-30},{90.15,0.15}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
     annotation (Icon(coordinateSystem(preserveAspectRatio=true)), Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="CopiatoDaSP");
  end Switch2;
end ReferenceSignals;
