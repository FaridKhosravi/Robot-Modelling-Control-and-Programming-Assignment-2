%
clear all
clc
 
% We have four parameters a0, a1, a2, a3 so there are four equations :

%   ? = a0 + a1*ti + a2*ti^2 + a3*ti^3
%   ?doti = a1 + 2*a2*ti + 3*a3*ti^2
%   ?f = a0 + a1*tf + a2*tf^2 + a3*tf^3
%   ?dotf = a1 + 2*a2*tf + 3*a3*tf^2
%   Considering ? = q in this assignment
%   Also 
%   To solve equations two following matrixes are defined according to four
%   equations

syms qi qdoti qf qdotf tf ti

A=[1 ti ti^2 ti^3 ; 0 1 2*ti 3*ti^2; 1 tf tf^2 tf^3; 0 1 2*tf 3*tf^2];
%
A = subs(A,ti,0);  % substitution of ti by 0 considering that initial time is zero  
B = [qi;qdoti;qf;qdotf];
X = linsolve(A,B); % solving the equations using linsolve function
pretty(X)

% Calcualting the polynomial coefficients considering the given values in assignment

C = subs(X,[qi  qdoti  qf qdotf tf],[25 0 90 0 4]) % using sub to give conditions to equation
syms a0 a1 a2 a3 ti 
qi = a0 + a1*ti + a2*ti^2 + a3*ti^3 % Position
qiDot = diff(qi,ti)  % Velocity which is derivative of position
qi2Dot = diff(qiDot,ti)  % Acceleration which is derivative of acceleration
   
ti=0:0.1:4;
   a=[-65/32 195/16 0 25]; %obtained polynomial coefficients
   qi = 25 + (195/16)*ti.^2 + (-65/32)*ti.^3; % position
   qiDot = 3*(-65/32)*ti.^2 + 2 * (195/16)*ti ; % velocity
   qi2Dot = 2 * (195/16) + 6 * (-65/32) * ti;  % acceleration
    
    
figure
     subplot(1,3,1);  % position
     t=[0:0.001:4];
     P=polyval(a,t);  %  returns the value of a polynomial of degree
     plot(t,P);
     title('Position')
     xlabel('Time sec')
     ylabel('Angle(deg)')
  
     subplot(1,3,2);  % velocity
       plot(ti,qiDot)
       title('Velocity')
       xlabel('Time sec')
       ylabel('velocity(deg/s)')
%
     subplot(1,3,3);   %acceleration
        plot(ti,qi2Dot)
        title('Acceleration')
        xlabel('Time sec')
        ylabel('Acceleration(deg/s2)')

