clearvars; close all;
load n2  % NAO index data
 load lo1
  % Reanalysis rainfall data

% Extract rainfall (monthly values)
rrf = lo1{:,8};
rrf([1:7 340:end])=[];

rrf=double(rrf);

% Extract NAO index (monthly values)
n2(333:end,:)=[];
% nao=n2(:,1);
% nao=table2array(nao)

T= 1:1:length(n2);
x=cov1d_cross(n2,rrf,T);
figure; 
plot(x.laga, x.rho);
xlabel('Lag (Months)')
ylabel('\rho_{NAO,RAIN}')
axis tight;
grid on;
set(gca, 'FontSize', 11);
 xlim([-20 20]);
title('Ετεροσυσχέτιση ΝΑΟ, βροχόπτωσης στα Λευκά Όρη.')
%% perm
 for  j=1:500
      naop=rrf(randperm(numel(n2)));
      xperm(j)=cov1d_cross(naop,rrf,T);
 end
r=[xperm(1:20).rho];
rmin=min(r,[],2);
rmax=max(r,[],2);
 figure()
plot(x.laga,x.rho,'r-');
 xlabel('Καθυστέρηση (μήνες)')
 ylabel('\rho_{NAO,ΒΡΟΧΗ}');
 
hold on;
 plot(x.laga,rmin,'b--');
 plot(x.laga,rmax,'m--');
 legend('\rho_{NAO,ΒΡΟΧΗ}','ελάχιστο\rho_{NAO,ΒΡΟΧΗ}αναδιατάξεων', 'μέγιστο\rho_{NAO,ΒΡΟΧΗ}αναδιατάξεων')
 title({['Ετεροσυσχέτιση ΝΑΟ, βροχόπτωσης']
        [' στα Λευκά Όρη με αναδιατάξεις στο ΝΑΟ']})
  grid on;
  axis tight;
 xlim([-24 24]);