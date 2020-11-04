A simple wrapper for FMI models in C++
======================================

This project is useful to load an FMI model (https://fmi-standard.org) in a C++ program.

It consists in a single class, ```FmiInterface``` with member functions to perform simulations with FMIs.

## Example use

```
FmiInterface fmi("YourFmi.Model", "/path/to/the/fmi", LogLevel::Normal);

auto inputIndex = fmi.variableIndex("input.variable");
auto outputIndex = fmi.variableIndex("output.variable");

fmi.startSimulation();

for(double time=0.0; time<stop; time+=step)
{
    fmi.setScalarDouble(outputIndex, output);
    double input = fmi.getScalarDouble(outputIndex);
    fmi.doStep(time, step);
}
```

## How to build the project

- Install OpenModelica (follow instructions from https://www.openmodelica.org) and pugixml (with ```apt install  libpugixml-dev``` or from https://pugixml.org)
- ```mkdir build && cd build```
- ```cmake .. && make```
- ```./fmitest```
