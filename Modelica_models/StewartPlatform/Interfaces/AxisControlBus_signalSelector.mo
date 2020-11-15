within StewartPlatform.Interfaces;

model AxisControlBus_signalSelector "Connects or cuts the signals along the axis control bus"
  extends StewartPlatform.Icons.AxisControlBus_signalSelector; // Icon

// Parameters
  parameter Boolean connect_angularPos = true annotation (choices(checkBox=true));
  parameter Boolean connect_angularVel = true annotation (choices(checkBox=true));
  parameter Boolean connect_angularAcc = true annotation (choices(checkBox=true));
  parameter Boolean connect_refTorque = true annotation (choices(checkBox=true));
  parameter Boolean connect_appliedTorque = true annotation (choices(checkBox=true));

// Models
  StewartPlatform.Interfaces.AxisControlBus axisControlBus_in annotation(Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  StewartPlatform.Interfaces.AxisControlBus axisControlBus_out annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

equation
  if connect_angularPos then 
    axisControlBus_in.angularPos = axisControlBus_out.angularPos;
  end if;

  if connect_angularVel then 
    axisControlBus_in.angularVel = axisControlBus_out.angularVel;
  end if;

  if connect_angularAcc then 
    axisControlBus_in.angularAcc = axisControlBus_out.angularAcc;
  end if;

  if connect_refTorque then 
    axisControlBus_in.refTorque = axisControlBus_out.refTorque;
  end if;

  if connect_appliedTorque then 
    axisControlBus_in.appliedTorque = axisControlBus_out.appliedTorque;
  end if;

end AxisControlBus_signalSelector;
