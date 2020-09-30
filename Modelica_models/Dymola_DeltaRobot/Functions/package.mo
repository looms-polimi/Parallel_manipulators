within DeltaRobot;
package Functions "Package with all the functions required to simulate a Delta robot"
  extends Modelica.Icons.Package;

  function servoMotorCurrents "Return stator current space phasors with respect to the rotor fixed frame d-q and other informations"
    extends Modelica.Icons.Function;

      //Imports
        import Modelica.Math.Vectors.Utilities.roots;

      //Inputs & outputs
        input SI.Resistance Rs "Stator resistance per phase";
        input SI.AngularVelocity omega "Electrical speed";
        input SI.Inductance Ls "Synchronous inductance";
        input Real Ke(unit="V/(rad/s)") "Voltage constant, the induced motor EMF is E=Ke*omega, omega = electrical_speed";
        input SI.Voltage Vmax "Inverter max voltage";
        input SI.Current Imax "Inverter max current";
        input SI.Current is_q0IN "Required current for the reference torque";

        output SI.Current is_d "Stator current space phasor with respect to the rotor fixed frame d-q";
        output SI.Current is_q "Stator current space phasor with respect to the rotor fixed frame d-q";

protected
        Real C_is_d[2,2] "Variable for complex solutions of is_d";
        Real C_is_q[2,2] "Variable for complex solutions of is_q";
        Real is_q0 = if abs(is_q0IN)>abs(Imax) then sign(is_q0IN)*abs(Imax) else is_q0IN "Required current for the reference torque with limitation [-Imax,Imax]";
        Real is_qMAX = abs(is_q0) "Maximum value for is_q";

        Real A,B,C,m,q;

  algorithm

    is_q := is_q0;
    is_d := 0;

    if (-omega*Ls*is_q0)^2+(Rs*is_q0+omega*Ke)^2 <= Vmax^2 then //IF omega<=omega_b (base velocity) //IF1
      is_q := is_q0;
      is_d := 0;

    else //IF omega>omega_b (base velocity) //IF1

       C_is_d := roots({(Rs^2+omega^2*Ls^2),(2*Ls*Ke*omega^2),(omega^2*Ls^2*is_q0^2+(Rs*is_q0+Ke*omega)^2-Vmax^2)}); //Compute solutions for is_d
       is_d := if abs(C_is_d[1,1])<abs(C_is_d[2,1]) then C_is_d[1,1] else C_is_d[2,1]; //Take the smaller solutions for is_d in module

       if  C_is_d[1,2]<>0 or C_is_d[2,2]<>0 then //IF there are not real solutions for is_d, reduce is_q until there are real solutions  //IF5

         C_is_q := roots({(2*Rs^2*Ls^2*omega^2+Rs^4+Ls^4*omega^4),(2*Rs^3*Ke*omega+2*Ls^2*Rs*Ke*omega^3),(-Vmax^2*Ls^2*omega^2+Rs^2*Ke^2*omega^2-Rs^2*Vmax^2)});

         if  C_is_q[1,2]==0 and C_is_q[2,2]==0 then //IF there are real solutions for is_q such that there are real solutions for is_d  //IF4

           is_q := if abs(is_q0-C_is_q[1,1])<abs(is_q0-C_is_q[2,1]) then C_is_q[1,1] else C_is_q[2,1]; //Take the closest solution to is_q0
           is_qMAX := abs(is_q); //Update the maximum value for is_q (now if is_q>is_qMAX there are not solutions)

           C_is_d := roots({(Rs^2+omega^2*Ls^2),(2*Ls*Ke*omega^2),(omega^2*Ls^2*is_q^2+(Rs*is_q+Ke*omega)^2-Vmax^2)}); //Compute again solutions for is_d
           is_d := if abs(C_is_d[1,1])<abs(C_is_d[2,1]) then C_is_d[1,1] else C_is_d[2,1]; //Take the smaller solutions for is_d in module
         else //IF4
           //IF THERE ARE NOT REAL SOLUTIONS -> ERROR
           is_q := 0;
           is_d := 0;
         end if; //IF4

       end if;  //IF5

       if is_d^2+is_q^2>Imax^2 then //IF the two values of is_q e is_d founded so far exceed the maximum current //IF2
         assert(Ls<>0 and Ke<>0,"Function 'compute_isq_isd' of ServoMotor: Ls and Ke must be different then zero.", level = AssertionLevel.error); //altrimenti B=0
         A := 2*Rs*Ke*omega;
         B := 2*Ls*Ke*omega^2;
         C := Rs^2*Imax^2+omega^2*Ls^2*Imax^2+Ke^2*omega^2-Vmax^2;
         m := -A/B;
         q := -C/B;

         if abs(C)/sqrt(A^2+B^2)<=Imax then //IF there are solutions  //IF3
           C_is_q := roots({(m^2+1), (2*m*q), (q^2-Imax^2)});
           is_q := if abs(is_q-C_is_q[1,1])<abs(is_q-C_is_q[2,1]) then C_is_q[1,1] else C_is_q[2,1]; //prendo la soluz. più vicina
           is_d := m*is_q+q;
         else //IF3
           //IF THERE ARE NOT REAL SOLUTIONS -> It is impossible to maintain Vs<=Vmax
           is_q := 0;
           is_d := 0;
         end if; //IF3

       end if; //IF2

    end if; //IF1
  annotation (__Dymola_LockedEditing="CopiatoDaSP");
  end servoMotorCurrents;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Text(
          lineColor={0,0,255},
          extent={{-150,105},{150,145}},
          textString="%name"),
        Ellipse(
          lineColor = {108,88,49},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent = {{-80,-80},{80,80}}),
        Text(
          lineColor={108,88,49},
          extent={{-90.0,-90.0},{90.0,90.0}},
          textString="f")}));
end Functions;
