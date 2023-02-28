within StewartPlatform.Types;

record DiscParameters "Parameters of a cylindrical disc"
    extends StewartPlatform.Icons.Record; // Icon

    parameter SI.Diameter D(start=1.0) "Diameter of the circumference where the joints are located";
    parameter SI.Diameter De = D*1.1 "Disc diameter";
    parameter SI.Thickness thickness= D*0.1 "Disc thickness";
    parameter SI.Mass mass = 1 "Disc mass";
    parameter SI.Angle alpha(min=0) "Angle between two joints";
    final parameter SI.Area area(min=0) = De^2*pi/4 "Disc base area";
    final parameter SI.Volume volume(min=0) = area*thickness "Disc volume";
    final parameter SI.Density density = mass/volume "Disc density";
    
end DiscParameters;
