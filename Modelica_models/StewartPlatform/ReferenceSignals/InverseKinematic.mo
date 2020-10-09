within StewartPlatform.ReferenceSignals;

model InverseKinematic "The outputs are the six leg lengths required to have the input pose"
  extends StewartPlatform.Icons.InverseKinematic;

// Imports
    import ModelicaServices.Machine.eps; //this constant is used to verify if there is a saturation

// Parameters
    outer StewartPlatform.Components.GlobalParameters gp "Object with all global parameters";

    parameter StewartPlatform.Types.DiscParameters platform = gp.platform "Platform parameters";
    parameter StewartPlatform.Types.DiscParameters base = gp.base "Base parameters";

    parameter Boolean limitOutputs = true "=true, if you want to limit the outputs within [minLength,maxLength]" annotation(Dialog(group="Limits"), choices(checkBox=true));
    parameter Boolean stopWhenSaturated = true "When a saturation is detected all output signals maintain their current values until all output signals return within the limits" annotation(Dialog(group="Limits"));
    parameter SI.Length maxLength = gp.maxLength "Max leg length" annotation(Dialog(group="Limits"));
    parameter SI.Length minLength = gp.minLength "Min leg length" annotation(Dialog(group="Limits"));

    parameter SI.Time T_velocity(min=Modelica.Constants.small) = 0.01 "Time constants for velocity derivative (T>0 required; T=0 is ideal derivative block)" annotation(Dialog(group="Derivatives (no effects on the simulation)"));
    parameter SI.Time T_acc(min=Modelica.Constants.small) = 0.1 "Time constants for acceleration derivative (T>0 required; T=0 is ideal derivative block)" annotation(Dialog(group="Derivatives (no effects on the simulation)"));

// Variables
    Boolean saturationFlag "=true, when there is a saturation";
    SI.Velocity legVelocity[6] "Leg velocities, =der(legLength)";
    SI.Acceleration legAcceleration[6] "Leg accelerations, =der(legVelocity)";

protected
    SI.Length lengthRef[6] "Output before saturation, the result of inverse kinematic";
    SI.Length lengthSat[6] "Output after saturation";
    SI.Length outputSample[6] "When a saturation is detected this variables save the last valid outputs";

// Models
public
  Interfaces.Pose pose "Input pose" annotation (Placement(transformation(extent={{-120,-30},{-60,30}}), iconTransformation(extent={{-120,-30},{-60,30}})));
  Modelica.Blocks.Interfaces.RealOutput legLength[6] "Leg lengths for the input pose"annotation (Placement(transformation(extent={{96,-10},{116,10}})));

protected
  Modelica.Blocks.Nonlinear.Limiter limiter[6](each uMax=maxLength, each uMin=minLength) annotation (Placement(transformation(extent={{-12,28},{8,48}})));

  Modelica.Blocks.Continuous.Derivative posDerivative[6](each T=T_velocity, each initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Continuous.Derivative velDerivative[6](each T=T_acc, each initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-12,-44},{8,-24}})));

  Interfaces.PoseDeMux deMux annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));


initial equation
  outputSample = lengthSat; //Initialize the valid outputs with the input signals after saturation.
                            //If 'stopWhenSaturated' is true and, at the beginning of the simulation, there are saturaions then there may be discontinuities in the outputs of this model

equation
  assert(maxLength>=minLength,"InverseKinematic: Limits must be consistent. However minLength>maxLength.");

  lengthRef = StewartPlatform.Functions.legsLength(base,platform,deMux.positionOut,deMux.sequenceOut,deMux.orientationOut); //resolve inverse kinematic

  limiter.u=lengthRef; //apply saturation
  lengthSat=limiter.y;

  if lengthRef[1]-eps>lengthSat[1] or lengthRef[2]-eps>lengthSat[2] or lengthRef[3]-eps>lengthSat[3] or
     lengthRef[4]-eps>lengthSat[4] or lengthRef[5]-eps>lengthSat[5] or lengthRef[6]-eps>lengthSat[6] or
     lengthRef[1]+eps<lengthSat[1] or lengthRef[2]+eps<lengthSat[2] or lengthRef[3]+eps<lengthSat[3] or
     lengthRef[4]+eps<lengthSat[4] or lengthRef[5]+eps<lengthSat[5] or lengthRef[6]+eps<lengthSat[6] then
                                                                                                        //check if there was a saturation
       saturationFlag=true;
   else
     saturationFlag=false;
  end if;

  when saturationFlag then //immidiatly after a saturation save the last output
           outputSample=lengthSat;
  end when;

  if limitOutputs then

    if stopWhenSaturated and saturationFlag then //Select the output based on the parameters and possible saturations
        legLength=outputSample;
    else
        legLength=lengthSat;
    end if;

  else
    legLength=lengthRef;
  end if;

  posDerivative.u=legLength; //compute the output derivatives with appropriate blocks
  legVelocity=posDerivative.y;

  velDerivative.u=legVelocity;
  legAcceleration=velDerivative.y;

  connect(deMux.poseIn, pose) annotation (Line(points={{-63,0},{-90,0}}, color={0,0,0}));
end InverseKinematic;
