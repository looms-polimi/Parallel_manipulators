within DeltaRobot.Components;

model ThreeArms_P1_IdealActPos
    extends DeltaRobot.Icons.ThreeArms; // Icon
    extends PartialThreeArms;
    
    // Imports
    import Modelica.Blocks.Types.Init;

    // Parameters of 'IdealActuatorPos' models (copy from relative model)
    parameter Real Tf = 0.02 "Time constant of the first order filter applied to the input reference angle" annotation (Dialog(group="First order filter",tab="IdealActuatorPos"));
    parameter Init initType = Init.NoInit "Type of initialization of first order filter (1: no init, 2: steady state, 3/4: initial output)" annotation (Dialog(group="First order filter",tab="IdealActuatorPos"));
    parameter Real y_start = 0 "Initial or guess value of first order filter output (= state)" annotation (Dialog(group="First order filter",tab="IdealActuatorPos"));
    parameter Boolean y_startFixed = false "=true, if you want to use the filter initial output as initial equation" annotation (Dialog(group="First order filter",tab="IdealActuatorPos"));

    // Parameters of 'Parallelogram1' models (copy from relative model)
    parameter Boolean computeParallelogramLength = false "=true if the long side length is a guess value, =false if it is a fixed value" annotation (Dialog(tab="Parallelogram1")); 

    // Models
    Modelica.Blocks.Interfaces.RealInput angleRef[3] annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    
    DeltaRobot.Components.IdealActuatorPos idealActuatorPos1(
      Tf = Tf,
      initType = initType,
      y_start = y_start,
      y_startFixed = y_startFixed)
      annotation(Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    DeltaRobot.Components.IdealActuatorPos idealActuatorPos2(
      Tf = Tf,
      initType = initType,
      y_start = y_start,
      y_startFixed = y_startFixed)
      annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    DeltaRobot.Components.IdealActuatorPos idealActuatorPos3(
      Tf = Tf,
      initType = initType,
      y_start = y_start,
      y_startFixed = y_startFixed)
      annotation(Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    
    DeltaRobot.Components.Parallelogram1 parallelogram1_1(
      armParameters = armParameters_in,
      computeParallelogramLength = computeParallelogramLength)
      annotation(Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DeltaRobot.Components.Parallelogram1 parallelogram1_2(
      armParameters = armParameters_in,
      computeParallelogramLength = computeParallelogramLength)
      annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    DeltaRobot.Components.Parallelogram1 parallelogram1_3(
      armParameters = armParameters_in,
      computeParallelogramLength = computeParallelogramLength)
      annotation(Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  connect(frame_base[1], idealActuatorPos1.frame_a) annotation(Line(points = {{0, 100}, {-50, 100}, {-50, 80}}, color = {95, 95, 95}));
  connect(frame_base[2], idealActuatorPos2.frame_a) annotation(Line(points = {{0, 100}, {0, 80}}, color = {95, 95, 95}));
  connect(frame_base[3], idealActuatorPos3.frame_a) annotation(Line(points = {{0, 100}, {50, 100}, {50, 80}, {50, 80}}, color = {95, 95, 95}));
  
  connect(idealActuatorPos1.frame_b, upperArm1.frame_a) annotation(Line(points = {{-50, 60}, {-50, 40}}));
  connect(idealActuatorPos2.frame_b, upperArm2.frame_a) annotation(Line(points = {{0, 60}, {0, 40}}));
  connect(idealActuatorPos3.frame_b, upperArm3.frame_a) annotation(Line(points = {{50, 60}, {50, 60}, {50, 40}, {50, 40}}));
  
  connect(upperArm1.frame_b, parallelogram1_1.frame_a) annotation(Line(points = {{-50, 20}, {-50, 20}, {-50, -20}, {-50, -20}}));
  connect(upperArm2.frame_b, parallelogram1_2.frame_a) annotation(Line(points = {{0, 20}, {0, 20}, {0, -20}, {0, -20}}));
  connect(upperArm3.frame_b, parallelogram1_3.frame_a) annotation(Line(points = {{50, 20}, {50, 20}, {50, -20}, {50, -20}}));
  
  connect(parallelogram1_1.frame_b, frame_platform[1]) annotation(Line(points = {{-50, -40}, {-50, -40}, {-50, -100}, {0, -100}, {0, -100}}));
  connect(parallelogram1_2.frame_b, frame_platform[2]) annotation(Line(points = {{0, -40}, {0, -40}, {0, -100}, {0, -100}}));
  connect(parallelogram1_3.frame_b, frame_platform[3]) annotation(Line(points = {{50, -40}, {50, -40}, {50, -100}, {0, -100}, {0, -100}}));
  
  connect(idealActuatorPos1.angleRef, angleRef[1]) annotation(Line(points = {{-38, 70}, {-112, 70}, {-112, 0}, {-120, 0}}, color = {0, 0, 127}));
  connect(idealActuatorPos2.angleRef, angleRef[2]) annotation(Line(points = {{12, 70}, {-106, 70}, {-106, 0}, {-120, 0}}, color = {0, 0, 127}));
  connect(idealActuatorPos3.angleRef, angleRef[3]) annotation(Line(points = {{62, 70}, {-118, 70}, {-118, 0}, {-120, 0}}, color = {0, 0, 127}));

end ThreeArms_P1_IdealActPos;
