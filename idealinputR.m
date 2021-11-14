function [sys,x0,str,ts] = idealinputR(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1
    sys=mdlDerivatives(t,x,u); 
case 3
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
    otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts=[];

function sys=mdlOutputs(t,x,u)
yd=0.2*cos(0.5*t)+0.5*sin(t);
sys(1)=yd;