r0 = 1.5e11;
M = 2e30;
G = 6.67430e-11; 
v0 = 0;
dt = 1000;
t = 0:dt:1e8;
r = zeros(size(t));
v = zeros(size(t));
r(1) = r0; 
v(1) = v0; 
for i=1:length(t)-1
    k1_r = v(i);
    k1_v = (-1)*(G*M)/(r(i)^2);
    
    k2_r = v(i) + 0.5 * k1_v * dt;
    k2_v = (-1) * (G * M) / (r(i) + 0.5 * k1_r * dt)^2;
    
    k3_r = v(i) + 0.5 * k2_v * dt;
    k3_v = (-1) * (G * M) / (r(i) + 0.5 * k2_r * dt)^2;
    
    k4_r = v(i) + k3_v * dt;
    k4_v = (-1) * (G * M) / (r(i) + k3_r * dt)^2;
    
    r(i+1) = r(i) + (1/6) * (k1_r + 2*k2_r + 2*k3_r + k4_r) * dt;
    v(i+1) = v(i) + (1/6) * (k1_v + 2*k2_v + 2*k3_v + k4_v) * dt;
    
    if r(i+1)<=0
        t = t(1:i+1);
        r = r(1:i+1);
        v = v(1:i+1);
        break;
    end
end

figure;
subplot(2,1,1);
plot(t, r);
xlabel('Time (s)');
ylabel('Distance (m)');
title('Distance vs Time');

subplot(2,1,2);
plot(t, v,'r');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time');