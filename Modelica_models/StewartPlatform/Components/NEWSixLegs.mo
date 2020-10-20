within StewartPlatform.Components;

model NEWSixLegs "Set of six legs of a Stewart Platform appropiately connected, composed of electric cylinders and servo motors"
    extends StewartPlatform.Icons.SixLegs; // Icon

// Imports
    import StewartPlatform.Functions.*;
    import StewartPlatform.Types.*;

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp;

    parameter StewartPlatform.Types.DiscParameters base = gp.base "Base parameters";
    parameter StewartPlatform.Types.DiscParameters platform = gp.platform "Platform parameters";

    // Universal joints
    parameter StewartPlatform.Types.UniversalJointParameters universalJointParameters[6] = 
      fill(
        UniversalJointParameters(
          alpha = gp.alpha[0], //! da sistemare, funzoina solo se tutti gli elementi dell'array 'gp.alpha' sono uguali a 'gp.alpha[0]'
          stateSelect = StateSelect.prefer, 
          initialAnglesFixed = false, 
          initialAngularVelFixed = false, 
          initialAngularAccFixed = false)
          ,6)
      "Parameters of the universal joints" annotation (Dialog(group="Universal joints"));

    // Electric Cylinders
    parameter StewartPlatform.Types.ElectricCylinderParameters electricCylinderParameters[6] = 
      fill(
        ElectricCylinderParameters(
          stateSelect = StateSelect.prefer, 
          initialLengthFixed = false, 
          initialVelFixed = false, 
          initialAccFixed = false)
          ,6)
      "Parameters of the electric cylinders" annotation (Dialog(group="Electric cylinders"));
     

    // Servo Motors
    parameter StewartPlatform.Types.ServoMotorParameters servoMotorParameters[6]
    
    
    
    
    
    
     "Parameters of the servo motors" annotation (Dialog(group="Servo motors"));

    // Spherical joints
    parameter StewartPlatform.Types.SphericalJointParameters sphericalJointParameters[6] "Parameters of the spherical joints" annotation (Dialog(group="Spherical joints"));

end NEWSixLegs;
