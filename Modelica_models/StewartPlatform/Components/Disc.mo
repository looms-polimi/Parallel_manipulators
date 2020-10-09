within StewartPlatform.Components;

model Disc "Cylindrical disc used to model the base and the platform"
    extends StewartPlatform.Icons.Disc; // Icon
    
// Imports
    import StewartPlatform.Types.Units.Direction;

// Parameters
    parameter StewartPlatform.Types.DiscParameters discParameters(D=1, alpha=0.5235987755983) "Parameters of the disc";
    parameter Direction direction = Direction.down "Cylinder direction from x-y plane along z-axis";

    protected
        parameter SI.Position J[6,3] = StewartPlatform.Functions.jointsCoordinates(discParameters) "Coordinates of the joints resolved in disc frame";

// Models
    public
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation1(r={J[1, 1],J[1, 2],J[1, 3]}, animation=false)
            annotation (Placement(transformation(extent={{20,10},{40,30}})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation2(r={J[2, 1],J[2, 2],J[2, 3]}, animation=false)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,50})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation3(r={J[3, 1],J[3, 2],J[3, 3]}, animation=false)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-40,50})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation4(r={J[4, 1],J[4, 2],J[4, 3]}, animation=false)
            annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-40,-50})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation5(r={J[5, 1],J[5, 2],J[5, 3]}, animation=false)
            annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={0,-50})));
        Modelica.Mechanics.MultiBody.Parts.FixedRotation fixedRotation6(r={J[6, 1],J[6, 2],J[6, 3]}, animation=false)
            annotation (Placement(transformation(extent={{20,-30},{40,-10}})));

        Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Frame in the center of the disc" 
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,-100}), iconTransformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,-74})));
        Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b[6] "Frames where the joints are located" 
            annotation (Placement(transformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,100}), iconTransformation(extent={{-16,-16},{16,16}},rotation=90,origin={0,74})));
        
        Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder(
            r=if direction == Direction.up then {0,0,discParameters.thickness} else {0,0,-discParameters.thickness},
            lengthDirection=if direction == Direction.up then {0,0,1} else {0,0,-1},
            length=discParameters.thickness,
            diameter=discParameters.De,
            density=discParameters.density)
        annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));

    equation
        assert(discParameters.D<=discParameters.De,
        "Disc: the disc external diameter 'De' should be bigger or equal to the 'D' diameter of the circumference where the joints are located.",
        level = AssertionLevel.warning);

        assert(0<discParameters.De,
        "Disc: the disc external diameter 'De' MUST be bigger then zero.");

        assert(0<discParameters.D,
        "Disc: the diameter 'D' of the circumference where the joints are located MUST be bigger then zero.");

        assert(0<discParameters.thickness,
        "Disc: the thickness of the disc MUST be bigger then zero.");

        assert(0<=discParameters.mass,
        "Disc: the mass of the disc MUST be bigger or equal to zero.");

        assert(0<=discParameters.alpha,
        "Disc: the angle 'alpha' between two joints MUST be bigger or equal to zero.");
        
    connect(fixedRotation1.frame_a, bodyCylinder.frame_a) annotation(Line(points = {{20, 20}, {20, 20}, {20, 0}, {-20, 0}, {-20, 0}}));
    connect(fixedRotation2.frame_a, bodyCylinder.frame_a) annotation(Line(points = {{0, 40}, {0, 40}, {0, 0}, {-20, 0}, {-20, 0}}));
    connect(fixedRotation3.frame_a, bodyCylinder.frame_a) annotation(Line(points = {{-40, 40}, {-20, 40}, {-20, 0}, {-20, 0}}));
    connect(fixedRotation4.frame_a, bodyCylinder.frame_a) annotation(Line(points = {{-40, -40}, {-20, -40}, {-20, 0}, {-20, 0}}));
    connect(fixedRotation5.frame_a, bodyCylinder.frame_a) annotation(Line(points = {{0, -40}, {0, -40}, {0, 0}, {-20, 0}, {-20, 0}}));
    connect(fixedRotation6.frame_a, bodyCylinder.frame_a) annotation(Line(points = {{20, -20}, {20, -20}, {20, 0}, {-20, 0}, {-20, 0}}));
    
    connect(fixedRotation1.frame_b, frame_b[1]) annotation(Line(points = {{40, 20}, {40, 20}, {40, 100}, {0, 100}, {0, 100}}));
    connect(fixedRotation2.frame_b, frame_b[2]) annotation(Line(points = {{0, 60}, {0, 60}, {0, 100}, {0, 100}}));
    connect(fixedRotation3.frame_b, frame_b[3]) annotation(Line(points = {{-40, 60}, {-40, 60}, {-40, 100}, {0, 100}, {0, 100}}));
    connect(fixedRotation4.frame_b, frame_b[4]) annotation(Line(points = {{-40, -60}, {-60, -60}, {-60, 100}, {0, 100}, {0, 100}}));
    connect(fixedRotation5.frame_b, frame_b[5]) annotation(Line(points = {{0, -60}, {80, -60}, {80, 100}, {0, 100}, {0, 100}}));
    connect(fixedRotation6.frame_b, frame_b[6]) annotation(Line(points = {{40, -20}, {60, -20}, {60, 100}, {0, 100}, {0, 100}}));
    
    connect(frame_a, bodyCylinder.frame_a) annotation(Line(points = {{0, -100}, {-20, -100}, {-20, 0}, {-20, 0}}));
end Disc;
