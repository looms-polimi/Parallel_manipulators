package DeltaRobot "Library for modelling of Delta Robots"
    extends DeltaRobot.Icons.DeltaRobot;

// Imports
    import Modelica.Constants.pi;

    import SI = Modelica.Units.SI;
    import NonSI = Modelica.Units.NonSI;
    import Cv = Modelica.Units.Conversions;    
    import Modelica.Units.Conversions.from_deg;
    import Modelica.Units.Conversions.to_deg;
annotation(version = "1.0.0",
           uses(Modelica(version = "4.0.0")));
end DeltaRobot;
