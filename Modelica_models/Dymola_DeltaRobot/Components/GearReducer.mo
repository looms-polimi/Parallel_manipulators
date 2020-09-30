within DeltaRobot.Components;
model GearReducer "Model of a gearbox reducer"
  extends Modelica.Mechanics.Rotational.Icons.Gearbox;

  //Parameters
    parameter DeltaRobot.Types.ReducerParameters reducerParameters "Parameters of the gearbox";
    final parameter Real ratio = reducerParameters.ratio;

  //Varaibles
    SI.Power lossPower "Loss power";
    SI.Angle phi_a "Absolute angle of shaft flange_a";
    SI.AngularVelocity w_a "Angular velocity of flange_a";
    SI.AngularAcceleration a_a "Angular acceleration of flange_a";
    SI.Angle phi_b "Absolute angle of shaft flange_b";
    SI.AngularVelocity w_b "Angular velocity of flange_b";
    SI.AngularAcceleration a_b "Angular acceleration of flange_b";
    SI.Torque tau_bf1 "Absolute resultant bearing friction torque with respect to flange_a in case that flange_a is driving (= |tau_bf_a*eta_mf1 + tau_bf_b/i|)";
    SI.Torque tau_bf2 "Absolute resultant bearing friction torque with respect to flange_a in case that flange_b is driving (= |tau_bf_a/eta_mf2 + tau_bf_b/i|)";

  Modelica.Mechanics.Rotational.Components.LossyGear lossyGear(ratio=reducerParameters.ratio, lossTable=[0,reducerParameters.eta_mf1,reducerParameters.eta_mf2,reducerParameters.coulombOffset_a,reducerParameters.coulombOffset_b; 1,reducerParameters.eta_mf1,reducerParameters.eta_mf2,reducerParameters.coulombOffset_a +
        reducerParameters.viscousCoeff_a,reducerParameters.coulombOffset_b + reducerParameters.viscousCoeff_b])      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{90,-10},{110,10}})));
equation
  lossPower = lossyGear.lossPower;

  phi_a = lossyGear.phi_a;
  phi_b = lossyGear.phi_b;

  w_a = lossyGear.w_a;
  w_b = w_a/ratio;

  a_a = lossyGear.a_a;
  a_b = a_a/ratio;

  tau_bf1=lossyGear.tau_bf1;
  tau_bf2=lossyGear.tau_bf2;

  connect(flange_a, lossyGear.flange_a) annotation (Line(points={{-100,0},{-10,0}}, color={0,0,0}));
  connect(lossyGear.flange_b, flange_b) annotation (Line(points={{10,0},{100,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true), graphics={
                                  Text(
              extent={{-150,150},{150,110}},
              lineColor={0,0,255},
              textString="%name"),Text(
              extent={{-150,70},{150,100}},
              lineColor={0,0,0},
          textString="ratio=%reducerParameters.ratio")}),        Diagram(coordinateSystem(preserveAspectRatio=true)),
    __Dymola_LockedEditing="Finito");
end GearReducer;
