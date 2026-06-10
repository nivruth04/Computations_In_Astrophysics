run('freefall_RK4.m')
run('freefall_eulers.m')
figure;
plot(t_rk4, r_rk4, 'b', 'DisplayName', 'RK4')
hold on
plot(t_eulers, r_eulers, 'r--', 'DisplayName', 'Euler')
legend
xlabel('Time (s)')
ylabel('Distance (m)')
title("RK4 vs Euler's(dt="+dt_eulers+")— Free Fall Comparison")
