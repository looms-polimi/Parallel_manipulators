within StewartPlatform.Components;

model SixLegs_invDyn2 "Six-Legs model for inverse dynamic"
    extends StewartPlatform.Icons.SixLegs_invDyn; 
// Icon
  // Imports
    import StewartPlatform.Functions.*;
    import StewartPlatform.Types.*;

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp;

// Universal joints
    parameter UniversalJointParameters universalJointParameters[6] = gp.universalJointParameters "Parameters of the universal joints" annotation (Dialog(group="Universal joints"));

// Electric Cylinders
    parameter ElectricCylinderParameters electricCylinderParameters[6] = 
        {
            ElectricCylinderParameters(stateSelect = StateSelect.prefer, initialLengthFixed = false, initialVelFixed = false, initialAccFixed = false, initialLength = gp.ec_initialLength[1]),
            ElectricCylinderParameters(stateSelect = StateSelect.prefer, initialLengthFixed = false, initialVelFixed = false, initialAccFixed = false, initialLength = gp.ec_initialLength[2]),
            ElectricCylinderParameters(stateSelect = StateSelect.prefer, initialLengthFixed = false, initialVelFixed = false, initialAccFixed = false, initialLength = gp.ec_initialLength[3]),
            ElectricCylinderParameters(stateSelect = StateSelect.prefer, initialLengthFixed = false, initialVelFixed = false, initialAccFixed = false, initialLength = gp.ec_initialLength[4]),
            ElectricCylinderParameters(stateSelect = StateSelect.prefer, initialLengthFixed = false, initialVelFixed = false, initialAccFixed = false, initialLength = gp.ec_initialLength[5]),
            ElectricCylinderParameters(stateSelect = StateSelect.prefer, initialLengthFixed = false, initialVelFixed = false, initialAccFixed = false, initialLength = gp.ec_initialLength[6])
        } "Parameters of the electric cylinders" annotation (Dialog(group="Electric cylinders"));       
// Spherical joints
    parameter SphericalJointParameters sphericalJointParameters[6] = gp.sphericalJointParameters "Parameters of the spherical joints" annotation (Dialog(group="Spherical joints"));

// Variables
    SI.Torque motorTorqueDIS[6] "Display torque applied by motors";

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_base[6] "Frames for connection with the platform's joints" annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,-100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_platform[6] "Frames for connection with the platform's joints" annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100})));
  Modelica.Blocks.Interfaces.RealOutput appliedTorque[6] annotation(Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Leg_invDyn2 leg1
    (
      universalJointParameters = universalJointParameters[1],
      electricCylinderParameters = electricCylinderParameters[1],
      sphericalJointParameters = sphericalJointParameters[1]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-72,0})));
      
  Leg_invDyn2 leg2
    (
      universalJointParameters = universalJointParameters[2],
      electricCylinderParameters = electricCylinderParameters[2],
      sphericalJointParameters = sphericalJointParameters[2]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-42,0})));

  Leg_invDyn2 leg3
    (
      universalJointParameters = universalJointParameters[3],
      electricCylinderParameters = electricCylinderParameters[3],
      sphericalJointParameters = sphericalJointParameters[3]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,0})));

  Leg_invDyn2 leg4
    (
      universalJointParameters = universalJointParameters[4],
      electricCylinderParameters = electricCylinderParameters[4],
      sphericalJointParameters = sphericalJointParameters[4]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={18,0})));

  Leg_invDyn2 leg5
    (
      universalJointParameters = universalJointParameters[5],
      electricCylinderParameters = electricCylinderParameters[5],
      sphericalJointParameters = sphericalJointParameters[5]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={48,0})));

  Leg_invDyn2 leg6
    (
      universalJointParameters = universalJointParameters[6],
      electricCylinderParameters = electricCylinderParameters[6],
      sphericalJointParameters = sphericalJointParameters[6]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={78,0})));
  Modelica.Blocks.Interfaces.RealInput angularPos[6] annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 62}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angularVel[6] annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput angularAcc[6] annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  motorTorqueDIS[2]=leg2.servoMotor.angleToTorque.tau;
  motorTorqueDIS[1]=leg1.servoMotor.angleToTorque.tau;
  motorTorqueDIS[3]=leg3.servoMotor.angleToTorque.tau;
  motorTorqueDIS[4]=leg4.servoMotor.angleToTorque.tau;
  motorTorqueDIS[5]=leg5.servoMotor.angleToTorque.tau;
  motorTorqueDIS[6]=leg6.servoMotor.angleToTorque.tau;

  connect(frame_platform[1], leg1.frame_b) annotation (Line(points={{0,86.6667},{-68,86.6667},{-68,15.8}},color={95,95,95},thickness=0.5));
  connect(frame_platform[2], leg2.frame_b) annotation (Line(points={{0,92},{-38,92},{-38,15.8}},color={95,95,95},thickness=0.5));
  connect(frame_platform[3], leg3.frame_b) annotation (Line(points={{0,97.3333},{-8,97.3333},{-8,15.8}},color={95,95,95},thickness=0.5));
  connect(frame_platform[4], leg4.frame_b) annotation (Line(points={{0,102.667},{22,102.667},{22,15.8}},color={95,95,95},thickness=0.5));
  connect(frame_platform[5], leg5.frame_b) annotation (Line(points={{0,108},{52,108},{52,15.8}},color={95,95,95},thickness=0.5));
  connect(frame_platform[6], leg6.frame_b) annotation (Line(points={{0,113.333},{80,113.333},{80,15.8}},color={95,95,95},thickness=0.5));

  connect(frame_base[1], leg1.frame_a) annotation (Line(points={{0,-113.333},{-68,-113.333},{-68,-13.6}},color={95,95,95},thickness=0.5));
  connect(frame_base[2], leg2.frame_a) annotation (Line(points={{0,-108},{-38,-108},{-38,-13.6}},color={95,95,95},thickness=0.5));
  connect(frame_base[3], leg3.frame_a) annotation (Line(points={{0,-102.667},{-8,-102.667},{-8,-13.6}},color={95,95,95},thickness=0.5));
  connect(frame_base[4], leg4.frame_a) annotation (Line(points={{0,-97.3333},{22,-97.3333},{22,-13.6}},color={95,95,95},thickness=0.5));
  connect(frame_base[5], leg5.frame_a) annotation (Line(points={{0,-92},{52,-92},{52,-13.6}},color={95,95,95},thickness=0.5));
  connect(frame_base[6], leg6.frame_a) annotation (Line(points={{0,-86.6667},{80,-86.6667},{80,-13.6}},color={95,95,95},thickness=0.5));

  connect(angularPos[1], leg1.angularPos) annotation(
    Line(points = {{-120, 60}, {-88, 60}, {-88, 6}, {-84, 6}}, color = {0, 0, 127}));
  connect(angularPos[2], leg2.angularPos) annotation(
    Line(points = {{-120, 60}, {-58, 60}, {-58, 6}, {-54, 6}}, color = {0, 0, 127}));
  connect(angularPos[3], leg3.angularPos) annotation(
    Line(points = {{-120, 60}, {-28, 60}, {-28, 6}, {-24, 6}}, color = {0, 0, 127}));
  connect(angularPos[4], leg4.angularPos) annotation(
    Line(points = {{-120, 60}, {2, 60}, {2, 6}, {6, 6}}, color = {0, 0, 127}));
  connect(angularPos[5], leg5.angularPos) annotation(
    Line(points = {{-120, 60}, {32, 60}, {32, 6}, {36, 6}}, color = {0, 0, 127}));
  connect(angularPos[6], leg6.angularPos) annotation(
    Line(points = {{-120, 60}, {62, 60}, {62, 6}, {66, 6}}, color = {0, 0, 127}));
  connect(angularVel[1], leg1.angularVel) annotation(
    Line(points = {{-120, 0}, {-84, 0}}, color = {0, 0, 127}));
  connect(angularVel[2], leg2.angularVel) annotation(
    Line(points = {{-120, 0}, {-94, 0}, {-94, 20}, {-58, 20}, {-58, 0}, {-54, 0}}, color = {0, 0, 127}));
  connect(angularVel[3], leg3.angularVel) annotation(
    Line(points = {{-120, 0}, {-94, 0}, {-94, 20}, {-28, 20}, {-28, 0}, {-24, 0}}, color = {0, 0, 127}));
  connect(angularVel[4], leg4.angularVel) annotation(
    Line(points = {{-120, 0}, {-94, 0}, {-94, 20}, {2, 20}, {2, 0}, {6, 0}}, color = {0, 0, 127}));
  connect(angularVel[5], leg5.angularVel) annotation(
    Line(points = {{-120, 0}, {-94, 0}, {-94, 20}, {32, 20}, {32, 0}, {36, 0}}, color = {0, 0, 127}));
  connect(angularVel[6], leg6.angularVel) annotation(
    Line(points = {{-120, 0}, {-94, 0}, {-94, 20}, {62, 20}, {62, 0}, {66, 0}}, color = {0, 0, 127}));
  connect(angularAcc[1], leg1.AngularAcc) annotation(
    Line(points = {{-120, -60}, {-88, -60}, {-88, -6}, {-84, -6}}, color = {0, 0, 127}));
  connect(angularAcc[2], leg2.AngularAcc) annotation(
    Line(points = {{-120, -60}, {-88, -60}, {-88, -20}, {-58, -20}, {-58, -6}, {-54, -6}}, color = {0, 0, 127}));
  connect(angularAcc[3], leg3.AngularAcc) annotation(
    Line(points = {{-120, -60}, {-88, -60}, {-88, -20}, {-28, -20}, {-28, -6}, {-24, -6}}, color = {0, 0, 127}));
  connect(angularAcc[4], leg4.AngularAcc) annotation(
    Line(points = {{-120, -60}, {-88, -60}, {-88, -20}, {2, -20}, {2, -6}, {6, -6}}, color = {0, 0, 127}));
  connect(angularAcc[5], leg5.AngularAcc) annotation(
    Line(points = {{-120, -60}, {-88, -60}, {-88, -20}, {32, -20}, {32, -6}, {36, -6}}, color = {0, 0, 127}));
  connect(angularAcc[6], leg6.AngularAcc) annotation(
    Line(points = {{-120, -60}, {-88, -60}, {-88, -20}, {62, -20}, {62, -6}, {66, -6}}, color = {0, 0, 127}));
  connect(leg1.appliedTorque, appliedTorque[1]) annotation(
    Line(points = {{-60, 0}, {-60, -40}, {94, -40}, {94, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(leg2.appliedTorque, appliedTorque[2]) annotation(
    Line(points = {{-30, 0}, {-30, -40}, {94, -40}, {94, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(leg3.appliedTorque, appliedTorque[3]) annotation(
    Line(points = {{0, 0}, {0, -40}, {94, -40}, {94, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(leg4.appliedTorque, appliedTorque[4]) annotation(
    Line(points = {{30, 0}, {30, -40}, {94, -40}, {94, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(leg5.appliedTorque, appliedTorque[5]) annotation(
    Line(points = {{60, 0}, {60, -40}, {94, -40}, {94, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(leg6.appliedTorque, appliedTorque[6]) annotation(
    Line(points = {{90, 0}, {110, 0}}, color = {0, 0, 127}));  
annotation(
    Diagram(graphics = {Line()}));
end SixLegs_invDyn2;
