within DeltaRobot.Interfaces;

expandable connector Pose "Position of a rigid object"
    extends DeltaRobot.Icons.Pose; // Icon

    SI.Position position[3] "Position";

    SI.Time startTime "Start of the time interval where the pose is valid";
    SI.Time stopTime "End of the time interval where the pose is valid";

end Pose;
