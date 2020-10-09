within StewartPlatform.ReferenceSignals;

model Switch2 "Switch between two or more Pose signals, the definition of the swith times is not required"
  extends StewartPlatform.Icons.Switch2; // Icon

  //Parameters
  parameter Integer n(min=2) = 2 "Number of different input signals";

  //Variables
  Integer count "Number of the current signal";

public
  Interfaces.Pose poseInput[n] annotation (Placement(transformation(extent={{-120,-30},{-60,30}}), iconTransformation(extent={{-120,-30},{-60,30}})));
  Interfaces.Pose poseOutput annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

  Interfaces.PoseDeMux deMux[n] annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  Interfaces.PoseMux mux annotation (Placement(transformation(extent={{40,-10},{60,10}})));

initial equation
  count=1;
equation
  assert(n>=2,"Switch: Must be n>=2, there must be more then one signal connected.");

  when pre(count)<=n-1 and time>=poseInput[pre(count)].stopTime then
    count = pre(count) + 1;
  end when;

  deMux[count].positionOut=mux.positionIn;
  deMux[count].orientationOut=mux.orientationIn;

  connect(deMux.pose, poseInput) annotation (Line(points={{-55,0},{-90,0}}, color={0,0,0}));
  connect(poseOutput, mux.pose) annotation (Line(points={{90,0},{59,0}}, color={0,0,0}));
end Switch2;