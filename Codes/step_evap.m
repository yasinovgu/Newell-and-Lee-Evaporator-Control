
clear all
clc

global F2 P100 F200 F1 XF1 T1 F3 T200
% Inputs
F2 = 2;               % [kg/min]
P100 = 194.7;         % [kPa]
F200 = 208;           % [kg/min]
F1 = 10;              % [kg/min];
T1 = 40;              % [°C]
XF1 = 5;              % [%]
F3 = 50;              % [kg/min]
T200 = 25;            % [°C]

load init_ss   % Initial 'X0ss' will be loaded  with init_ss.mat

% Disturbance scenario : 10 % step increase in F1
F1 = 10;
XF1 = 5;
F1 = F1*1.10 ;

tend = 150;
tspan=[ 0  tend];  

options = odeset('RelTol',1e-6,'AbsTol',[1.0e-6 1.e-06 1.e-06]);

[t1,x1]=ode45(@evapmod,tspan, X0ss, options);


% Disturbance scenario : 10% step decrease in F1
F1 = 10;
XF1 = 5;
F1 = F1*0.90 ;

[t2,x2]=ode45(@evapmod,tspan, X0ss, options);



% Disturbance scenario : 15 % step increase in XF1
F1 = 10;
XF1 = 5; 
XF1 = XF1*1.15 ;

[t3,x3]=ode45(@evapmod,tspan, X0ss, options);



% Disturbance scenario : 15 % step decrease in XF1
F1 = 10;
XF1 = 5;
XF1 = XF1*0.85 ;
 
[t4,x4]=ode45(@evapmod,tspan, X0ss, options);


%Disturbance scenario: 20% step increase in T200

F1 = 10;
XF1 = 5; 
T200 = 25;
T200 = T200*1.20; 

[t5,x5]= ode45(@evapmod,tspan, X0ss, options); 


%Disturbance scenario: 20% step decrease in T200

F1 = 10;
XF1=5;
T200=25;
T200=T200*0.80;

[t6,x6]=ode45(@evapmod,tspan, X0ss, options);


% Plot step responses to F1 disurbance scenario  
figure(3); 

subplot(3,1,1)
grid on
plot(t1,x1(:,1),t2,x2(:,1),'--');
grid
legend('+10% F1' ,' -10% F1');
xlabel('t (min)')
ylabel('X2 ')
title(' Responses of outputs to the disurbance in F1  ')

subplot(3,1,2)
grid on
plot(t1,x1(:,2),t2,x2(:,2),'--');
grid
xlabel('t (min)')
ylabel('P2 ')

subplot(3,1,3)
grid on
plot(t1,x1(:,3),t2,x2(:,3),'--');
grid
xlabel('t (min)')
ylabel('L2 ')


% Plots step states to XF1 disturbance scenario
figure(4);

subplot(3,1,1)
grid on
plot(t3,x3(:,1),t4,x4(:,1),'--');
grid
legend('+15% XF1',' -15% XF1');
xlabel('t (min)')
ylabel('X2 ')
title(' Responses of outputs to the disturbance in XF1 ')

subplot(3,1,2)
grid on
plot(t3,x3(:,2),t4,x4(:,2),'--');
grid
xlabel('t (min)')
ylabel('P2 ')

subplot(3,1,3)
grid on
plot(t3,x3(:,3),t4,x4(:,3),'--');
grid
xlabel('t (min)')
ylabel('L2 ')


% Plots step states to T200 disturbance scenario
figure(5);

subplot(3,1,1)
grid on
plot(t5,x5(:,1),t6,x6(:,1),'--');
grid
legend('+20% T200' ,' -20% T200');
xlabel('t (min)')
ylabel('X2 ')
title(' Response of states to disurbance in T200  ')

subplot(3,1,2)
grid on
plot(t5,x5(:,2),t6,x6(:,2),'--');
grid
xlabel('t (min)')
ylabel('P2 ')

subplot(3,1,3)
grid on
plot(t5,x5(:,3),t6,x6(:,3),'--');
grid
xlabel('t (min)')
ylabel('L2 ')


