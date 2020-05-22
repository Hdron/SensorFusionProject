% File to plot measurements
acc = Acceleration.Variables;
mean_acc = mean(acc);
var_acc = var(acc);

angVel = AngularVelocity.Variables;
mean_angVel = mean(angVel);
var_angVel = var(angVel);

mag = MagneticField.Variables;
mean_mag = mean(mag);
var_mag = var(mag);

orientation = Orientation.Variables;

x = [1:1:length(acc)];
figure(1);
subplot(2,3,1);
hold on;
plot(x, acc(:,1),'r');
plot(x, acc(:,2),'b');
plot(x, acc(:,3),'g');
hold off;
grid on;
legend('x','y','z');
title('Accellerometer readings')
ylabel('Values')
xlabel('Time-step')

x = [1:1:length(angVel)];
subplot(2,3,2);
hold on;
plot(x, angVel(:,1),'r');
plot(x, angVel(:,2),'b');
plot(x, angVel(:,3),'g');
hold off;
grid on;
legend('x','y','z');
title('Angular velocities readings')
ylabel('Values')
xlabel('Time-step')

x = [1:1:length(mag)];
subplot(2,3,3);
hold on;
plot(x, mag(:,1),'r');
plot(x, mag(:,2),'b');
plot(x, mag(:,3),'g');
hold off;
grid on;
legend('x','y','z');
title('Magnetic field readings')
ylabel('Values')
xlabel('Time-step')

x = [1:1:length(orientation)];

subplot(2,3,4);
hold on;
plot(x, orientation(:,1),'r');
plot(x, orientation(:,2),'b');
plot(x, orientation(:,3),'g');
hold off;
grid on;
legend('x','y','z');
title('Orrientation readings')
ylabel('Values')
xlabel('Time-step')

figure(2);
for i = 1:3
    x = [min(acc(:,i)):0.1:max(acc(:,i))+2];
    subplot(1,3,i);
    hold on;
    acc_pdf = mvnpdf(x', mean_acc(i), var_acc(i));
    histogram(acc(:,i));
    plot(x, acc_pdf.*length(acc(:,i)),'Linewidth',3);
    hold off;
    legend('Gaussian', 'True')
    title('Acceleration values')
    ylabel('Number of states')
end

figure(3);
for i = 1:3
    x = [min(angVel(:,i)):0.1:max(angVel(:,i))+2];
    subplot(1,3,i);
    hold on;
    angVel_pdf = mvnpdf(x', mean_angVel(i), var_angVel(i));
    histogram(acc(:,i));
    plot(x, angVel_pdf.*length(angVel(:,i)),'Linewidth',3);
    hold off;
    legend('Gaussian', 'True')
    title('Angular velocity values')
    ylabel('Number of states')
end

figure(4);
for i = 1:3
    x = [1.1*min(mag(:,i)):0.1:max(mag(:,i))*1.1];
    subplot(1,3,i);
    hold on;
    mag_pdf = mvnpdf(x', mean_mag(i), var_mag(i));
    histogram(acc(:,i));
    plot(x, mag_pdf.*length(mag(:,i)),'Linewidth',3);
    hold off;
    legend('Gaussian', 'True')
    title('Magnetic field values')
    ylabel('Number of states')
end