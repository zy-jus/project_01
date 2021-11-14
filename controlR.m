function [sys,x0,str,ts] = controlR(t,x,u,flag)
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
sizes.NumInputs      = 6;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  =0.1*ones(100,1);%初始自适应率
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)
yd=u(1);kc2=1.5;a2=0.1;
x1=u(2);x2=u(3);alf=u(4);b2=u(5);
d_b2=(alf-b2)/a2;
z2=x2-b2;kb2=kc2-z2;
w2=0.8;m2=0.2;T2=0.2*diag(ones(1,100));th20=zeros(100,1);
u2=1/(kb2^2-z2^2);
A2=[x1 x2 yd b2 d_b2]';%A2 6-1

c1=zeros(1,99);
for i=1:1:99
   c1(i)=-2+(i-1)*0.0404040;
end
C1=[c1,2];

c2=zeros(1,99);
for i=1:1:99
   c2(i)=-1.5+(i-1)*0.030303;
end
C2=[c2,1.5];

c3=zeros(1,99);
for i=1:1:99
   c3(i)=-3+(i-1)*0.06060606;
end
C3=[c3,3];
C=[C1;C1;C2;C3;C3];%C 6-20
xi=A2;
h2=zeros(100,1);
for j=1:1:100
    h2(j)=exp(-norm(xi-C(:,j))^2/(2*w2^2));%h 100-1
end
W=zeros(100,1);
for i=1:1:100
W(i)=x(i);
end

d_W=T2*(z2*h2*u2-m2*(W-th20));

for i=1:1:100
 sys(i)=d_W(i);
end


function sys=mdlOutputs(t,x,u)
yd=u(1);kc2=1.8;a2=0.1;
x1=u(2);x2=u(3);alf=u(4);b2=u(5);G2=u(6);
d_b2=(alf-b2)/a2;
z2=x2-b2;kb2=kc2-z2;
k2=50;w2=0.8;
u2=1/(kb2^2-z2^2);
A2=[x1 x2 yd b2 d_b2]';%A2 6-1

c1=zeros(1,99);
for i=1:1:99
   c1(i)=-2+(i-1)*0.0404040;
end
C1=[c1,2];

c2=zeros(1,99);
for i=1:1:99
   c2(i)=-1.5+(i-1)*0.030303;
end
C2=[c2,1.5];

c3=zeros(1,99);
for i=1:1:99
   c3(i)=-3+(i-1)*0.06060606;
end
C3=[c3,3];
C=[C1;C1;C2;C3;C3];%C 6-20
xi=A2;
h2=zeros(100,1);
for j=1:1:100
    h2(j)=exp(-norm(xi-C(:,j))^2/(2*w2^2));%h 100-1
end
W=zeros(100,1);
for i=1:1:100
W(i)=x(i);
end

r2=x2;

u=-k2*z2-0.25*z2*u2-W'*h2-0.01*cosh(z2)*G2*z2^2/(u2*(1+z2^2));

sys(1)=u;
sys(2)=z2;
sys(3)=kb2;
sys(4)=r2;
