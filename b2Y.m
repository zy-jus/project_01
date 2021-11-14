function [sys,x0,str,ts] = b2Y(t,x,u,flag)

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
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 1;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;  
sys = simsizes(sizes);
x0  = [0];
str = [];
ts  = [-1 0];
function sys=mdlDerivatives(t,x,u)
alf=u(1);
tol=0.1;
sys(1)=(1/tol)*(alf-x(1));
function sys=mdlOutputs(t,x,u)
sys(1)=x(1);