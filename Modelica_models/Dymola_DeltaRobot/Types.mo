within DeltaRobot;
package Types "Package with records and new types of variable"
  extends Modelica.Icons.TypesPackage;

  record DiscParameters "Collection of all parameters of a cylindrical disc"
    extends Modelica.Icons.Record;

    parameter SI.Diameter D "Diameter of the circumference where the joints are located";
    parameter SI.Diameter De = D*1.1 "Disc diameter";
    parameter SI.Thickness thickness= D*0.1 "Disc thickness";
    parameter SI.Mass mass = 1 "Disc mass";
    final parameter SI.Angle alpha = from_deg(120) "Angle between two joints";
    final parameter SI.Angle beta = from_deg(-90) "Angle from the x-axis of the disc frame to the direction where the joint 1 is located"; //NON CAMBIARE MAI!!!!! O LE FUNZIONI DI INIZIALIZZAZIONE NON FUNZIONANO PIU' CORRETTAMENTE
    final parameter SI.Area area = De^2*pi/4 "Disc base area";
    final parameter SI.Volume volume = area*thickness "Disc volume";
    final parameter SI.Density density = mass/volume "Disc density";

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
      __Dymola_LockedEditing="Controllato");
  end DiscParameters;

  record ServoMotorParameters "Collection of parameters for a servo motor"
    extends Modelica.Icons.Record;

    parameter SI.Frequency bandwidth(min=0) = 10000 "Bandwidth of the torque control";
    parameter Integer np(min=1) = 4 "Number of pole pairs (Integer)" annotation (Dialog(group="Servo motor"));
    parameter SI.Resistance Rs(min=0) = 3.14 "Stator resistance per phase" annotation (Dialog(group="Servo motor"));
    parameter SI.Inductance L(min=0) = 0.0033 "Stator inductance per phase" annotation (Dialog(group="Servo motor"));
    parameter SI.ElectricalTorqueConstant Psi(min=0) = 0.12 "Torque constant, T=np*Psi*i_sq" annotation (Dialog(group="Servo motor"));
    parameter Real Ke(unit="V/(rad/s)",min=0) = Psi "Voltage constant, the induced motor EMF is E=Ke*omega, omega = electrical_speed" annotation (Dialog(group="Servo motor"));
    parameter SI.Inertia J = 1.37e-4 "Rotor moment of inertia" annotation (Dialog(group="Servo motor"));
    parameter SI.Mass weight = 3.8 "Mass" annotation (Dialog(group="Servo motor"));

    parameter SI.Voltage Vmax(min=0)= 200 "Inverter max voltage" annotation (Dialog(group="Servo drive"));
    parameter SI.Torque Tmax(min=0) = 8.2 "Max torque" annotation (Dialog(group="Servo motor"));
    final parameter SI.Current Imax(min=0) = Tmax/np/Psi "Inverter max current" annotation (Dialog(group="Servo drive"));

    final parameter SI.Inductance Ls = 3/2*L "Synchronous inductance";

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
      __Dymola_LockedEditing="Finito");
  end ServoMotorParameters;

  record ReducerParameters "Collection of all parameters for a gear reducer"
    extends Modelica.Icons.Record;

    parameter Real ratio = 20  "Transmission ratio (flange_a.phi/flange_b.phi)";
    parameter SI.Torque coulombOffset_a = 0 "Static friction in bearing friction torque on the flange_a side";
    parameter SI.Torque coulombOffset_b = 0 "Static friction in bearing friction torque on the flange_b side";
    parameter Real viscousCoeff_a = 0 "Viscous friction coefficient in bearing friction torque on the flange_a side";
    parameter Real viscousCoeff_b = 0 "Viscous friction coefficient in bearing friction torque on the flange_b side";
    parameter Real eta_mf1(unit="1") = 1 "Mesh efficiency in case that flange_a is driving";
    parameter Real eta_mf2(unit="1") = 1 "Mesh efficiency in case that flange_b is driving";

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ReducerParameters;

  record ArmParameters "Collection of all parameters of upper arm and parallelogram"
    extends Modelica.Icons.Record;

    //Upper arm
    parameter SI.Distance L = 0.2575 "Length" annotation(Dialog(group="Upper arm"));
    parameter SI.Diameter D = 0.03 "Diameter" annotation(Dialog(group="Upper arm")); //??
    parameter SI.Mass M = 6 "Mass" annotation(Dialog(group="Upper arm")); //??

    //Parallelogram
    parameter SI.Distance l = 0.7 "Long side length" annotation(Dialog(group="Parallelogram"));
    parameter SI.Distance h = 0.1 "Short side length" annotation(Dialog(group="Parallelogram")); //??
    parameter SI.Diameter Dl = 0.01 "Diameter of the long side" annotation(Dialog(group="Parallelogram")); //??
    parameter SI.Diameter Dh = 0.01 "Diameter of the short side" annotation(Dialog(group="Parallelogram")); //??
    parameter SI.Mass Ml = 2 "Mass of the long side" annotation(Dialog(group="Parallelogram")); //??
    parameter SI.Mass Mh = 2 "Mass of the short side" annotation(Dialog(group="Parallelogram")); //??

    //Limits
    parameter SI.Angle maxTheta = from_deg(85) "Max actuator angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle minTheta = from_deg(-85) "Min actuator angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxElbowAngle = from_deg(160) "Max internal angle between the upper arm and the parallelogram (=180 are aligned)" annotation(Dialog(group="Limits"));
    parameter SI.Angle minElbowAngle = from_deg(20) "Min internal angle between the upper arm and the parallelogram (=0 are overlap)" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxParallelogramAngle = from_deg(30) "Max parallelogram direction angle (ParallelogramAngle=0->rectangle)" annotation(Dialog(group="Limits"));
    parameter SI.Angle minParallelogramAngle = from_deg(-30) "Min parallelogram direction angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle maxPlatformAngle = from_deg(180) "Max angle between parallelogram and platform" annotation(Dialog(group="Limits"));
    parameter SI.Angle minPlatformAngle = from_deg(80) "Min angle between parallelogram and platform" annotation(Dialog(group="Limits"));

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ArmParameters;

  type Direction = enumeration(
      up   "up: from x-y plane use z axis as direction for the cylinder",
      down "down: from x-y plane use negative z axis as direction for the cylinder") "Enumeration used to select the cylinder direction in the model 'Disc'" annotation (
      __Dymola_LockedEditing="Controllato");
end Types;
