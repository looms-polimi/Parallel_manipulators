within StewartPlatform;

package Types "Types and records of parameters"
  extends Modelica.Icons.TypesPackage;

  // TYPES
  type Pitch = Real (final quantity="Pitch",final  unit="mm/rev",min=0) "Millimeters of displacement for each revolution of the spindle/screw";
  type Direction = enumeration(
      up   "up: from x-y plane use z axis as direction for the cylinder",
      down "down: from x-y plane use negative z axis as direction for the cylinder") 
      "Enumeration used to select the direction of the cylinder in the model 'Disc'";
  type SwitchTimeDef = enumeration(
      periods   "periods: define the duration of each signal",
      swithInstants   "swithInstants: define when to switch between two signals") 
      "Enumeration used to select how to define the switch time instants.";
  
  // RECORD DiscParameters
  record DiscParameters "Collection of all parameters of a cylindrical disc"
    extends Modelica.Icons.Record;
  
    parameter SI.Diameter D = 1 "Diameter of the circumference where the joints are located";
    parameter SI.Diameter De = D*1.1 "Disc diameter";
    parameter SI.Thickness thickness = D*0.1 "Disc thickness";
    parameter SI.Angle alpha "Angle between two joints";
    parameter SI.Mass mass = 1 "Disc mass";
    final parameter SI.Area area = De^2*pi/4 "Disc base area";
    final parameter SI.Volume volume = area*thickness "Disc volume";
    final parameter SI.Density density = mass/volume "Disc density";    
  end DiscParameters;
  
  // RECORD ElectricCylinderParameters
  record ElectricCylinderParameters "Collection of parameters of an electric cylinder with spindle drive"
    extends Modelica.Icons.Record;
  
      // Cylinder parameters
      parameter Pitch spindlePitch = 5 "Spindle pitch";
      parameter SI.Mass totalMass = 5 "Total mass";
      parameter SI.Mass movingMass = 2.5 "Moving mass";
      parameter Real ratio = 3 "Transmission ratio (servomotor.phi/spindle.phi)";
  
      // Geometry
      parameter SI.Distance workingStroke(displayUnit = "mm") = 0.8 "Working stroke" annotation (Dialog(group="Geometry"));
      parameter SI.Distance boxLength(displayUnit = "mm", min = workingStroke) = 0.944 "Length of the cover box" annotation (Dialog(group="Geometry"));
      parameter SI.Distance boxWidth(displayUnit = "mm") = 0.054 "Width of the cover box (animation)" annotation (Dialog(group="Geometry"));
      parameter SI.Distance minPistonLength(displayUnit = "mm") = 0.054 "Length of the outside part of the piston at -workingStroke/2 of stroke" annotation (Dialog(group="Geometry"));
  
      parameter SI.Distance pistonTotLength(displayUnit = "mm",min=workingStroke+minPistonLength,max=boxLength+minPistonLength) = boxLength+minPistonLength
        "Length of the cylinder that represents the piston (animation)" annotation (Dialog(group="Geometry"));
      parameter SI.Diameter pistonDiameter(displayUnit = "mm", max=boxWidth) = 0.024 "Piston diameter (animation)" annotation (Dialog(group="Geometry"));
  
      // Limits
      parameter SI.Force maxForce(min=0) = 3000 "Max feed force" annotation (Dialog(group="Limits"));
      parameter SI.Velocity maxSpeed(min=0) = 0.4 "Max speed" annotation (Dialog(group="Limits"));
      parameter SI.Acceleration maxAcceleration(min=0) = 5 "Max acceleration" annotation (Dialog(group="Limits"));
      parameter NonSI.AngularVelocity_rpm maxRotationalSpeed(min=0) = 4800 "Max rotational speed" annotation (Dialog(group="Limits"));
      parameter SI.Torque maxDrivingTorque(min=0) = 3 "Max driving torque" annotation (Dialog(group="Limits"));
  
      final parameter SI.Distance minLength = boxLength+minPistonLength "Min value for variable 'length'";
      final parameter SI.Distance maxLength = minLength+workingStroke "Max value for variable 'length'";
      final parameter SI.Length minStroke(max=0) = -workingStroke/2 "Min value for variable 'stroke'";
      final parameter SI.Length maxStroke(min=0) = workingStroke/2 "Max value for variable 'stroke'";
  
      // Friction
      parameter SI.Torque noLoadTorque(min=0) = 0.2 "No-load driving torque at spindle speed of 200 rpm" annotation (Dialog(group="Friction losses"));
      parameter SI.Torque frictionTorque_Tv(min=0) = 0.0417 "frictionTorque = noLoadTorque + frictionTorque_Tv + Kv*feedSpeed" annotation (Dialog(group="Friction losses"));
      parameter Real frictionTorque_Kv(final quantity="Slope",final unit="N.m/(m/s)") = 0.494 "frictionTorque = noLoadTorque + frictionTorque_Tv + Kv*feedSpeed" annotation (Dialog(group="Friction losses"));
      parameter Real effectiveTorque_Kf(final quantity="Slope",final unit="N.m/N") = 8e-4 "effectiveTorque = Kf*feedSpeed" annotation (Dialog(group="Friction losses"));
      parameter SI.Distance backlash(displayUnit = "mm") = 0.00004 "Reversing backlash (non implementato)" annotation (Dialog(group="Friction losses"));
  end ElectricCylinderParameters;

  // RECORD ServoMotorParameters
  record ServoMotorParameters "Collection of parameters of a servo motor"
    extends Modelica.Icons.Record;

    parameter SI.Frequency bandwidth(min=0) = 10000 "Bandwidth of the torque control";
    parameter Integer np(min=1) = 4 "Number of pole pairs (Integer)" annotation (Dialog(group="Servo motor"));
    parameter SI.Resistance Rs(min=0) = 1.95 "Stator resistance per phase" annotation (Dialog(group="Servo motor"));
    parameter SI.Inductance L(min=0) = 0.0061 "Stator inductance per phase" annotation (Dialog(group="Servo motor"));
    parameter SI.ElectricalTorqueConstant Psi(min=0) = 0.07 "Torque constant, T=np*Psi*i_sq" annotation (Dialog(group="Servo motor"));
    parameter Real Ke(unit="V/(rad/s)",min=0) = Psi "Voltage constant, the induced motor EMF is E=Ke*omega, omega = electrical_speed" annotation (Dialog(group="Servo motor"));

    parameter SI.Voltage Vmax(min=0)= 48 "Inverter max voltage" annotation (Dialog(group="Servo drive"));
    parameter SI.Torque Tmax(min=0) = 3.8 "Max torque" annotation (Dialog(group="Servo motor"));
    final parameter SI.Current Imax(min=0) = Tmax/np/Psi "Inverter max current" annotation (Dialog(group="Servo drive"));

    final parameter SI.Inductance Ls = 3/2*L "Synchronous inductance";
  end ServoMotorParameters;
  
end Types;
