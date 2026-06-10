r0 = 1.5e11;
M = 2e30;
G = 6.67430e-11;
R = 6.957e8;
v0 = 0;
dt_rk4 = 1000;
t_rk4 = 0:dt_rk4:1e8;
r_rk4 = zeros(size(t_rk4));
v_rk4 = zeros(size(t_rk4));
r_rk4(1) = r0; 
v_rk4(1) = v0; 
for i=1:length(t_rk4)-1
    k1_r = v_rk4(i);
    k1_v = (-1)*(G*M)/(r_rk4(i)^2);
    
    k2_r = v_rk4(i) + 0.5 * k1_v * dt_rk4;
    k2_v = (-1) * (G * M) / (r_rk4(i) + 0.5 * k1_r * dt_rk4)^2;
    
    k3_r = v_rk4(i) + 0.5 * k2_v * dt_rk4;
    k3_v = (-1) * (G * M) / (r_rk4(i) + 0.5 * k2_r * dt_rk4)^2;
    
    k4_r = v_rk4(i) + k3_v * dt_rk4;
    k4_v = (-1) * (G * M) / (r_rk4(i) + k3_r * dt_rk4)^2;
    
    r_rk4(i+1) = r_rk4(i) + (1/6) * (k1_r + 2*k2_r + 2*k3_r + k4_r) * dt_rk4;
    v_rk4(i+1) = v_rk4(i) + (1/6) * (k1_v + 2*k2_v + 2*k3_v + k4_v) * dt_rk4;
    
    if r_rk4(i+1)<=R
        t_rk4 = t_rk4(1:i+1);
        r_rk4 = r_rk4(1:i+1);
        v_rk4 = v_rk4(1:i+1);
        break;
    end
end

figure;
subplot(2,1,1);
plot(t_rk4, r_rk4);
xlabel('Time (s)');
ylabel('Distance (m)');
title('Distance vs Time');

subplot(2,1,2);
plot(t_rk4, v_rk4,'r');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time');
sgtitle('Free Fall-RK4')
