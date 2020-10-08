within StewartPlatform.Interfaces;

expandable connector Pose "Position and orientation of a rigid object in space"
    //extends StewartPlatform.Icons.Pose; // Icon

    SI.Position position[3] "Position";
    Modelica.Mechanics.MultiBody.Types.RotationSequence sequence(min={1,1,1},max={3,3,3}) "Sequence of rotation axes";
    SI.Angle orientation[3] "Rotation angles around axes defined in 'sequence'";

    SI.Time startTime "Start of the time interval where the pose is valid";
    SI.Time stopTime "End of the time interval where the pose is valid";

end Pose;
