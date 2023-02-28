within DeltaRobot.Components;

model ThreeArms_P1_IdealActPos
  extends DeltaRobot.Icons.ThreeArms_IdealActPos;   // Icon
  extends PartialThreeArms;
  
  // Models
      Modelica.Blocks.Interfaces.RealInput angleRef[3] annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      
      DeltaRobot.Components.IdealActuatorPos idealActuatorPos1(
        actuatorParameters = actuatorParameters[1],
        reducerParameters = reducerParameters[1])
        annotation(Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));

      DeltaRobot.Components.IdealActuatorPos idealActuatorPos2(
        actuatorParameters = actuatorParameters[2],
        reducerParameters = reducerParameters[2])
        annotation(Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));

      DeltaRobot.Components.IdealActuatorPos idealActuatorPos3(
        actuatorParameters = actuatorParameters[3],
        reducerParameters = reducerParameters[3])
        annotation(Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      
      DeltaRobot.Components.Parallelogram1 parallelogram1_1(
        armParameters = armParameters[1])
        annotation(Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

      DeltaRobot.Components.Parallelogram1 parallelogram1_2(
        armParameters = armParameters[2])
        annotation(Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

      DeltaRobot.Components.Parallelogram1 parallelogram1_3(
        armParameters = armParameters[3])
        annotation(Placement(visible = true, transformation(origin = {50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  motorTorqueDIS[1] = idealActuatorPos1.torque;
  motorTorqueDIS[2] = idealActuatorPos2.torque;
  motorTorqueDIS[3] = idealActuatorPos3.torque;

  motorVelocityDIS[1] = idealActuatorPos1.velocity;
  motorVelocityDIS[2] = idealActuatorPos2.velocity;
  motorVelocityDIS[3] = idealActuatorPos3.velocity;

  connect(frame_base[1], idealActuatorPos1.frame_a) annotation(Line(points = {{0, 100}, {-50, 100}, {-50, 80}}, color = {95, 95, 95}));
  connect(frame_base[2], idealActuatorPos2.frame_a) annotation(Line(points = {{0, 100}, {0, 80}}, color = {95, 95, 95}));
  connect(frame_base[3], idealActuatorPos3.frame_a) annotation(Line(points = {{0, 100}, {50, 100}, {50, 80}}, color = {95, 95, 95}));
  
  connect(idealActuatorPos1.frame_b, upperArm1.frame_a) annotation(Line(points = {{-50, 60}, {-50, 40}}));
  connect(idealActuatorPos2.frame_b, upperArm2.frame_a) annotation(Line(points = {{0, 60}, {0, 40}}));
  connect(idealActuatorPos3.frame_b, upperArm3.frame_a) annotation(Line(points = {{50, 60}, {50, 40}}));
  
  connect(upperArm1.frame_b, parallelogram1_1.frame_a) annotation(Line(points = {{-50, 20}, {-50, 20}, {-50, -20}, {-50, -20}}));
  connect(upperArm2.frame_b, parallelogram1_2.frame_a) annotation(Line(points = {{0, 20}, {0, 20}, {0, -20}, {0, -20}}));
  connect(upperArm3.frame_b, parallelogram1_3.frame_a) annotation(Line(points = {{50, 20}, {50, 20}, {50, -20}, {50, -20}}));
  
  connect(parallelogram1_1.frame_b, frame_platform[1]) annotation(Line(points = {{-50, -40}, {-50, -40}, {-50, -100}, {0, -100}, {0, -100}}));
  connect(parallelogram1_2.frame_b, frame_platform[2]) annotation(Line(points = {{0, -40}, {0, -40}, {0, -100}, {0, -100}}));
  connect(parallelogram1_3.frame_b, frame_platform[3]) annotation(Line(points = {{50, -40}, {50, -40}, {50, -100}, {0, -100}, {0, -100}}));
  
  connect(angleRef[1], idealActuatorPos1.angleRef) annotation(Line(points = {{-120, 0}, {-84, 0}, {-84, 70}, {-62, 70}, {-62, 70}}, color = {0, 0, 127}));
  connect(angleRef[2], idealActuatorPos2.angleRef) annotation(Line(points = {{-120, 0}, {-90, 0}, {-90, 88}, {-30, 88}, {-30, 70}, {-12, 70}, {-12, 70}}, color = {0, 0, 127}));
  connect(angleRef[3], idealActuatorPos3.angleRef) annotation(Line(points = {{-120, 0}, {-94, 0}, {-94, 94}, {20, 94}, {20, 70}, {38, 70}, {38, 70}}, color = {0, 0, 127})); 

end ThreeArms_P1_IdealActPos;
