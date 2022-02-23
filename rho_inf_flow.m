load n2
load a2
x=datetime(1980,1,1):calmonths(1):datetime(2020,2,1);
figure;
plot(x,n2)
title('Μηνιαίο NAO από το 1980 έως το 2020')
xtickformat('MMMyy')
ax = gca;
ax.XTickLabelRotation = 90;
y=datetime(1980,1,1):calmonths(1):datetime(2020,12,1);
figure;
rf1=a2(:,8)
rf1=table2array(rf1)
plot(y,rf1)
title('Μηνιαία βροχόπτωση Ρόδου από 1980 έως 2020.')
xtickformat('MMMyy')
ax = gca;
ax.XTickLabelRotation = 90;
%% xoris olisthisi

for  i=1:482
    
        rrf1(i,1)=a2{i,8};
        
end
rrf1=rrf1(1:482);

dt = 1;
T21(1)= causal_est(rrf1, n2, 1);
T21(1)=T21(1)/dt;
figure()
autocorr(rrf1)
grid on;
axis tight;
set(gca, 'FontSize', 14);
xlabel('Μήνες')
ylabel('Αυτοσυσχέτιση')
title('Συνάρτηση αυτοσυσχέτισης βροχόπτωσης Ρόδου')
figure()
h=histfit(rrf1, 20, 'exponential');

title('Συνάρτηση πυκνότητας πιθανότητας βροχόπτωσης Ρόδου')
xlabel('Τιμές βροχόπτωσης Ρόδου')
ylabel('Συχνότητα εμφάνισης')
n2=n2(1:482);

norm=[rrf1 n2];
[T12nn1, x]=multi_infoflow(norm, 1)



%%
figure()
autocorr(n2)
grid on;
axis tight;
set(gca, 'FontSize', 14);
xlabel('Μήνες')
ylabel('Αυτοσυσχέτιση')
title('Συνάρτηση αυτοσυσχέτισης ΝΑΟ')
%% 1os

j=1;
for  i=2:482
    
        rrf1(j,1)=a2{i,8};
        j=j+1;
    
end
rrf1=rrf1(2:482);
n2=n2(1:481);
dt =1;
%n=table2array(n)
    dt = 1;
    T21(2) = causal_est(rrf1, n2, 1);
    T21(2)=T21(2)/dt;
    norm=[rrf1 n2];
[T12nn2, x] =multi_infoflow(norm, 1)
histogram(rrf1)
grid on;
axis tight;
set(gca, 'FontSize', 14);
title('Ιστόγραμμα μηνιαίας βροχόπτωσης Ρόδου')
xlabel('Τιμές βροχόπτωσης')
ylabel('Συχνότητα εμφάνισης')
%% 2os

j=1;
for  i=3:482
    
        rrf2(j,1)=a2{i,8};
        j=j+1;
    
end
rrf2=rrf1(3:481);
n21=n2(1:479);
    dt = 1;
    T21(3) = causal_est(rrf2, n21, 1);
    T21(3)=T21(3)/dt;
norm=[rrf2 n21];
[T12nn3, x]=multi_infoflow(norm, 1)
%% 3os

j=1;
for  i=4:482
    
        rrf3(j,1)=a2{i,8};
        j=j+1;
    
end
rrf3=rrf1(4:481);
n3=n2(1:478);
    dt = 1;
    T21(4) = causal_est(rrf3, n3, 1);
    T21(4)=T21(4)/dt;
    
    norm=[rrf3 n3];
[T12nn4, x]=multi_infoflow(norm, 1)
%% 4os

j=1;
for  i=5:482
    
        rrf4(j,1)=a2{i,8};
        j=j+1;
    
end
rrf4=rrf1(5:481);
n4=n2(1:477); 
    dt = 1;
    T21(5) = causal_est(rrf4, n4, 1);
    T21(5)=T21(5)/dt;
    
    norm=[rrf4 n4];
    [T12nn5, x]=multi_infoflow(norm, 1)
%% 5os

j=1;
for  i=6:482
    
        rrf5(j,1)=a2{i,8};
        j=j+1;
    
end
rrf5=rrf1(6:481);
n5=n2(1:476); 

    dt = 1;
    T21(6) = causal_est(rrf5, n5, 1);
    T21(6)=T21(6)/dt;
    
    norm=[rrf5 n5];
[T12nn6, x]=multi_infoflow(norm, 1)
   %% 6os

j=1;
for  i=7:482
    
        rrf6(j,1)=a2{i,8};
        j=j+1;
    
end

rrf6=rrf1(7:481);
n6=n2(1:475);

    dt = 1;
    T21(7) = causal_est(rrf6, n6, 1);
    T21(7)=T21(7)/dt;
    
    
    norm=[rrf6 n6];
[T12nn7, x]=multi_infoflow(norm, 1)
figure()
scatter(rrf6,n6)
title('Διάγραμμα διασποράς βροχόπτωσης Ρόδου ολισθημένης κατά 6 μήνες με ΝΑΟ')
xlabel('Τιμές βροχόπτωσης')
ylabel('Τιμές ΝΑΟ')
    %% 7os

j=1;
for  i=8:482
    
        rrf7(j,1)=a2{i,8};
        j=j+1;
    
end
rrf7=rrf1(8:481);
n7=n2(1:474);
    dt = 1;
    T21(8) = causal_est(rrf7, n7, 1);
    T21(8)=T21(8)/dt;
    
    norm=[rrf7 n7];
[T12nn8, x]=multi_infoflow(norm, 1)
    %% 8os
j=1;
for  i=9:482
    
        rrf8(j,1)=a2{i,8};
        j=j+1;
    
end
rrf8=rrf1(9:481);
n8=n2(1:473); 
dt =1;
%n=table2array(n)
    dt = 1;
    T21(9) = causal_est(rrf8, n8, 1);
    T21(9)=T21(9)/dt;
    
    norm=[rrf8 n8];
[T12nn9, x]=multi_infoflow(norm, 1)

figure()
scatter(rrf8,n8)
title('8')
    %% 9os

j=1;
for  i=10:482
    
        rrf9(j,1)=a2{i,8};
        j=j+1;
    
end
rrf9=rrf1(10:481);
n9=n2(1:472); 
dt =1;
    T21(10) = causal_est(rrf9, n9, 1);
    T21(10)=T21(10)/dt;
    
    
    norm=[rrf9 n9];
[T12nn10, x]=multi_infoflow(norm, 1)
    %% 10os

j=1;
for  i=11:482
    
        rrf10(j,1)=a2{i,8};
        j=j+1;
    
end
rrf10=rrf1(11:481);
n10=n2(1:471);  

    dt = 1;
    T21(11) = causal_est(rrf10, n10, 1);
    T21(11)=T21(11)/dt;
    
    
    norm=[rrf10 n10];
[T12nn11, x]=multi_infoflow(norm, 1)
    %% 11os

j=1;
for  i=12:482
    
        rrf11(j,1)=a2{i,8};
        j=j+1;
    
end
rrf11=rrf1(12:481);
n11=n2(1:470); 

    dt = 1;
    T21(12) = causal_est(rrf11, n11, 1);
    T21(12)=T21(12)/dt;
    
    
    norm=[rrf11 n11];
[T12nn12, x]=multi_infoflow(norm, 1)
    
%% 12os

j=1;
for  i=13:482
    
        rrf12(j,1)=a2{i,8};
        j=j+1;
    
end

rrf12=rrf1(13:481);
n12=n2(1:469); 
    dt = 1;
    T21(13) = causal_est(rrf12, n12, 1);
    T21(13)=T21(13)/dt;
    figure()
histogram(a2{:,8})
title('Ιστόγραμμα μηνιαίας βροχόπτωση στην Ρόδο για τα χρόνια 1980-2020')

norm=[rrf12 n12];
[T12nn13,x]=multi_infoflow(norm, 1)
%% periodogram
cl = 0.95; % Confidence level
fs = 1; % Sampling frequency
Nfft = 256; % No. FFT points
rf= rrf1 - mean(rrf1);
window = hamming(length(rrf1));
[pxx,f,pxxc]=periodogram(rf,window, Nfft ,fs,'ConfidenceLevel', cl);
pxxdb = 10*log10(pxx);
pxxcdb = 10*log10(pxxc);
figure()
grid on;
axis tight;
set(gca, 'FontSize', 14);
plot(f, pxxdb ,'b-','LineWidth',2);
hold on;
grid on;
axis tight;
set(gca, 'FontSize', 14);
plot(f,pxxcdb ,'r-.');
axis tight; 
xlabel('1/μήνα');
title('Περιοδόγραμμα βροχόπτωσης Ρόδου')

%% 
figure()
grid on;
axis tight;
set(gca, 'FontSize', 14);
fitmethis(n2)
title('Πρότυπο βέλτιστης συνάρτησης κατανομής για το ΝΑΟ')
xlabel('Δεδομένα')
ylabel('Συνάρτηση πυκνότητας πιθανότητας')
legend('Δεδομένα ΝΑΟ','Κανονική')


%% periodogram of nao
cl = 0.95; % Confidence level
fs = 1; % Sampling frequency
Nfft = 256; % No. FFT points
n= n2 - mean(n2);
window = hamming(length(n2));
[pxx,f,pxxc]=periodogram(n,window, Nfft ,fs,'ConfidenceLevel', cl);
pxxdb = 10*log10(pxx);
pxxcdb = 10*log10(pxxc);
figure()
grid on;
axis tight;
set(gca, 'FontSize', 14);
plot(f, pxxdb ,'b-','LineWidth',2);
hold on;
grid on;
axis tight;
set(gca, 'FontSize', 14);
plot(f,pxxcdb ,'r-.');
axis tight; 
xlabel('1/μήνα');
title('Περιοδόγραμμα ΝΑΟ')
%% scatter


figure()
scatter(rrf7,n7)
title('Διάγραμμα διασποράς ΝΑΟ, βροχόπτωσης με 7 μήνες καθυστέρηση')

figure()
scatter(rrf11,n11)
title('Διάγραμμα διασποράς ΝΑΟ, βροχόπτωσης με 11 μήνες καθυστέρηση')
% %% log rf hist
% rflog(:,1)=log(rrf1(:,1))
% figure()
% fitmethis(rflog)
% 
% figure()
% fitmethis(rrf1)
% xlabel('Δεδομένα')
% ylabel('Συνάρτηση πυκνότητας πιθανότητας')
% title('Οι τιμές βροχόπτωσης Ρόδου με την κατανομή που ταιριάζει περισσότερο')
% legend('Δεδομένα βροχόπτωσης', 'Nakagami')
%%
figure()
histogram(n2)
xticks([-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7])
title('Ιστόγραμμα του ΝΑΟ για την περίοδο 1980-2020')
xlabel('Τιμές ΝΑΟ')
ylabel('Συχνότητα εμφάνισης')
n2=n2(1:481);
% grid on;
% axis tight;
% set(gca, 'FontSize', 14);
%% rf-0
x=0;
for  i=1:482
    
        rf1(i,1)=a2{i,8};
        if rf1(i,1)<2
            rf1(i,1)=0;
                    x=x+1;

        end
        
end
pos=x/(length(rf1))
rf1(rf1==0) = [];
figure()
grid on;
axis tight;
set(gca, 'FontSize', 14);
x=fitmethis(rf1)
xlabel('Δεδομένα')
ylabel('Συνάρτηση πυκνότητας πιθανότητας')
title({['Βέλτιστο πρότυπο συνάρτησης κατανομής']
       ['για τη βροχόπτωση στη Ρόδο']})
legend('Δεδομένα βροχόπτωσης', 'γενικευμένη κατανομή Pareto')




%% perm
 %% for 0 month
for i=1:1000
    rrf0p=rrf1(randperm(numel(rrf1)));
    norm0=[rrf0p n2];
    [t21_p,x]=multi_infoflow(norm0,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')

%% for 1 month
for i=1:1000
    rrf1p=rrf1(randperm(numel(rrf1)));
    norm1=[rrf1p n2];
    [t21_p,x]=multi_infoflow(norm1,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 1 μήνα.')

%% for 2 month
for i=1:1000
    rrf2p=rrf2(randperm(numel(rrf2)));
    norm2=[rrf2p n21];
    [t21_p,x]=multi_infoflow(norm2,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 2 μήνες.')

%% for 3 month
for i=1:1000
    rrf3p=rrf3(randperm(numel(rrf3)));
    norm3=[rrf3p n3];
    [t21_p,x]=multi_infoflow(norm3,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 3 μήνες.')

%% for 4 month
for i=1:1000
    rrf4p=rrf4(randperm(numel(rrf4)));
    norm4=[rrf4p n4];
    [t21_p,x]=multi_infoflow(norm4,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 4 μήνες.')

%% for 5 month
for i=1:1000
    rrf5p=rrf5(randperm(numel(rrf5)));
    norm5=[rrf5p n5];
    [t21_p,x]=multi_infoflow(norm5,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 5 μήνες.')

%% for 6 month
for i=1:1000
    rrf6p=rrf6(randperm(numel(rrf6)));
    norm6=[rrf6p n6];
    [t21_p,x]=multi_infoflow(norm6,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 6 μήνες.')

%% for 7 month
for i=1:1000
    rrf7p=rrf7(randperm(numel(rrf7)));
    norm7=[rrf7p n7];
    [t21_p,x]=multi_infoflow(norm7,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 7 μήνες.')

%% for 8 month
for i=1:1000
    rrf8p=rrf8(randperm(numel(rrf8)));
    norm8=[rrf8p n8];
    [t21_p,x]=multi_infoflow(norm8,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 8 μήνες.')

%% for 9 month
for i=1:1000
    rrf9p=rrf9(randperm(numel(rrf9)));
    norm9=[rrf9p n9];
    [t21_p,x]=multi_infoflow(norm9,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 9 μήνες.')

%% for 10 month
for i=1:1000
    rrf10p=rrf10(randperm(numel(rrf10)));
    norm10=[rrf10p n10];
    [t21_p,x]=multi_infoflow(norm10,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 10 μήνες.')

%% for 11 month
for i=1:1000
    rrf11p=rrf11(randperm(numel(rrf11)));
    norm11=[rrf11p n11];
    [t21_p,x]=multi_infoflow(norm11,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 11 μήνες.')

%% for 12 month
for i=1:1000
    rrf12p=rrf12(randperm(numel(rrf12)));
    norm12=[rrf12p n12];
    [t21_p,x]=multi_infoflow(norm12,1)
    t21_per(i)=t21_p(1,2)
end 
figure;
h21=histogram(t21_per)
title('Κανονικοποιημένο Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 12 μήνες καθυστέρησης.')
%% unormalised-perm
%% for 12 month
for i=1:1000
    n2p=n2(randperm(numel(n2)));
    t21_un_per(i)=causal_est(n2p,rrf1,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης χωρίς καθυστέρηση.')



for i=1:1000
    n2p=n2(randperm(numel(n2)));
    t21_un_per(i)=causal_est(n2p,rrf1,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 1 μήνα καθυστέρησης.')


for i=1:1000
    n21p=n21(randperm(numel(n21)));
    t21_un_per(i)=causal_est(n21p,rrf2,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 2 μήνες καθυστέρησης.')


for i=1:1000
    n3p=n3(randperm(numel(n3)));
    t21_un_per(i)=causal_est(n3p,rrf3,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 3 μήνες καθυστέρησης.')


for i=1:1000
    n4p=n4(randperm(numel(n4)));
    t21_un_per(i)=causal_est(n4p,rrf4,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 4 μήνες καθυστέρησης.')

for i=1:1000
    n5p=n5(randperm(numel(n5)));
    t21_un_per(i)=causal_est(n5p,rrf5,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 5 μήνες καθυστέρησης.')

for i=1:1000
    n6p=n6(randperm(numel(n6)));
    t21_un_per(i)=causal_est(n6p,rrf6,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 6 μήνες καθυστέρησης.')

for i=1:1000
    n7p=n7(randperm(numel(n7)));
    t21_un_per(i)=causal_est(n7p,rrf7,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 7 μήνες καθυστέρησης.')

for i=1:1000
    n8p=n8(randperm(numel(n8)));
    t21_un_per(i)=causal_est(n8p,rrf8,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 8 μήνες καθυστέρησης.')

for i=1:1000
    n9p=n9(randperm(numel(n9)));
    t21_un_per(i)=causal_est(n9p,rrf9,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 9 μήνες καθυστέρησης.')

for i=1:1000
    n10p=n10(randperm(numel(n10)));
    t21_un_per(i)=causal_est(n10p,rrf10,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 10 μήνες καθυστέρησης.')

for i=1:1000
    n11p=n11(randperm(numel(n11)));
    t21_un_per(i)=causal_est(n11p,rrf11,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 11 μήνες καθυστέρησης.')

for i=1:1000
    n12p=n12(randperm(numel(n12)));
    t21_un_per(i)=causal_est(n12p,rrf12,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 12 μήνες καθυστέρησης.')



