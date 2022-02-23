load ier11.mat
y=datetime(1980,1,1):calmonths(1):datetime(2020,12,1);
figure;
rf1=ier1(:,8)
rf1=table2array(rf1)
plot(y,rf1)
title('Μηνιαία βροχόπτωση Ιεράπετρας από 1980 έως 2020.')
xtickformat('MMMyy')
ax = gca;
ax.XTickLabelRotation = 90;

%%

for i=1:41
    for j=2:13
        n(k,1)=n1{i,j}
        k=k+1;
    end
end


%% xoris olisthisi
for  i=1:482
    
        rrf1(i,1)=ier1{i,8};
        
end
n1=n(1:482);
rrf1=rrf1(1:482);
%% log
for  i=1:482
    
        logrf(i,1)=log(rrf1(i,1))
        
end

figure()
fitmethis(logrf)
%%
dt = 1;
T21n = causal_est(rrf1, n1, 1);
T21n=T21n/dt;
figure()
autocorr(rrf1(:,1))
xlabel('Μήνες')
ylabel('Αυτοσυσχέτιση')
title('Συνάρτηση αυτοσυσχέτισης βροχόπτωσης Ιεράπετρας')
figure()
autocorr(n)
figure()
f=fitmethis(rrf1);

norm=[n1 rrf1];
[T12nn0,x]=multi_infoflow(norm, 1);


figure()
histogram(rrf1)
title('Ιστόγραμμα μηνιαίας βροχόπτωσης Ιεράπετρας')
xlabel('Τιμές βροχόπτωσης')
ylabel('Συχνότητα εμφάνισης')

%% 1os

j=1;
for  i=2:482
    
        rrf1(j,1)=ier1{i,8};
        j=j+1;
    
end
dt =1;
n2=n(1:481)

%n=table2array(n)
    dt = 1;
    T21(1) = causal_est(rrf1, n1, 1);
    T21(1)=T21(1)/dt;

    norm=[rrf1 n1];
[T12nn1,x]=multi_infoflow(norm, 1);

%% 2os

j=1;
for  i=3:482
    
        rrf2(j,1)=ier1{i,8};
        j=j+1;
    
end
n2=n(1:480)
rrf2=rrf2(1:480)
dt =1;
    dt = 1;
     T21(2) = causal_est(rrf2, n2, 1);
    T21(2)=T21(2)/dt;

    norm=[rrf2 n2];
[T12nn2,x]=multi_infoflow(norm, 1);

%% 3os

j=1;
for  i=4:482
    
        rrf3(j,1)=ier1{i,8};
        j=j+1;
    
end
n3=n(1:479)
rrf3=rrf3(1:479)

dt =1;
    dt = 1;
    T21(3) = causal_est(rrf3, n3, 1);
    T21(3)=T21(3)/dt;
    
    norm=[rrf3 n3];
[T12nn3,x]=multi_infoflow(norm, 1);

%% 4os

j=1;
for  i=5:482
    
        rrf4(j,1)=ier1{i,8};
        j=j+1;
    
end
n4=n(1:478)
rrf4=rrf4(1:478)
dt =1;
    dt = 1;
    T21(4) = causal_est(rrf4, n4, 1);
    T21(4)=T21(4)/dt;
    
    norm=[rrf4 n4];
[T12nn4,x]=multi_infoflow(norm, 1);

%% 5os

j=1;
for  i=6:482
    
        rrf5(j,1)=ier1{i,8};
        j=j+1;
    
end
n5=n(1:477)
rrf5=rrf5(1:477)
    dt = 1;
    T21(5) = causal_est(rrf5, n5, 1);
    T21(5)=T21(5)/dt;
    
    norm=[rrf5 n5];
[T12nn5,x]=multi_infoflow(norm, 1);

   %% 6os

j=1;
for  i=7:482
    
        rrf6(j,1)=ier1{i,8};
        j=j+1;
    
end
n6=n(1:476)
rrf6=rrf6(1:476)
    dt = 1;
    T21(6) = causal_est(rrf6, n6, 1);
    T21(6)=T21(6)/dt;
    
    norm=[rrf6 n6];
[T12nn6,x]=multi_infoflow(norm, 1);


figure()
scatter(rrf6,n6)

title('Διάγραμμα διασποράς βροχόπτωσης Ιεράπετρας ολισθημένης κατά 6 μήνες με ΝΑΟ')
xlabel('Τιμές βροχόπτωσης')
    %% 7os

j=1;
for  i=8:482
    
        rrf7(j,1)=ier1{i,8};
        j=j+1;
    
end
n7=n(1:475)
rrf7=rrf7(1:475)
    dt = 1;
    T21(7) = causal_est(rrf7, n7, 1);
    T21(7)=T21(7)/dt;
    
    norm=[rrf7 n7];
[T12nn7,x]=multi_infoflow(norm, 1);

    %% 8os
j=1;
for  i=9:482
    
        rrf8(j,1)=ier1{i,8};
        j=j+1;
    
end
n8=n(1:474)

dt =1;
%n=table2array(n)
    dt = 1;
    T21(8) = causal_est(rrf8, n8, 1);
    T21(8)=T21(8)/dt;
    
    norm=[rrf8 n8];
[T12nn8,x]=multi_infoflow(norm, 1);

    %% 9os

j=1;
for  i=10:482
    
        rrf9(j,1)=ier1{i,8};
        j=j+1;
    
end
n9=n(1:473)

dt =1;
    T21(9) = causal_est(rrf9, n9, 1);
    T21(9)=T21(9)/dt;
    
    
    norm=[rrf9 n9];
[T12nn9,x]=multi_infoflow(norm, 1);

    %% 10os

j=1;
for  i=11:482
    
        rrf10(j,1)=ier1{i,8};
        j=j+1;
    
end
n10=n(1:472)
dt =1;
    dt = 1;
    T21(10) = causal_est(rrf10, n10, 1);
    T21(10)=T21(10)/dt;
    
    
    norm=[rrf10 n10];
[T12nn10,x]=multi_infoflow(norm, 1);

    %% 11os

j=1;
for  i=12:482
    
        rrf11(j,1)=ier1{i,8};
        j=j+1;
    
end
n11=n(1:471)
dt = 1;
T21(11) = causal_est(rrf11, n11, 1);
T21(11)=T21(11)/dt;
    
 norm=[rrf11 n11];
[T12nn11,x]=multi_infoflow(norm, 1);

%% 12os

j=1;
for  i=13:482
    
        rrf12(j,1)=ier1{i,8};
        j=j+1;
    
end

n12=n(1:470)
    dt = 1;
    T21(12) = causal_est(rrf12, n12, 1);
    T21(12)=T21(12)/dt;
    figure()
    histogram(ier1{:,8})
    title('Ιστόγραμμα μηνιαίας βροχόπτωση στην Ιεράπετρα για τα χρόνια 1980-2020')
    
    norm=[rrf12 n12];
[T12nn12,x]=multi_infoflow(norm, 1);

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
plot(f, pxxdb ,'b-','LineWidth', 2);
hold on;
plot(f,pxxcdb ,'r-.');
axis tight; 
xlabel('1/μήνα');
title('Περιοδόγραμμα βροχόπτωσης Ιεράπετρα με 95% βαθμό εμπιστοσύνης')

%% cr cov
T= 1:1:length(n1);
y=cov1d_cross(rrf1,n1,T);
plot(y.laga, y.rho);
xlabel('Μήνες')
ylabel('\rho_{RAIN,NAO}')
title('Ετεροσυσχέτιση βροχόπτωσης, ΝΑΟ Ιεράπετρας')
axis tight;
grid on;
xlim([-20 20]);
%% rf-0
x=0;
for  i=1:481
    
        rf1(i,1)=ier11{i,8};
        if rf1(i,1)<2
            rf1(i,1)=0;
                    x=x+1;

        end
        
end
pos=x/(length(rf1))
rf1(rf1==0) = [];
figure()
fitmethis(rf1)
xlabel('Δεδομένα')
ylabel('Συνάρτηση πυκνότητας πιθανότητας')
title('Οι τιμές βροχόπτωσης Ιεράπετρας με την κατανομή που ταιριάζει περισσότερο')
%legend('Δεδομένα βροχόπτωσης', 'γενικευμένη κατανομή Pareto')



%% perm

%% for 1 month
for i=1:1000
    rrf1p=rrf1(randperm(numel(rrf1)));
    norm1=[rrf1p n1];
    [t21_p,x]=multi_infoflow(norm1,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 1 μήνα.')

%% for 2 month
for i=1:1000
    rrf2p=rrf2(randperm(numel(rrf2)));
    norm2=[rrf2p n2];
    [t21_p,x]=multi_infoflow(norm2,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 2 μήνες.')

%% for 3 month
for i=1:1000
    rrf3p=rrf3(randperm(numel(rrf3)));
    norm3=[rrf3p n3];
    [t21_p,x]=multi_infoflow(norm3,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 3 μήνες.')

%% for 4 month
for i=1:1000
    rrf4p=rrf4(randperm(numel(rrf4)));
    norm4=[rrf4p n4];
    [t21_p,x]=multi_infoflow(norm4,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 4 μήνες.')

%% for 5 month
for i=1:1000
    rrf5p=rrf5(randperm(numel(rrf5)));
    norm5=[rrf5p n5];
    [t21_p,x]=multi_infoflow(norm5,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 5 μήνες.')

%% for 6 month
for i=1:1000
    rrf6p=rrf6(randperm(numel(rrf6)));
    norm6=[rrf6p n6];
    [t21_p,x]=multi_infoflow(norm6,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 6 μήνες.')

%% for 7 month
for i=1:1000
    rrf7p=rrf7(randperm(numel(rrf7)));
    norm7=[rrf7p n7];
    [t21_p,x]=multi_infoflow(norm7,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 7 μήνες.')

%% for 8 month
for i=1:1000
    rrf8p=rrf8(randperm(numel(rrf8)));
    norm8=[rrf8p n8];
    [t21_p,x]=multi_infoflow(norm8,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 8 μήνες.')

%% for 9 month
for i=1:1000
    rrf9p=rrf9(randperm(numel(rrf9)));
    norm9=[rrf9p n9];
    [t21_p,x]=multi_infoflow(norm9,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 9 μήνες.')

%% for 10 month
for i=1:1000
    rrf10p=rrf10(randperm(numel(rrf10)));
    norm10=[rrf10p n10];
    [t21_p,x]=multi_infoflow(norm10,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 10 μήνες.')

%% for 11 month
for i=1:1000
    rrf11p=rrf11(randperm(numel(rrf11)));
    norm11=[rrf11p n11];
    [t21_p,x]=multi_infoflow(norm11,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 11 μήνες.')

    %% for 12 month
for i=1:1000
    rrf12p=rrf12(randperm(numel(rrf12)));
    norm12=[rrf12p n12];
    [t21_p,x]=multi_infoflow(norm12,1)
    t21_per(i)=t21_p(2,1)
end 
figure;
h21=histogram(t21_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στη χρονοσειρά της βροχόπτωσης για 12 μήνες καθυστέρησης.')



%% unormalised-perm
%% for 12 month
for i=1:1000
    rrf1p=rrf1(randperm(numel(rrf1)));
    t21_un_per(i)=causal_est(rrf1p,n1,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης χωρίς καθυστέρηση.')



for i=1:1000
    rrf1p=rrf1(randperm(numel(rrf1)));
    t21_un_per(i)=causal_est(rrf1p,n1,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 1 μήνα καθυστέρησης.')


for i=1:1000
    rrf1p=rrf2(randperm(numel(rrf2)));
    t21_un_per(i)=causal_est(rrf1p,n2,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 2 μήνες καθυστέρησης.')


for i=1:1000
    rrf1p=rrf3(randperm(numel(rrf3)));
    t21_un_per(i)=causal_est(rrf1p,n3,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 3 μήνες καθυστέρησης.')


for i=1:1000
    rrf1p=rrf4(randperm(numel(rrf4)));
    t21_un_per(i)=causal_est(rrf1p,n4,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 4 μήνες καθυστέρησης.')

for i=1:1000
    rrf1p=rrf5(randperm(numel(rrf5)));
    t21_un_per(i)=causal_est(rrf1p,n5,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 5 μήνες καθυστέρησης.')

for i=1:1000
    rrf1p=rrf6(randperm(numel(rrf6)));
    t21_un_per(i)=causal_est(rrf1p,n6,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 6 μήνες καθυστέρησης.')

for i=1:1000
    rrf1p=rrf7(randperm(numel(rrf7)));
    t21_un_per(i)=causal_est(rrf1p,n7,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 7 μήνες καθυστέρησης.')

for i=1:1000
    rrf8p=rrf8(randperm(numel(rrf8)));
    t21_un_per(i)=causal_est(rrf8p,n8,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 8 μήνες καθυστέρησης.')

for i=1:1000
    rrf9p=rrf9(randperm(numel(rrf9)));
    t21_un_per(i)=causal_est(rrf9p,n9,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 9 μήνες καθυστέρησης.')

for i=1:1000
    rrf10p=rrf10(randperm(numel(rrf10)));
    t21_un_per(i)=causal_est(rrf10p,n10,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 10 μήνες καθυστέρησης.')

for i=1:1000
    rrf11p=rrf11(randperm(numel(rrf11)));
    t21_un_per(i)=causal_est(rrf11p,n11,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 11 μήνες καθυστέρησης.')

for i=1:1000
    rrf12p=rrf12(randperm(numel(rrf12)));
    t21_un_per(i)=causal_est(rrf12p,n12,1)
end 
figure;
h21=histogram(t21_un_per)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης για 12 μήνες καθυστέρησης.')
