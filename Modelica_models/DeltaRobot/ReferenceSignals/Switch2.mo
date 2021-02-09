within DeltaRobot.ReferenceSignals;

model Switch2 "Switch between two or more Pose signals, the definition of the swith times is not required"
    extends DeltaRobot.Icons.Switch2; // Icon

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
    
    Interfaces.PoseDeMux deMux[n] annotation(Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Interfaces.PoseMux mux annotation(Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

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
    elseif count == 2 then
      mux.positionIn =    deMux[index[2]].positionOut;
    elseif count == 3 then
      mux.positionIn =    deMux[index[3]].positionOut;
    elseif count == 4 then
      mux.positionIn =    deMux[index[4]].positionOut;
    elseif count == 5 then
      mux.positionIn =    deMux[index[5]].positionOut;
    elseif count == 6 then
      mux.positionIn =    deMux[index[6]].positionOut;
    elseif count == 7 then
      mux.positionIn =    deMux[index[7]].positionOut;
    elseif count == 8 then
      mux.positionIn =    deMux[index[8]].positionOut;
    elseif count == 9 then
      mux.positionIn =    deMux[index[9]].positionOut;
    elseif count == 10 then
      mux.positionIn =    deMux[index[10]].positionOut;
    elseif count == 11 then
      mux.positionIn =    deMux[index[11]].positionOut;
    elseif count == 12 then
      mux.positionIn =    deMux[index[12]].positionOut;
    elseif count == 13 then
      mux.positionIn =    deMux[index[13]].positionOut;
    elseif count == 14 then
      mux.positionIn =    deMux[index[14]].positionOut;
    elseif count == 15 then
      mux.positionIn =    deMux[index[15]].positionOut; 
    else
      mux.positionIn = {0,0,0};
    end if;
    
    mux.startTimeIn = deMux[1].startTimeOut;
    mux.stopTimeIn = deMux[n].stopTimeOut;
    
    connect(poseInput, deMux.poseIn) annotation(Line(points = {{-90, 0}, {-40, 0}, {-40, 0}, {-40, 0}}, thickness = 0.5));
    connect(mux.poseOut, poseOutput) annotation(Line(points = {{40, 0}, {74, 0}, {74, 0}, {90, 0}}, thickness = 0.5));
  end Switch2;
