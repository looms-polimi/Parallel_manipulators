within DeltaRobot.Interfaces;

model PoseDeMux "Expand the variables of a 'Pose' connector"
    extends DeltaRobot.Icons.PoseDeMux; // Icon

    // Models
    Pose pose annotation (Placement(transformation(extent={{-130,-30},{-70,30}})));
    Modelica.Blocks.Interfaces.RealOutput startTime annotation (Placement(transformation(extent={{100,50},{120,70}})));
    Modelica.Blocks.Interfaces.RealOutput stopTime annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
    Modelica.Blocks.Interfaces.RealOutput position[3] annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    
equation
    connect(pose.position, position)
      annotation (Line(points={{-99.85,0.15},{8,0.15},{8,0},{110,0}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(pose.startTime, startTime)
      annotation (Line(points={{-99.85,0.15},{-99.85,60},{110,60}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));
    connect(pose.stopTime, stopTime)
      annotation (Line(points={{-99.85,0.15},{-99.85,-60},{110,-60}}, color={0,0,0}), Text(
        string="%first",
        index=-1,
        extent={{-6,3},{-6,3}}));

end PoseDeMux;
