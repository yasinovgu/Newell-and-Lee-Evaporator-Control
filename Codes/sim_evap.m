
close all
clear all
clc

global F2 P100 F200 F1 XF1 T1 F3 T200
% Inputs
F2 = 2;           % [kg/min]
P100 = 194.7;     % [kPa]
F200 = 208;       % [kg/min]
F1 = 10;          % [kg/min];
T1 = 40;          % [°C]
XF1 = 5;          % [%] here, XF1 = X1
                  %steady state of L2 will not be found in Fig 2 if XF1=10 
F3 = 50;          % [kg/min]
T200 = 25;        % [°C]

%Initial dynamics of the solution
X0 = [3 3 8.8];         % Arbitrary Initial Condition
tspan=[ 0  70];      % Simulation Time

[t,x]=ode45(@evapmod,tspan, X0);   % calling the integrator (ODE solver) 

figure(1),
plot(t,x), grid on
legend('X_2','P_2','L_2')
xlabel('Time (min)')
ylabel('State Variables')
title('Initial dynamics of the solution ')

%Steady state solution at the final time

X0 = [ 3 3 8.8];         % Arbitrary Initial Condition
tspan=[ 0  1000];        % Simulation Time

% tolerance settings  (= higher accuracy) for the Matlab solver to increase 
% the accuracy of the numerical solution.
options = odeset('RelTol',1e-6,'AbsTol',[1.0e-6 1.e-06 1.e-06]); 

[t,x]=ode45(@evapmod,tspan, X0, options);

X0ss= x(end,:) ;
X0ss(3) = 1;
save init_ss X0ss;  %final steady state solution for all three is saved in X0ss

figure(2),
plot(t,x), grid on
xlabel('Time(min)')
ylabel('State variable')
legend('X_2','P_2','L_2')
title('Steady state solution at the final time')

