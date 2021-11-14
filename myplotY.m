kc1h=1+0.4*cos(t); 
kc1l=-0.72+0.2*cos(t);
kc2h=1.5+0.1*cos(t);
kc2l=-1.5+0.2*cos(t);


% figure(1);
% 
% plot(t,y(:,1),'r',t,y(:,2),'k-.',t,y4(:,2),'m:',t,kc1h,'b--',t,kc1l,'g--','linewidth',1.5);
% xlabel('time(s)');ylabel('output tracking')
% h=legend('$y_{d}$','$y$ with TABLF controller','$y$ with non-TABLF controller','$\bar k_{c1}$','$\underline k_{c1}$');
% set(h,'interpreter','latex','fontsize',8)
% axis([0,35,-2,2.5]);
% for i=1:1:150
%     tnT1(i)=t(i);
%     z1T1(i)=y(i,1);
%     z2T1(i)=y(i,2);
%     z3T1(i)=kc1h(i,1);
%     z4T1(i)=kc1l(i,1);
%     z5T1(i)=y4(i,2);
% end
% tn1=tnT1';
% z11=z1T1';
% z21=z2T1';
% z31=z3T1';
% z41=z4T1';
% z51=z5T1';
% hold on;
% axes('position',[0.2,0.18,0.4,0.3]);
% plot(tn1,z11,'r',tn1,z21,'k-.',tn1,z51,'m:','linewidth',1.5);
% axis tight;
% 
% 
% for i=400:1:440
%     tnT(i)=t(i);
%     z1T(i)=y(i,1);
%     z2T(i)=y(i,2);
%     z5T(i)=y4(i,2);
%     z3T(i)=kc1h(i,1);
%     z4T(i)=kc1l(i,1);
% end
% for j=1:1:40
% tn(j)=tnT(j+399);
% z1(j)=z1T(j+399);
% z2(j)=z2T(j+399);
% z5(j)=z5T(j+399);
% z3(j)=z3T(j+399);
% z4(j)=z4T(j+399);
% end
% hold on;
% axes('position',[0.2,0.18,0.4,0.3]);
% plot(tn,z1,'r',tn,z2,'k-.',tn,z5,'m:',tn,z4,'g--','linewidth',1.5);% ,tn,z3,':b',tn,z4,'g--'
% 
% 
% for i=1400:1:1500
%     tnT2(i)=t(i);
%     z1T2(i)=y(i,1);
%     z2T2(i)=y(i,2);
%     z5T2(i)=y4(i,2);
%     z3T2(i)=kc1h(i,1);
%     z4T2(i)=kc1l(i,1);
% end
% for j=1:1:100
% tn2(j)=tnT2(j+1399);
% z12(j)=z1T2(j+1399);
% z22(j)=z2T2(j+1399);
% z52(j)=z5T2(j+1399);
% z32(j)=z3T2(j+1399);
% z42(j)=z4T2(j+1399);
% end
% hold on;
% axes('position',[0.2,0.18,0.4,0.3]);
% plot(tn2,z12,'r',tn2,z22,'k-.',tn2,z52,'m:',tn2,z42,'g--','linewidth',1.5);
% 
% for k=1:1:200
%     tnT1(k)=t(k);
%     z1T1(k)=y(k,1);
%     z2T1(k)=y(k,2);
%     z3T1(k)=kc1h(k,1);
%     z4T1(k)=kc1l(k,1);
% end
% tn1=tnT1';
% z11=z1T1';
% z21=z2T1';
% z31=z3T1';
% z41=z4T1';
% hold on;
% axes('position',[0.2,0.18,0.4,0.3]);
% plot(tn1,z11,'r',tn1,z21,'k-.',tn1,z31,':b',tn1,z41,'g--','linewidth',1.5);
% 
% 
% axis tight;
% 
% figure(2);
% plot(t,y(:,3),'k',t,y4(:,3),'m:',t,kc2h,'b--',t,kc2l,'g--','linewidth',1.5);%t,y(:,2),'b',
% xlabel('time(s)');h1=ylabel('$x_{2}$');
% h=legend('$x_{2}$ with TABLF controller ','$x_{2}$ with non-TABLF controller ','$\bar k_{c2}$','$\underline k_{c2}$');set(h1,'interpreter','latex','fontsize',14);
% set(h,'interpreter','latex','fontsize',8);
% axis([0,35,-2,2.8]);
% for i=1:1:150
%     tnT1(i)=t(i);
%     z1T1(i)=y(i,3);
%     z2T1(i)=y4(i,3);
%     z3T1(i)=kc2h(i,1);
%     
% end
% tn1=tnT1';
% z11=z1T1';
% z21=z2T1';
% z31=z3T1';
% 
% hold on;
% axes('position',[0.2,0.18,0.4,0.3]);
% plot(tn1,z11,'k',tn1,z21,'m:',tn1,z31,'b--','linewidth',1.5);
% axis tight;


% figure(3);
% plot(t,y2(:,1),'k',t,y5(:,1),'m:',t,y2(:,2),'g--',t,y2(:,3),'b--','linewidth',1.5);%t,y(:,2),'b',
% xlabel('time(s)');h1=ylabel('$s_{1}$');h=legend('$s_{1}$ with TABLF controller','$s_{1}$ with non-TABLF controller','$-k_{a1}$','$k_{b1}$');
% set(h1,'interpreter','latex','fontsize',14);
% set(h,'interpreter','latex','fontsize',8);
% axis([0,35,-1.8,3]);
% for i=420:1:450
%     tnT(i)=t(i);
%     z1T(i)=y2(i,1);
%     z2T(i)=y5(i,1);
%     z5T(i)=y2(i,2);
%  
% end
% for j=1:1:30
% tn(j)=tnT(j+419);
% z1(j)=z1T(j+419);
% z2(j)=z2T(j+419);
% z5(j)=z5T(j+419);
% 
% end
% hold on;
% axes('position',[0.2,0.18,0.4,0.3]);
% plot(tn,z1,'k',tn,z2,'m:',tn,z5,'g--','linewidth',1.5);% ,tn,z3,':b',tn,z4,'g--'



figure(4);
plot(t,y1(:,1),'k',t,y3(:,1),'m:',t,y1(:,2),'g--',t,y1(:,3),'b:','linewidth',1.5);%t,y(:,2),'b',
xlabel('time(s)');h1=ylabel('$s_{2}$');h=legend('$s_{2}$ with TABLF controller','$s_{2}$ with non-TABLF controller','$-k_{a2}$','$k_{b2}$');
set(h1,'interpreter','latex','fontsize',14);
set(h,'interpreter','latex','fontsize',8);
axis([0,35,-3,4.5]);
for i=1:1:10
    tnT(i)=t(i);
    z1T(i)=y1(i,1);
    z4T(i)=y3(i,1);
    z2T(i)=y1(i,2);
    z3T(i)=y1(i,3);
end
tn=tnT';
z1=z1T';
z2=z2T';
z4=z4T';
z3=z3T';
hold on;
axes('position',[0.2,0.18,0.4,0.3]);
plot(tn,z1,'k',tn,z4,'m:',tn,z3,'b:','linewidth',1.5);
axis tight;



% figure(5);
% plot(t,u(:,1),'linewidth',1.5);%t,y(:,2),'b',
% xlabel('time(s)');ylabel('Control input');legend('u');
% figure(6);
% plot(t,y2(:,4),'g--',t,y1(:,4),'b-.','linewidth',1.5);%t,y(:,2),'b',
% xlabel('time(s)');h=legend('$\left\|\hat{W}_{1}\right\|$','$\left\|\hat{W}_{2}\right\|$');
% set(h,'interpreter','latex','fontsize',6);
% 
% figure(7);
% plot(t,y2(:,5),'g',t,y2(:,6),'b','linewidth',1.5);%t,y(:,2),'b',
% xlabel('time');h=legend('$\alpha_{1}$','$z_{2}$');
% set(h,'interpreter','latex','fontsize',10);
% figure(8);
% plot(t,y2(:,1),'k','linewidth',1.5);%t,y(:,2),'b',
% figure(9);
% plot(t,y1(:,1),'k','linewidth',1.5);%t,y(:,2),'b',
% xlabel('time');h1=ylabel('$s_{2}$');h=legend('$s_{2}$','$-k_{a2}$','$k_{b2}$');




