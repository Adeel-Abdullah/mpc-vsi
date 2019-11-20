% Variables required in the control algorithm
global Ts R L v states
% Sampling time of the predictive algorithm [s]
Ts = 25e-6;
% Load parameters
R = 10; % Resistance [Ohm]
L = 10e-3; % Inductance [H]
e = 100; % Back-EMF peak amplitude [V]
f_e = 50*(2*pi); % Back-EMF frequency [rad/s]
Vdc = 520; % DC-link voltage [V]
% Current reference
I_ref_peak = 10; % Peak amplitude [A]
f_ref = 50*(2*pi); % Frequency [rad/s]
% Voltage vectors
v0 = 0;
v1 = 2/3*Vdc;
v2 = 1/3*Vdc + 1j*sqrt(3)/3*Vdc;
v3 = -1/3*Vdc + 1j*sqrt(3)/3*Vdc;
v4 = -2/3*Vdc;
v5 = -1/3*Vdc - 1j*sqrt(3)/3*Vdc;
v6 = 1/3*Vdc - 1j*sqrt(3)/3*Vdc;
v7 = 0;
v = [v0 v1 v2 v3 v4 v5 v6 v7];
% Switching states
states = [0 0 0;1 0 0;1 1 0;0 1 0;0 1 1;0 0 1;1 0 1;1 1 1];