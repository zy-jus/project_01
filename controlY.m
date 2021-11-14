function [sys,x0,str,ts] = controlY(t,x,u,flag)
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
sizes.NumOutputs     = 6;
sizes.NumInputs      = 6;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  =0.1*ones(100,1);%初始自适应率
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)
yd=u(1);a2=0.1;
x1=u(2);x2=u(3);b2=u(4);alf=u(5);
db2=(alf-b2)/a2;
z2=x2-b2;
q2=0*(z2<=0)+1*(z2>0);
kc2h=1.5+0.2*cos(t);
kc2l=-1.5+0.1*cos(t);
ka2=b2-kc2l;           kb2=kc2h-b2;
dka2=db2+0.5*sin(t);   dkb2=-0.1*sin(t)-db2;

u2=(q2/(kb2^2-z2^2)+(1-q2)/(ka2^2-z2^2));

k2=50;w2=0.8;m2=0.2;T2=0.2*diag(ones(1,100));th20=zeros(100,1);

A2=[x1 x2 yd b2 b2]';%A2 6-1

c1=zeros(1,99);
for i=1:1:99
   c1(i)=-1+(i-1)*0.0202020;
end
C1=[c1,1];

c2=zeros(1,99);
for i=1:1:99
   c2(i)=-2+(i-1)*0.0404040;
end
C2=[c2,2];

c3=zeros(1,99);
for i=1:1:99
   c3(i)=-0.6+(i-1)*0.0121212;
end
C3=[c3,0.6];

c4=zeros(1,99);
for i=1:1:99
   c4(i)=-3+(i-1)*0.0606060;
end
C4=[c4,3];
C=[C1;C2;C1;C4;C4];%C 6-20
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
yd=u(1);a2=0.1;
x1=u(2);x2=u(3);b2=u(4);alf=u(5);G2=u(6);
db2=(alf-b2)/a2;
z2=x2-b2;
g2=3+cos(x(1)*x(2));q2=0*(z2<=0)+1*(z2>0);
kc2h=1.5+0.2*cos(t);
kc2l=-1.5+0.1*cos(t);
ka2=b2-kc2l;           kb2=kc2h-b2;
dka2=db2+0.5*sin(t);   dkb2=-0.1*sin(t)-db2;
A2=(1-q2)*(dka2/ka2)^2+q2*(dkb2/kb2)^2+0.1;
k2b=(A2)^0.5;
u2=(q2/(kb2^2-z2^2)+(1-q2)/(ka2^2-z2^2));

k2=50;w2=0.8;m2=0.2;T2=0.2*diag(ones(1,100));th20=zeros(100,1);

A2=[x1 x2 yd b2 db2]';%A2 6-1

c1=zeros(1,99);
for i=1:1:99
   c1(i)=-1+(i-1)*0.0202020;
end
C1=[c1,1];

c2=zeros(1,99);
for i=1:1:99
   c2(i)=-2+(i-1)*0.0404040;
end
C2=[c2,2];

c3=zeros(1,99);
for i=1:1:99
   c3(i)=-0.6+(i-1)*0.0121212;
end
C3=[c3,0.6];

c4=zeros(1,99);
for i=1:1:99
   c4(i)=-3+(i-1)*0.0606060;
end
C4=[c4,3];
C=[C1;C2;C1;C4;C4];%C 6-20
xi=A2;
h2=zeros(100,1);
for j=1:1:100
    h2(j)=exp(-norm(xi-C(:,j))^2/(2*w2^2));%h 100-1
end
W=zeros(100,1);
for i=1:1:100
W(i)=x(i);
end
t=norm(W);
r=x1/(1+x2^2);
r2=r^2;

u=(-(k2+k2b)*z2-0.25*z2*u2-W'*h2-0.1*cosh(z2)*G2*z2/(u2*(1+z2^2)))/g2;

sys(1)=u;
sys(2)=z2;
sys(3)=-ka2;
sys(4)=kb2;
sys(5)=t;
sys(6)=r2;
