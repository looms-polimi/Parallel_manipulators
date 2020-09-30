within DeltaRobot.Types;

record DiscParameters "Parameters of a cylindrical disc"
    extends DeltaRobot.Icons.Record; // Icon

    parameter SI.Diameter D(start=1.0) "Diameter of the circumference where the joints are located";
    parameter SI.Diameter De = D*1.1 "Disc diameter";
    parameter SI.Thickness thickness= D*0.1 "Disc thickness";
    parameter SI.Mass mass = 1 "Disc mass";
    parameter SI.Angle beta = from_deg(-90) "Angle from the x-axis of the disc frame to the direction where the joint #1 is located";
    final parameter SI.Angle alpha(min=from_deg(120), max=from_deg(120)) = from_deg(120) "Angle between two joints"; //Don't change this is not a parameter, no other configurations are allowed for a Delta Robot
    final parameter SI.Area area(min=0) = De^2*pi/4 "Disc base area";
    final parameter SI.Volume volume(min=0) = area*thickness "Disc volume";
    final parameter SI.Density density = mass/volume "Disc density";
end DiscParameters;
