% IBIZA
load n
kyp=readtable('kyp.csv')
save kyp kyp
for i=1:339
  kyprf(i,1)=kyp(i,8);
end
kyprf=table2array(kyprf)
n=table2array(n)

dt =1;
T21kyprf = causal_est(kyprf, n, 1);
T21kyprf=T21kyprf/dt
sprintf('%16.f',2332456943534324)

sprintf('%16.f',2332456943534324)
T12kyprf = causal_est(n, kyprf, 1);
T12kyprf=T12kyprf/dt
sprintf('%16.f',2332456943534324)

for i=1:1000
    kyprfper=kyprf(randperm(numel(kyprf)));
    t21_p(i)=causal_est(kyprfper,n,1)
    t12_p(i) = causal_est(n, kyprfper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->βροχόπτωση στην Kypro με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας βροχόπτωση->ΝΑΟ στην Kypro με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')

kyprf=kyprf(:)
n=n(:,2)
ierrfcof=corrcoef(kyprf,n)

% temperature-nao
for i=1:339
   tempkyp(i,1)=kyp{i,3};
end
    dt =1;
    T21tempkyp= causal_est(tempkyp, n, 1);
    T21tempkyp=T21tempkyp/dt
    sprintf('%16.f',2332456943534324)
    T12tempkyp = causal_est(n, tempkyp, 1);
    T12tempkyp=T12tempkyp/dt
    sprintf('%16.f',2332456943534324)
    
    for i=1:1000
    tempkypper=tempkyp(randperm(numel(tempkyp)));
    t21_p(i)=causal_est(tempkypper,n,1)
    t12_p(i) = causal_est(n, tempkypper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->θερμοκρασία στην Ibiza με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας θερμοκρασία->ΝΑΟ στην Ibiza με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')

% humidity-nao
for i=1:339
    humkyp(i,1)=kyp{i,4};
end
    dt =1;
    T21hkyp = causal_est(humkyp, n, 1);
    T21hkyp=T21hkyp/dt
    sprintf('%16.f',2332456943534324)
    T12hkyp = causal_est(n, humkyp, 1);
    T12hkyp=T12hkyp/dt
    sprintf('%16.f',2332456943534324)
      
 for i=1:1000
    humkypper=humkyp(randperm(numel(humkyp)));
    t21_p(i)=causal_est(humkypper,n,1)
    t12_p(i) = causal_est(n, humkypper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας υγρασία->ΝΑΟ στην Kypro με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ΝΑΟ->υγρασία στην Kypro με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
kyprf=array2table(kyprf)


% windspeed-nao
for i=1:339
   wskyp(i,1)=kyp{i,3};
end
    dt =1;
    T21wskyp= causal_est(wskyp, n, 1);
    T21wskyp=T21wskyp/dt
    sprintf('%16.f',2332456943534324)
    T12wskyp = causal_est(n, wskyp, 1);
    T12wskyp=T12wskyp/dt
    sprintf('%16.f',2332456943534324)
    
    for i=1:1000
    wsper=wskyp(randperm(numel(wskyp)));
    t21_p(i)=causal_est(wsper,n,1)
    t12_p(i) = causal_est(n, wsper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->ws στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ws->ΝΑΟ στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')

