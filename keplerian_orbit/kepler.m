dt = 1000;
M = 1.9891e30;
G = 6.67430e-11;
t = 0:dt:9.6e7;

r = zeros(size(t));   
r_dot = zeros(size(t));   
theta = zeros(size(t));   
theta_dot = zeros(size(t));

Y = [r,theta,r_dot,theta_dot];

r(1)     = 1.471e11;   
r_dot(1)  = 0;          
theta(1) = 0 ;         
theta_dot(1)  = 36889/1.471e11 ;

for i = 1:length(t)
    
    k1_Y1 = r_dot(i);
    k1_Y2 = -G*M / (r(i)^2) + r(i)*(theta_dot(i)^2);
    k1_Y3 = theta_dot(i);
    k1_Y4 = -2*theta_dot(i)*r_dot(i)/r(i);

    r2    = r(i)         + 0.5*dt*k1_Y1;
    rd2   = r_dot(i)     + 0.5*dt*k1_Y2;
    th2   = theta(i)     + 0.5*dt*k1_Y3;
    td2   = theta_dot(i) + 0.5*dt*k1_Y4;

    k2_Y1 = rd2;
    k2_Y2 = -G*M/r2^2 + r2*td2^2;
    k2_Y3 = td2;
    k2_Y4 = -2*rd2*td2/r2;

    r3    = r(i)         + 0.5*dt*k2_Y1;
    rd3   = r_dot(i)     + 0.5*dt*k2_Y2;
    th3   = theta(i)     + 0.5*dt*k2_Y3;
    td3   = theta_dot(i) + 0.5*dt*k2_Y4;

    k3_Y1 = rd3;
    k3_Y2 = -G*M/r3^2 + r3*td3^2;
    k3_Y3 = td3;
    k3_Y4 = -2*rd3*td3/r3;

    r4    = r(i)         + dt*k3_Y1;
    rd4   = r_dot(i)     + dt*k3_Y2;
    th4   = theta(i)     + dt*k3_Y3;
    td4   = theta_dot(i) + dt*k3_Y4;
    
    k4_Y1 = rd4;
    k4_Y2 = -G*M/r4^2 + r4*td4^2;
    k4_Y3 = td4;
    k4_Y4 = -2*rd4*td4/r4;

    r(i+1)     = r(i)     + (dt/6)*(k1_Y1 + 2*k2_Y1 + 2*k3_Y1 + k4_Y1);
    r_dot(i+1) = r_dot(i) + (dt/6)*(k1_Y2 + 2*k2_Y2 + 2*k3_Y2 + k4_Y2);
    theta(i+1) = theta(i) + (dt/6)*(k1_Y3 + 2*k2_Y3 + 2*k3_Y3 + k4_Y3);
    theta_dot(i+1) = theta_dot(i) + (dt/6)*(k1_Y4 + 2*k2_Y4 + 2*k3_Y4 + k4_Y4);
    
end 

x = r .* cos(theta);
y = r .* sin(theta);
figure;
plot(x, y);
hold on;
plot(0,0,'y.',MarkerSize=100);
plot(x(1),0,'g.',MarkerSize=50);
xlabel('X (m)');
ylabel('Y (m)');
title('Keplerian Orbit of the Earth');
axis equal;
grid on;