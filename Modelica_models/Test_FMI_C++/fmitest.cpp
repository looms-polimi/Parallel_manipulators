/***************************************************************************
 *   Copyright (C) 2018,2019,2020 by Terraneo Federico                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   As a special exception, if other files instantiate templates or use   *
 *   macros or inline functions from this file, or you compile this file   *
 *   and link it with other works to produce a work based on this file,    *
 *   this file does not by itself cause the resulting work to be covered   *
 *   by the GNU General Public License. However the source code for this   *
 *   file must still be made available in accordance with the GNU General  *
 *   Public License. This exception does not invalidate any other reasons  *
 *   why a work based on this file might be covered by the GNU General     *
 *   Public License.                                                       *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, see <http://www.gnu.org/licenses/>   *
 ***************************************************************************/

#include <iostream>
#include "fmi_interface.h"

using namespace std;

int main()
{
    // Load the model
    FmiInterface fmi("FmiTest.Model","../FmiTest.Model",LogLevel::Normal);
    fmi.printVariables();

    // Get indices of variables so as not to handle strings at each simulation step
    auto vIndex=fmi.variableIndex("v");
    auto iIndex=fmi.variableIndex("i");

    // Start simulation
    fmi.startSimulation();

    // Do simulations
    const double step=0.01; //[s]
    const double stop=1.0; //[s]
    cout<<"v i\n";
    for(double time=0.0;time<stop;time+=step)
    {
        // Apply a 1V step at t=0.1s
        double v=time<0.1 ? 0.0 : 1.0;

        fmi.setScalarDouble(vIndex,v);
        double i=fmi.getScalarDouble(iIndex);
        cout<<v<<" "<<i<<"\n";

        fmi.doStep(time,step);
    }
}
