function [sys,x0,str,ts] = alfR(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 100;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = 0.1*ones(100,1);
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)
dyd=0.5*cos(t)-0.1*sin(0.5*t);yd=0.2*cos(0.5*t)+0.5*sin(t);
x1=u(1);
z1=x1-yd;kc1=1;kb1=kc1-yd;

u1=1/(kb1^2-z1^2);
T1=0.4*diag(ones(1,100));m1=1.2;W10=zeros(100,1);w1=0.6;
xi=[x1 yd dyd]';

c1=zeros(1,99);
for i=1:1:99
   c1(i)=-1+(i-1)*0.0202020;
end
C1=[c1,1];
c2=zeros(1,99);
for i=1:1:99
   c2(i)=-0.6+(i-1)*0.0121212;
end
C2=[c2,0.6];
C=[C1;C1;C2];
h1=zeros(100,1);
for j=1:1:100
    h1(j)=exp(-norm(xi-C(:,j))^2/(2*w1^2));
end

W=zeros(100,1);
for i=1:1:100
W(i)=x(i);
end

d_W=T1*(z1*h1*u1-m1*(W-W10));

for i=1:1:100
 sys(i)=d_W(i);
end
 

function sys=mdlOutputs(t,x,u)
dyd=0.5*cos(t)-0.1*sin(0.5*t);yd=0.2*cos(0.5*t)+0.5*sin(t);
x1=u(1);k1=30;G1=u(2);
z1=x1-yd;kc1=1;kb1=kc1-yd;
w1=0.6;
u1=1/(kb1^2-z1^2);
%A1 3-1
xi=[x1 yd dyd]';

c1=zeros(1,99);
for i=1:1:99
   c1(i)=-1+(i-1)*0.0202020;
end
C1=[c1,1];
c2=zeros(1,99);
for i=1:1:99
   c2(i)=-0.6+(i-1)*0.0121212;
end
C2=[c2,0.6];
C=[C1;C1;C2];
h1=zeros(100,1);
for j=1:1:100
    h1(j)=exp(-norm(xi-C(:,j))^2/(2*w1^2));%h 30-1
end


W=zeros(100,1);
for i=1:1:100
W(i)=x(i);
end


alf=-k1*z1-0.25*z1*u1-W'*h1-0.01*cosh(z1)*G1*z1^2/(u1*(1+z1^2));

r1=0.1*x1;
sys(1)=alf;
sys(2)=z1;
sys(3)=kb1;
sys(4)=r1;
