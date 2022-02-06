function [sys,x0] = evapmods(t, x, u, flag)
%
%  Simulink interface to evapmods.m     
%
% Inputs:    t    - time in [sec].
%            x    - 3 states, The level of the liquid in the separator tank L2.
%                   Concentration of the liquid obtained as the product X2.
%                   The operating pressure P2 in the evaporator.  
%            u(1) - F1 , inlet feed flowrate
%             F2 = u(2);              % [kg/sec]
%             P100 = u(3);            % [kPa]
%             F200 = u(4);            % [kg/sec]
%              T1 = u(5);             % [°C]
%             XF1 = u(6);             % [%]
%             F3 = u(7);              % [kg/sec]
%            T200 = u(8); 
%
% Outputs:   sys and x0 as described in the SIMULINK manual.
%            when flag is 0 sys contains sizes and x0 contains 
%            initial condition. 
%            when flag is 1, sys contains the derivatives,
%            and when flag is 3 sys contains outputs; 
%            y(1)    - Concentration of the liquid obtained as the product X2.
%            y(2)    - The operating pressure P2 in the evaporator.
%            y(3)    - The level of the liquid in the separator tank L2.
% Initialize :  define initial conditions,  X0
%               define system in terms of number of states, inputs etc.
%             e.g. sys = [3, 0, 3, 3, 0, 0];
%            1st array :  number of continuous states
%            2nd array :  number of discrete states
%            3rd array :  number of outputs
%            4th array :  number of inputs
%            5th array :  flag for direct feedthrough
%            6th array :  the number of sample times
            


if abs(flag) == 1
  % Return state derivatives.
  sys = evapmod(t,x,u);
elseif abs(flag) == 3
  % Return system outputs.
  sys(1,1,1) = x(1);       %  X2
  sys(2,1,1) = x(2);       %  P2
  sys(3,1,1) = x(3);       %  L2
elseif flag == 0
  % Initialize the system
  load init_ss.mat
  x0=X0ss ;
  sys = [3, 0, 3, 8 , 0, 0]; 
else
  sys = [];  
end