
load sodamer.mat
load n

j=1;
for  i=8:339
    
        rrf(j,1)=a{i,8};
        j=j+1;
    
end

rrf=double(rrf)
plotmatrix(rrf)
n(333:end,:)=[];


%%



dt =1;
n=table2array(n)
    dt = 1;
    T21 = causal_est(rrf, n, 1);
    T21=T21/dt;
   
    
for i=1:1000
    rrfper=rrf(randperm(numel(rrf)));
    t21_p(i)=causal_est(rrfper,n,1)
end 
figure;
h21=histogram(t21_p)
title('Τ_{ΝΑΟ->βροχόπτωση} στην Ρόδο με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')
if ispc % Use Windows ghostscript call
  system('gswin64c -o -q -sDEVICE=png256 -dEPSCrop -r300 -oimprovedExample_eps.png improvedExample.eps');
else % Use Unix/OSX ghostscript call
  system('gs -o -q -sDEVICE=png256 -dEPSCrop -r300 -oimprovedExample_eps.png improvedExample.eps');
end
nao=n(:,2)
T=1:1:length(nao)
x=cov1d_cross(nao,rrf,T);
plot(x.tlag,x.covz(:,1),'r-');
legend('Ετεροσυνδιασπορά')
hold on;
plot(x.tlag,x.covz(:,2),'b--');
title('Η ετεροσυνδιασπορά με τις τιμές των καθυστερήσεων της βροχόπτωσης και του ΝΑΟ στην Ρόδο')
%% gia reflection ετεροsindiasporas

% gia lags
lags=x.tlag
N=110;
zlags=zeros(2*N-1,1);
zlags(N:2*N-1,1)=lags(1:N);
for I=1:N-1; zlags(I,1)=-lags(N-I+1,1); end

%gia c12
c12=x.covz(:,1)
c21=x.covz(:,2)
zc12=zeros(2*N-1,1);
zc12(N:2*N-1,1)=c12(1:N);
for i=1:N-1; zc12(i,1)=c21(N-i+1,1); end
figure()
plot(zlags, zc12)


%% samples
t=n(1:end,1)
%t=table2array(t)
dt = datetime(fix(t/100),rem(t,100), ones(size(t)), 'Format','MM/dd/yyyy');
n1=n(1:end,2)
%n1=table2array(n1)
figure()
plot(dt,n1)
yline(0)
title('Το μηνιαίο ΝΑΟ για τα χρόνια 1980 έως 2007')
hold on
dt1=dt(1:72)
%n=table2array(n)
n1=n(1:72,2)
figure()
plot(dt1,n1)
title('Το μηνιαίο ΝΑΟ για τα χρόνια 1980 έως 1985')

dt2=dt(73:144)
n2=n(73:144,2)
figure()
plot(dt2,n2)
title('Το μηνιαίο ΝΑΟ για τα χρόνια 1986 έως 1991')

dt3=dt(145:216)
n3=n(145:216,2)
figure()
plot(dt3,n3)
title('Το μηνιαίο ΝΑΟ για τα χρόνια 1992 έως 1997')

dt4=dt(217:288)
n4=n(217:288,2)
figure()
plot(dt4,n4)
title('Το μηνιαίο ΝΑΟ για τα χρόνια 1998 έως 2003')

dt5=dt(289:332)
n5=n(289:332,2)
figure()
plot(dt5,n5)
title('Το μηνιαίο ΝΑΟ για τα χρόνια 2004 έως 2007')

%% periodogram for nao
naof= nao - mean(nao);
cl = 0.95; % Confidence level
fs = 1; % Sampling frequency
Nfft = 256; % No. FFT points

% Define window function
window = hamming(length(nao));
[pxx,f,pxxc]=periodogram(naof,window, Nfft ,fs,'ConfidenceLevel', cl);
pxxdb = 10*log10(pxx);
pxxcdb = 10*log10(pxxc);

plot(f,pxxdb ,'b-','LineWidth',2);
hold on;
plot(f,pxxcdb ,'r-.');
axis tight; 
xlabel('1/μήνας');
ylabel('Power (dB)');
title('Περιοδόγραμμα του ΝΑΟ με 95% βαθμό εμπιστοσύνης');
grid on; 
set(gca,'FontSize' ,14);
%80-85
nao1f= n1 - mean(n1);

window1 = hamming(length(n1));
[pxx1,f1,pxxc1]=periodogram(nao1f,window1, Nfft ,fs,'ConfidenceLevel', cl);

pxxdb1 = 10*log10(pxx1);
pxxcdb1 = 10*log10(pxxc1);
figure()
plot(f1,pxxdb1 ,'b-','LineWidth',2);
hold on;
plot(f1,pxxcdb1 ,'r-.');
axis tight; 
xlabel('Hz');
ylabel('Power (dB)');
title('Περιοδόγραμμα του ΝΑΟ τα χρόνια 1980-1985 με 95% βαθμό εμπιστοσύνης');
grid on; 
set(gca,'FontSize' ,14);

% 86-91
nao2f= n2 - mean(n2);
window2 = hamming(length(n2));
[pxx2,f2,pxxc2]=periodogram(nao2f,window2, Nfft ,fs,'ConfidenceLevel', cl);
pxxdb2 = 10*log10(pxx2);
pxxcdb2 = 10*log10(pxxc2);
figure()
plot(f2,pxxdb2 ,'b-','LineWidth',2);
hold on;
plot(f2,pxxcdb2 ,'r-.');
axis tight; 
xlabel('Hz');
ylabel('Power (dB)');
title('Περιοδόγραμμα του ΝΑΟ τα χρόνια 1986-1990 με 95% βαθμό εμπιστοσύνης');
grid on; 
set(gca,'FontSize' ,14);

%92-97
nao3f= n3 - mean(n3);
window3 = hamming(length(n3));
[pxx3,f3,pxxc3]=periodogram(nao3f,window3, Nfft ,fs,'ConfidenceLevel', cl);
pxxdb3 = 10*log10(pxx3);
pxxcdb3 = 10*log10(pxxc3);
figure()
plot(f3,pxxdb3 ,'b-','LineWidth',2);
hold on;
plot(f3,pxxcdb3 ,'r-.');
axis tight; 
xlabel('Hz');
ylabel('Power (dB)');
title('Περιοδόγραμμα του ΝΑΟ τα χρόνια 1992-1997 με 95% βαθμό εμπιστοσύνης');
grid on; 
set(gca,'FontSize' ,14);

%  98-03
nao4f= n4 - mean(n4);
window4 = hamming(length(n4));
[pxx4,f4,pxxc4]=periodogram(nao4f,window4, Nfft ,fs,'ConfidenceLevel', cl);
pxxdb4 = 10*log10(pxx4);
pxxcdb4 = 10*log10(pxxc4);
figure()
plot(f4,pxxdb4 ,'b-','LineWidth',2);
hold on;
plot(f4,pxxcdb4 ,'r-.');
axis tight; 
xlabel('Hz');
ylabel('Power (dB)');
title('Περιοδόγραμμα του ΝΑΟ τα χρόνια 1998-2003 με 95% βαθμό εμπιστοσύνης');
grid on; 
set(gca,'FontSize' ,14);

% 04-07
nao5f= n5 - mean(n5);
window5 = hamming(length(n5));
[pxx5,f5,pxxc5]=periodogram(nao5f,window5, Nfft ,fs,'ConfidenceLevel', cl);
pxxdb5 = 10*log10(pxx5);
pxxcdb5 = 10*log10(pxxc5);
figure()
plot(f5, pxxdb5 ,'b-','LineWidth',2);
hold on;
plot(f5,pxxcdb5 ,'r-.');
axis tight; 
xlabel('Hz');
ylabel('Power (dB)');
title('Περιοδόγραμμα του ΝΑΟ τα χρόνια 2003-2007 με 95% βαθμό εμπιστοσύνης');
grid on; 
set(gca,'FontSize' ,14);