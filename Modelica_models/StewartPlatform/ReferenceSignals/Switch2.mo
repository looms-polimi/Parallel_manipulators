within StewartPlatform.ReferenceSignals;

model Switch2 "Switch between two or more Pose signals, the definition of the swith times is not required"
  extends StewartPlatform.Icons.Switch2; // Icon

  // Parameters
  final parameter Integer max_n = 15 "Max number of input connectors";
  parameter Integer n(min=2,max=15) = 2 "Number of different input connectors";
protected
  final parameter Integer index[max_n] = {if i<=n then i else n for i in 1:max_n};
public

  // Variables
  Integer count "Number of the current signal";

  // Models
  Interfaces.Pose poseInput[n] annotation (Placement(transformation(extent={{-120,-30},{-60,30}}), iconTransformation(extent={{-120,-30},{-60,30}})));
  Interfaces.Pose poseOutput annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

  Interfaces.PoseDeMux deMux[n] annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  Interfaces.PoseMux mux annotation (Placement(transformation(extent={{40,-10},{60,10}})));

initial equation
  count=1;

equation
  assert(n>=2,"Switch: Must be n>=2, there must be more then one signal connected.");
  assert(n<=max_n,"Switch: Must be n<=max_n, edit the code of this model if you need more input connectors.");

  when pre(count)<=n-1 and time>=poseInput[pre(count)].stopTime then
    count = pre(count) + 1;
  end when;

  if count == 1 then
    mux.positionIn =    deMux[index[1]].positionOut;
    mux.sequenceIn =    deMux[index[1]].sequenceOut;
    mux.orientationIn = deMux[index[1]].orientationOut;
  elseif count == 2 then
    mux.positionIn =    deMux[index[2]].positionOut;
    mux.sequenceIn =    deMux[index[2]].sequenceOut;
    mux.orientationIn = deMux[index[2]].orientationOut;
  elseif count == 3 then
    mux.positionIn =    deMux[index[3]].positionOut;
    mux.sequenceIn =    deMux[index[3]].sequenceOut;
    mux.orientationIn = deMux[index[3]].orientationOut;
  elseif count == 4 then
    mux.positionIn =    deMux[index[4]].positionOut;
    mux.sequenceIn =    deMux[index[4]].sequenceOut;
    mux.orientationIn = deMux[index[4]].orientationOut;
  elseif count == 5 then
    mux.positionIn =    deMux[index[5]].positionOut;
    mux.sequenceIn =    deMux[index[5]].sequenceOut;
    mux.orientationIn = deMux[index[5]].orientationOut;
  elseif count == 6 then
    mux.positionIn =    deMux[index[6]].positionOut;
    mux.sequenceIn =    deMux[index[6]].sequenceOut;
    mux.orientationIn = deMux[index[6]].orientationOut;
  elseif count == 7 then
    mux.positionIn =    deMux[index[7]].positionOut;
    mux.sequenceIn =    deMux[index[7]].sequenceOut;
    mux.orientationIn = deMux[index[7]].orientationOut;
  elseif count == 8 then
    mux.positionIn =    deMux[index[8]].positionOut;
    mux.sequenceIn =    deMux[index[8]].sequenceOut;
    mux.orientationIn = deMux[index[8]].orientationOut;
  elseif count == 9 then
    mux.positionIn =    deMux[index[9]].positionOut;
    mux.sequenceIn =    deMux[index[9]].sequenceOut;
    mux.orientationIn = deMux[index[9]].orientationOut;
  elseif count == 10 then
    mux.positionIn =    deMux[index[10]].positionOut;
    mux.sequenceIn =    deMux[index[10]].sequenceOut;
    mux.orientationIn = deMux[index[10]].orientationOut;
  elseif count == 11 then
    mux.positionIn =    deMux[index[11]].positionOut;
    mux.sequenceIn =    deMux[index[11]].sequenceOut;
    mux.orientationIn = deMux[index[11]].orientationOut;
  elseif count == 12 then
    mux.positionIn =    deMux[index[12]].positionOut;
    mux.sequenceIn =    deMux[index[12]].sequenceOut;
    mux.orientationIn = deMux[index[12]].orientationOut;
  elseif count == 13 then
    mux.positionIn =    deMux[index[13]].positionOut;
    mux.sequenceIn =    deMux[index[13]].sequenceOut;
    mux.orientationIn = deMux[index[13]].orientationOut;
  elseif count == 14 then
    mux.positionIn =    deMux[index[14]].positionOut;
    mux.sequenceIn =    deMux[index[14]].sequenceOut;
    mux.orientationIn = deMux[index[14]].orientationOut;
  elseif count == 15 then
    mux.positionIn =    deMux[index[15]].positionOut;
    mux.sequenceIn =    deMux[index[15]].sequenceOut;
    mux.orientationIn = deMux[index[15]].orientationOut;  
  else
    mux.positionIn = {0,0,0};
    mux.sequenceIn = {1,2,3};
    mux.orientationIn = {0,0,0};
  end if;
  
  mux.startTimeIn = deMux[1].startTimeOut;
  mux.stopTimeIn = deMux[n].stopTimeOut;

  connect(poseInput, deMux.poseIn) annotation (Line(points={{-55,0},{-90,0}}, color={0,0,0}));
  connect(mux.poseOut, poseOutput) annotation (Line(points={{90,0},{59,0}}, color={0,0,0}));
end Switch2;
