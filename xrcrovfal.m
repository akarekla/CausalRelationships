clearvars; close all;
load n  % NAO index data
load fal1  % Reanalysis rainfall data

% Extract rainfall (monthly values)
rrf = fal1{:,8};
rrf([1:7 340:end])=[];

rrf=double(rrf);

% Extract NAO index (monthly values)
n(333:end,:)=[];

nao=n(:,2);
nao=table2array(nao);
T= 1:1:length(nao);

%Calculate cross-covariance
x=cov1d_cross(nao,rrf,T);

figure()
l1=plot(x.tlag,x.covz(:,1),'r-');
hold on;
l2=plot(x.tlag,x.covz(:,2),'b--');
xlabel('Lag (Months)')
legend('C_{NAO,RAIN}','C_{RAIN,NAO}')
ylabel('XCOV');
grid on;
axis tight;
set(gca, 'FontSize', 14);
xlim([0 20]);

figure; 
plot(x.laga, x.rho);
xlabel('Lag (Months)')
ylabel('\rho_{NAO,RAIN}')
axis tight;
grid on;
set(gca, 'FontSize', 11);
xlim([-20 20]);
title('Ετεροσυνδιασπορά ΝΑΟ, βροχόπτωσης στη Φαλάσαρνα.')
%Calculate cross-covariance of  rain and NAO
y=cov1d_cross(rrf,nao,T);

figure()
l1=plot(y.tlag, y.covz(:,1),'r-');
hold on;
l2=plot(y.tlag, y.covz(:,2),'b--');
xlabel('Lag (Months)')
ylabel('XCOV')
legend('C_{RAIN,NAO}','C_{NAO,RAIN}')
grid on;
axis tight;
set(gca, 'FontSize', 14);
xlim([0 20]);

figure; 
plot(y.laga, y.rho);
xlabel('Lag (Months)')
ylabel('\rho_{RAIN,NAO}')
axis tight;
grid on;
set(gca, 'FontSize', 11);
xlim([-20 20]);
title('Ετεροσυνδιασπορά βροχόπτωσης, ΝΑΟ στη Φαλάσαρνα.')