within DeltaRobot.Components;

model GearReducer "Model of a gearbox reducer"
    extends DeltaRobot.Icons.GearReducer;     // Icon
    
    // Parameters
    parameter DeltaRobot.Types.ReducerParameters reducerParameters "Parameters of the gearbox reducer";
    final parameter Real ratio = reducerParameters.ratio;

    // Variables (useful to plot results of simulations)
    /* // RIMUOVI COMMENTI SE USI 'Modelica.Mechanics.Rotational.Components.LossyGear'
    SI.Power lossPower "Loss power";
    SI.Angle phi_a "Absolute angle of shaft flange_a";
    SI.AngularVelocity w_a "Angular velocity of flange_a";
    SI.AngularAcceleration a_a "Angular acceleration of flange_a";
    SI.Angle phi_b "Absolute angle of shaft flange_b";
    SI.AngularVelocity w_b "Angular velocity of flange_b";
    SI.AngularAcceleration a_b "Angular acceleration of flange_b";
    SI.Torque tau_bf1 "Absolute resultant bearing friction torque with respect to flange_a in case that flange_a is driving (= |tau_bf_a*eta_mf1 + tau_bf_b/i|)";
    SI.Torque tau_bf2 "Absolute resultant bearing friction torque with respect to flange_a in case that flange_b is driving (= |tau_bf_a/eta_mf2 + tau_bf_b/i|)";
    */
    
    // Models
    /* // NOTA: Il modello 'Modelica.Mechanics.Rotational.Components.LossyGear' causa problemi nelle simulazioni (matrici singolari). Viene sostituito con il più semplice "Modelica.Mechanics.Rotational.Components.IdealGear"
    Modelica.Mechanics.Rotational.Components.LossyGear gear( lossTable=[0,reducerParameters.eta_mf1,reducerParameters.eta_mf2,reducerParameters.coulombOffset_a,reducerParameters.coulombOffset_b; 1,reducerParameters.eta_mf1,reducerParameters.eta_mf2,reducerParameters.coulombOffset_a + reducerParameters.viscousCoeff_a,reducerParameters.coulombOffset_b + reducerParameters.viscousCoeff_b],ratio=reducerParameters.ratio)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    */
    Modelica.Mechanics.Rotational.Components.IdealGear gear(ratio=reducerParameters.ratio)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

    Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation
    /* // RIMUOVI COMMENTI SE USI 'Modelica.Mechanics.Rotational.Components.LossyGear'
    lossPower = gear.lossPower;

    phi_a = gear.phi_a;
    phi_b = gear.phi_b;

    w_a = gear.w_a;
    w_b = w_a/ratio;

    a_a = gear.a_a;
    a_b = a_a/ratio;

    tau_bf1=gear.tau_bf1;
    tau_bf2=gear.tau_bf2;
    */

    connect(flange_a, gear.flange_a) annotation (Line(points={{-100,0},{-10,0}}, color={0,0,0}));
    connect(gear.flange_b, flange_b) annotation (Line(points={{10,0},{100,0}}, color={0,0,0}));

end GearReducer;
