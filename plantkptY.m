function [sys,x0,str,ts] = plantkptY(t,x,u,flag)
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
    error('Simulink:blocks:unhandledFlag', num2str(flag));
end


function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 2;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 3;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1; 
sys = simsizes(sizes);
x0=[0,1.1];
str=[];
ts=[-1 0];

function sys=mdlDerivatives(t,x,u)
ut=u(1);
a=u(2);
b=u(3);
f1=x(1)*exp(0.5*x(1));
g1=1+x(1)^2;
f2=x(1)*x(2)^2;
g2=3+cos(x(1));
sys(1)=f1+g1*x(2)+a*sin(a)/(1+a^4);%+2*a^2
sys(2)=f2+g2*ut+sin(a)/(1+b^2);%0.2*b*sin(b)


function sys=mdlOutputs(t,x,u)

%ÏµÍ³Êä³ösin(a)sin(b)
sys(1)=x(1);
sys(2)=x(2);