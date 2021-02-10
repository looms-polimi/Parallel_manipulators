within DeltaRobot.ReferenceSignals;

model InverseKinematic "The outputs are the three actuators angles required to have the input position"
  extends DeltaRobot.Icons.InverseKinematic; // Icon

  // Imports
    import ModelicaServices.Machine.eps; //this constant is used to verify if there is a saturation
    import DeltaRobot.Types.*;

  // Parameters
    outer DeltaRobot.Components.GlobalParameters gp "Object with all global parameters";

    parameter DiscParameters base = gp.base "Parameters of the base";
    parameter DiscParameters platform = gp.platform "Parameters of the platform";    
    parameter ArmParameters armParameters = gp.armParameters[1] "Parameters of the arms";

    parameter Boolean limitOutputs = true "=true, if you want to limit the outputs within [minTheta,maxTheta]" annotation(Dialog(group="Limits"), choices(checkBox=true));
    parameter Boolean stopWhenSaturated = true "When a saturation is detected all output signals maintain their current values until all output signals return within the limits" annotation(Dialog(group="Limits", enable = limitOutputs));
    parameter SI.Angle maxTheta[3] = {gp.armParameters[1].maxTheta, gp.armParameters[2].maxTheta, gp.armParameters[3].maxTheta} "Max actuator angle" annotation(Dialog(group="Limits"));
    parameter SI.Angle minTheta[3] = {gp.armParameters[1].minTheta, gp.armParameters[2].minTheta, gp.armParameters[3].minTheta} "Min actuator angle" annotation(Dialog(group="Limits"));

    parameter SI.Time T_velocity(min=Modelica.Constants.small) = 0.01 "Time constants for velocity derivative (T>0 required; T=0 is ideal derivative block)" annotation(Dialog(group="Derivatives"));
    parameter SI.Time T_acc(min=Modelica.Constants.small) = 0.1 "Time constants for acceleration derivative (T>0 required; T=0 is ideal derivative block)" annotation(Dialog(group="Derivatives"));

  // Variables
    SI.Angle thetaRef[3] "Output before saturation, result of inverse kinematic";
    SI.Angle thetaSat[3] "Output after saturation";
    Boolean saturationFlag "=true, when there is a saturation";
    SI.Angle outputSample[3] "When a saturation is detected this variable saves the last valid output";
    SI.AngularVelocity thetaVelocity[3] "Angles velocities, =der(theta)";
    SI.AngularAcceleration thetaAcceleration[3] "Legs accelerations, =der(thetaVelocity)";

  Modelica.Blocks.Interfaces.RealOutput theta[3] "Actuators angles for the input position" annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter[3](uMax={maxTheta[1],maxTheta[2],maxTheta[3]}, uMin={minTheta[1],minTheta[2],minTheta[3]}) annotation (Placement(transformation(extent={{-12,28},{8,48}})));

  Modelica.Blocks.Continuous.Derivative posDerivative[3](each T=T_velocity, each initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Continuous.Derivative velDerivative[3](each T=T_acc, each initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-12,-44},{8,-24}})));

  Interfaces.Pose pose annotation (Placement(transformation(extent={{-130,-30},{-70,30}})));
  Modelica.Blocks.Routing.RealPassThrough realPassThrough[3] annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));

initial equation
  outputSample = thetaRef;

equation
  assert(maxTheta[1]>=minTheta[1] and maxTheta[2]>=minTheta[2] and maxTheta[3]>=minTheta[3],"InverseKinematic: Limits must be consistent. However minTheta>maxTheta.");

  thetaRef = DeltaRobot.Functions.inverseKinematic(realPassThrough.y,armParameters.L,armParameters.l,base.D,platform.D,base.beta); //nresolve inverse kinematic

  limiter.u=thetaRef; //napply saturation
  thetaSat=limiter.y;

  if thetaRef[1]-eps>thetaSat[1] or thetaRef[2]-eps>thetaSat[2] or thetaRef[3]-eps>thetaSat[3] or
     thetaRef[1]+eps<thetaSat[1] or thetaRef[2]+eps<thetaSat[2] or thetaRef[3]+eps<thetaSat[3] 
  then                                                                                                        
    saturationFlag=true; // check if there was a saturation
  else
    saturationFlag=false;
  end if;

  when saturationFlag then // immidiatly after a saturation save the last output
    outputSample=thetaSat;
  end when;

  if limitOutputs == true then

    if stopWhenSaturated and saturationFlag then // Select the output based on the parameters and possible saturations
        theta=outputSample;
    else
        theta=thetaSat;
    end if;

  else
    theta=thetaRef;
  end if;

  posDerivative.u=theta; // compute the output derivatives with appropriate blocks
  thetaVelocity=posDerivative.y;

  velDerivative.u=thetaVelocity;
  thetaAcceleration=velDerivative.y;

  connect(realPassThrough.u, pose.position) annotation (Line(points={{-70,0},{-84,0},{-84,0.15},{-99.85,0.15}}, color={0,0,127}));
  
end InverseKinematic;
