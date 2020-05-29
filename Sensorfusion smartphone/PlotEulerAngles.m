% Script to plot the euler angles

% 
% euler_ref = q2euler(meas.orient)
Orient = zeros(4)
time=meas.t;

k=1;
for i=1:size(time,2)

    if isnan(meas.orient(:,i)) == 0
        Orient(k,:)= meas.orient(:,i);
        TOrient(k,1) = time(i);
        k=k+1;
    end
end
% Save Euler angles
euler = q2euler(xhat.x);
Orient = q2euler(Orient');

xyz = {'x','y','z'};
index = [3,2,1];
figure(1);
for i=1:3
    subplot(1,3,i)
    hold on;
    plot(xhat.t,euler(index(i),:));
    plot(TOrient,Orient(index(i),:));
    hold off;
    legend('euler', 'Google')
    title(xyz{i})
    ylabel('rad')
    xlabel('time')
end
