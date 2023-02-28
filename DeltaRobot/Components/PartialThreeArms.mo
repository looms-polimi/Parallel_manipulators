within DeltaRobot.Components;

partial model PartialThreeArms "Partial model of the three arms of a Delta robot"

    // Imports
      import DeltaRobot.Functions.*;
      import DeltaRobot.Types.*;

    // Parameters
      outer DeltaRobot.Components.GlobalParameters gp;

    // Arms
      parameter ArmParameters armParameters[3] = gp.armParameters "Parameters of the arms" annotation (Dialog(group="Arms"));

    // Actuators
      parameter ActuatorParameters actuatorParameters[3] = gp.actuatorParameters "Parameters of the rotary actuators" annotation (Dialog(group="Actuators"));

    // Reducers
      parameter ReducerParameters reducerParameters[3] = gp.reducerParameters "Parameters of the gearbox reducers" annotation (Dialog(group="Reducers"));

// Variables
    SI.Torque motorTorqueDIS[3] "Display torque applied by motors";
    SI.AngularVelocity motorVelocityDIS[3] "Angular velocity of morots";

public
    // Models
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_base[3] "Frames for connection with the base's joints" annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_platform[3] "Frames for connection with the platform's joints" annotation (Placement(transformation(extent={{-17,-16},{17,16}},rotation=90,origin={-1,-100})));

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm1(
        r={armParameters[1].L,0,0},
        diameter=armParameters[1].D,
        density=4*armParameters[1].M/(armParameters[1].D^2*pi*armParameters[1].L))
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-50,30})));

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm2(
        r={armParameters[2].L,0,0},
        density=4*armParameters[2].M/(armParameters[2].D^2*pi*armParameters[2].L),
        diameter=armParameters[2].D)
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={0,30})));

      Modelica.Mechanics.MultiBody.Parts.BodyCylinder upperArm3(
        r={armParameters[3].L,0,0},
        diameter=armParameters[3].D,
        density=4*armParameters[3].M/(armParameters[3].D^2*pi*armParameters[3].L))
        annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={50,30})));

equation

end PartialThreeArms;
