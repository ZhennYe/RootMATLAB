hold all;
for(ii=1:4)
T = 10;
dt = .001;
N = T/dt;
r = zeros(T/dt,2);
kapp = .4;
AA = 1;
A=sqrt(dt*AA^2/3);
% A = sqrt((3/amp^2)*dt);

r(:,1) = linspace(0,T,T/dt);
% plot(r(:,1),sqrt(r(:,1)),'k','LineWidth',2);
% plot(r(:,1),-sqrt(r(:,1)),'k','LineWidth',2)
for i = 2:length(r)
r(i,2) = r(i-1,2)+(2*A*rand(1)-A);
end

plot(r(:,1),r(:,2));
end