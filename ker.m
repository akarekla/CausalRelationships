% Κερκυρα
load n
ker =readtable('ker.csv')
save ker ker
for i=1:339
  kerrf(i,1)=ker(i,8);
end
kerrf=table2array(kerrf)
n=table2array(n)

dt =1;
T21kerrf = causal_est(kerrf, n, 1);
T21kerrf=T21kerrf/dt
sprintf('%16.f',2332456943534324)

sprintf('%16.f',2332456943534324)
T12kerrf = causal_est(n, kerrf, 1);
T12kerrf=T12kerrf/dt
sprintf('%16.f',2332456943534324)

for i=1:1000
    kerrfper=kerrf(randperm(numel(kerrf)));
    t21_p(i)=causal_est(kerrfper,n,1)
    t12_p(i) = causal_est(n, kerrfper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->βροχόπτωση στην Kerkyra με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας βροχόπτωση->ΝΑΟ στην Kerkyra με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')

kerrf=kerrf(:)
n=n(:,2)
ierrfcof=corrcoef(kerrf,n)

% temperature-nao
for i=1:339
   tempker(i,1)=ker{i,3};
end
    dt =1;
    T21tempker= causal_est(tempker, n, 1);
    T21tempker=T21tempker/dt
    sprintf('%16.f',2332456943534324)
    T12tempker = causal_est(n, tempker, 1);
    T12tempker=T12tempker/dt
    sprintf('%16.f',2332456943534324)
    
    for i=1:1000
    tempkerper=tempker(randperm(numel(tempker)));
    t21_p(i)=causal_est(tempkerper,n,1)
    t12_p(i) = causal_est(n, tempkerper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->θερμοκρασία στην Kerkyra με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας θερμοκρασία->ΝΑΟ στην Kerkyra με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')

% humidity-nao
for i=1:339
    humker(i,1)=ker{i,4};
end
    dt =1;
    T21hker = causal_est(humker, n, 1);
    T21hker=T21hker/dt
    sprintf('%16.f',2332456943534324)
    T12hker = causal_est(n, humker, 1);
    T12hker=T12hker/dt
    sprintf('%16.f',2332456943534324)
      
 for i=1:1000
    humkerper=humker(randperm(numel(humker)));
    t21_p(i)=causal_est(humkerper,n,1)
    t12_p(i) = causal_est(n, humkerper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας υγρασία->ΝΑΟ στην Kerkyra με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ΝΑΟ->υγρασία στην Kerkyra με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
kerrf=array2table(kerrf)


% windspeed-nao
for i=1:339
   wsker(i,1)=ker{i,3};
end
    dt =1;
    T21wsker= causal_est(wsker, n, 1);
    T21wsker=T21wsker/dt
    sprintf('%16.f',2332456943534324)
    T12wsker = causal_est(n, wsker, 1);
    T12wsker=T12wsker/dt
    sprintf('%16.f',2332456943534324)
    
    for i=1:1000
    wskerper=wsker(randperm(numel(wsker)));
    t21_p(i)=causal_est(wskerper,n,1)
    t12_p(i) = causal_est(n, wskerper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->ws στην Kerkyra με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ws->ΝΑΟ στην Kerkyra με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')

