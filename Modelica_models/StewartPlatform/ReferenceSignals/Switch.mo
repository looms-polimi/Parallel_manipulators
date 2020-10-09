within StewartPlatform.ReferenceSignals;

model Switch "Switch between two or more Pose signals"
    extends StewartPlatform.Icons.Switch; // Icon

  //Imports
    import StewartPlatform.Types.SwitchTimeDef;

  //Parameters
    parameter Integer n(min=2) = 2 "Number of different input signals";
    parameter SwitchTimeDef timeDef = SwitchTimeDef.periods "Select how to define the switch time instants";
    parameter SI.Time startTime = 0 "The output is the first signal for time<startTime+period[1])";
    parameter SI.Time period[n-1](each min=0) = {0 for i in 1:n-1} "Duration of each signal (set n-1 periods)";
    parameter SI.Time switchTime[n-1](each min=0) = {0 for i in 1:n-1}  "Time instants when to switch signal (set n-1 times)";

  //Variables
    Integer count "Number of the current signal";

protected
    parameter SI.Time timeInstants[n-1] = fill_timeInstants(n,timeDef,startTime,period,switchTime);

    function fill_timeInstants "Function to fill the elements of 'timeInstants' array"
      input Integer n;
      input SwitchTimeDef timeDef;
      input SI.Time startTime;
      input SI.Time period[n-1];
      input SI.Time switchTime[n-1];
      output SI.Time out[n-1];

    algorithm
        if timeDef == SwitchTimeDef.periods then
          out[1]:=startTime+period[1];
          for i in 2:n-1 loop
            out[i] := out[i-1] +period[i];
          end for;
        else
          out :=  switchTime;
        end if;
    end fill_timeInstants;

public
  Interfaces.Pose poseInput[n] annotation (Placement(transformation(extent={{-120,-30},{-60,30}}), iconTransformation(extent={{-120,-30},{-60,30}})));
  Interfaces.Pose poseOutput annotation (Placement(transformation(extent={{60,-30},{120,30}}), iconTransformation(extent={{60,-30},{120,30}})));

  Interfaces.PoseDeMux deMux[n] annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  Interfaces.PoseMux mux annotation (Placement(transformation(extent={{40,-10},{60,10}})));

initial equation
  count=1;
equation
  assert(n>=2,"Switch: Must be n>=2, there must be more then one signal connected.");

  when pre(count)<=n-1 and time>=timeInstants[pre(count)] then
    count = pre(count) + 1;
  end when;

  deMux[count].positionOut=mux.positionIn;
  deMux[count].orientationOut=mux.orientationIn;

  connect(deMux.pose, poseInput) annotation (Line(points={{-55,0},{-90,0}}, color={0,0,0}));
  connect(poseOutput, mux.pose) annotation (Line(points={{90,0},{59,0}}, color={0,0,0}));
  
end Switch;
