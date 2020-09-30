within DeltaRobot.Tests;

model DefaultValuesOfRecords_test
  DeltaRobot.Types.ServoMotorParameters servoMotorParameters  annotation(
    Placement(visible = true, transformation(origin = {-30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Types.DiscParameters discParameters annotation(
    Placement(visible = true, transformation(origin = {30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Types.ReducerParameters reducerParameters annotation(
    Placement(visible = true, transformation(origin = {-30, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DeltaRobot.Types.ArmParameters armParameters annotation(
    Placement(visible = true, transformation(origin = {30, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation

end DefaultValuesOfRecords_test;
