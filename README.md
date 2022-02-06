#Newell and Lee Evaporator 

This is a multiple input and multiple output (MIMO) system. Evaporation is the process of heating a liquid to its boiling point to remove water as vapor. An evaporator plant is an industrial process for evaporating solvents from a feed (e.g., in paper or sugar production). 
N.B: Integration of theory and simulated resuts are the main focuses of this project. 

#Control Objective

Keeping variations in the product composition as small as possible in the presence of disturbances. To operate the evaporator safely and without damaging the installed equipment, it requires the pressure in the evaporator (P2) and the level of liquid in the separator (L2) to be controlled. If the separator overflows the condenser will be damaged. If it runs dry, the pump will be damaged.

#1st Report

In this report a literature review, along with the control perspective, has been discussed. Input/output variables, disturbances, constrains, and mathematical model of the evaporator have been discussed. 

#2nd Report

From the mathematical model in report 1, a matlab code has been prepared in order to observe the steady state response of the system, and the steady state changes with different step changes.

# 3rd Report

From report 2, it has been observed that some outputs changes proportionally along with some specific inputs. Hence a RGA analysis has been done to identify those I/O (input-output) pairs. It helped to decentralize those pairs and allowed a simple proportional controller to control it. Then Ziegler-Nichols open loop method, and Relay-Feedback method used to tune the PID controller to control the others pairs. After tuning, different simulated disturbance and set point changes were made in order to evaluate the controller performance. 
