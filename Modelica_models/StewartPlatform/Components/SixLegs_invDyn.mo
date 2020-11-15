within StewartPlatform.Components;

model SixLegs_invDyn "Six-Legs model for inverse dynamic"
    extends StewartPlatform.Icons.SixLegs_invDyn; // Icon

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

// Models
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_base[6] "Frames for connection with the platform's joints" annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,-100})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_platform[6] "Frames for connection with the platform's joints" annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100})));
  Interfaces.ControlBus controlBus annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=90,origin={-100,2}), iconTransformation(extent={{-16,16},{16,-16}},rotation=90,origin={-102,0})));
  StewartPlatform.Interfaces.ControlBus_signalSelector controlBus_signalSelector(connect_angularAcc = true, connect_angularPos = true, connect_angularVel = true, connect_appliedTorque = false, connect_refTorque = false)  annotation(Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput appliedTorque[6] annotation(Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Leg_invDyn leg1
    (
      universalJointParameters = universalJointParameters[1],
      electricCylinderParameters = electricCylinderParameters[1],
      sphericalJointParameters = sphericalJointParameters[1]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-72,0})));
      
  Leg_invDyn leg2
    (
      universalJointParameters = universalJointParameters[2],
      electricCylinderParameters = electricCylinderParameters[2],
      sphericalJointParameters = sphericalJointParameters[2]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-42,0})));

  Leg_invDyn leg3
    (
      universalJointParameters = universalJointParameters[3],
      electricCylinderParameters = electricCylinderParameters[3],
      sphericalJointParameters = sphericalJointParameters[3]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,0})));

  Leg_invDyn leg4
    (
      universalJointParameters = universalJointParameters[4],
      electricCylinderParameters = electricCylinderParameters[4],
      sphericalJointParameters = sphericalJointParameters[4]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={18,0})));

  Leg_invDyn leg5
    (
      universalJointParameters = universalJointParameters[5],
      electricCylinderParameters = electricCylinderParameters[5],
      sphericalJointParameters = sphericalJointParameters[5]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={48,0})));

  Leg_invDyn leg6
    (
      universalJointParameters = universalJointParameters[6],
      electricCylinderParameters = electricCylinderParameters[6],
      sphericalJointParameters = sphericalJointParameters[6]
    )
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={78,0})));

equation
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

  connect(controlBus, controlBus_signalSelector.controlBus_in);

  connect(controlBus_signalSelector.controlBus_out.axisControlBus1, leg1.axisControlBus) annotation (Line(points={{-99.95,2.05},{-99.95,-20},{-74.5,-20},{-74.5,-8.1}},color={255,204,51},thickness=0.5));
  connect(controlBus_signalSelector.controlBus_out.axisControlBus2, leg2.axisControlBus) annotation (Line(points={{-99.95,2.05},{-99.95,-20},{-44.5,-20},{-44.5,-8.1}},color={255,204,51},thickness=0.5));
  connect(controlBus_signalSelector.controlBus_out.axisControlBus3, leg3.axisControlBus) annotation (Line(points={{-99.95,2.05},{-99.95,-20},{-14.5,-20},{-14.5,-8.1}},color={255,204,51},thickness=0.5));
  connect(controlBus_signalSelector.controlBus_out.axisControlBus4, leg4.axisControlBus) annotation (Line(points={{-99.95,2.05},{-99.95,-20},{15.5,-20},{15.5,-8.1}},color={255,204,51},thickness=0.5));
  connect(controlBus_signalSelector.controlBus_out.axisControlBus5, leg5.axisControlBus) annotation (Line(points={{-99.95,2.05},{-99.95,-20},{45.5,-20},{45.5,-8.1}},color={255,204,51},thickness=0.5));
  connect(controlBus_signalSelector.controlBus_out.axisControlBus6, leg6.axisControlBus) annotation (Line(points={{-99.95,2.05},{-99.95,-20},{73.5,-20},{73.5,-8.1}},color={255,204,51},thickness=0.5));

  connect(leg1.axisControlBus.appliedTorque, appliedTorque[1]) annotation (Line(origin = {87, -10}, points = {{13, 10}, {7, 10}, {7, -10}, {-13, -10}, {-13, -10}},color={255,204,51},thickness=0.5));
  connect(leg2.axisControlBus.appliedTorque, appliedTorque[2]);
  connect(leg3.axisControlBus.appliedTorque, appliedTorque[3]);
  connect(leg4.axisControlBus.appliedTorque, appliedTorque[4]);
  connect(leg5.axisControlBus.appliedTorque, appliedTorque[5]);
  connect(leg6.axisControlBus.appliedTorque, appliedTorque[6]);
  
annotation(
    Diagram(graphics = {Line()}));
end SixLegs_invDyn;
