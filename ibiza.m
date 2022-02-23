% IBIZA
load n
ib=readtable('ib.csv')
save ib ib
for i=1:339
  ibrf(i,1)=ib(i,8);
end
ibrf=table2array(ibrf)
n=table2array(n)

dt =1;
T21ibrf = causal_est(ibrf, n, 1);
T21ibrf=T21ibrf/dt
sprintf('%16.f',2332456943534324)

sprintf('%16.f',2332456943534324)
T12ibrf = causal_est(n, ibrf, 1);
T12ibrf=T12ibrf/dt
sprintf('%16.f',2332456943534324)

for i=1:1000
    ibrfper=ibrf(randperm(numel(ibrf)));
    t21_p(i)=causal_est(ibrfper,n,1)
    t12_p(i) = causal_est(n, ibrfper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->βροχόπτωση στην Ibiza με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας βροχόπτωση->ΝΑΟ στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')

ibrf=ibrf(:)
n=n(:,2)
ierrfcof=corrcoef(ibrf,n)

% temperature-nao
for i=1:339
   tempib(i,1)=ib{i,3};
end
    dt =1;
    T21tempib= causal_est(tempib, n, 1);
    T21tempib=T21tempib/dt
    sprintf('%16.f',2332456943534324)
    T12tempib = causal_est(n, tempib, 1);
    T12tempib=T12tempib/dt
    sprintf('%16.f',2332456943534324)
    
    for i=1:1000
    tempibper=tempib(randperm(numel(tempib)));
    t21_p(i)=causal_est(tempibper,n,1)
    t12_p(i) = causal_est(n, tempibper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->θερμοκρασία στην Ibiza με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας θερμοκρασία->ΝΑΟ στην Ibiza με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')

% humidity-nao
for i=1:339
    humib(i,1)=ib{i,4};
end
    dt =1;
    T21hib = causal_est(humib, n, 1);
    T21hib=T21hib/dt
    sprintf('%16.f',2332456943534324)
    T12hib = causal_est(n, humib, 1);
    T12hib=T12hib/dt
    sprintf('%16.f',2332456943534324)
      
 for i=1:1000
    humibper=humib(randperm(numel(humib)));
    t21_p(i)=causal_est(humibper,n,1)
    t12_p(i) = causal_est(n, humibper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας υγρασία->ΝΑΟ στην Ibiza με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ΝΑΟ->υγρασία στην Ibiza με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
ibrf=array2table(ibrf)


% windspeed-nao
for i=1:339
   wsib(i,1)=ib{i,3};
end
    dt =1;
    T21wsib= causal_est(wsib, n, 1);
    T21wsib=T21wsib/dt
    sprintf('%16.f',2332456943534324)
    T12wsib = causal_est(n, wsib, 1);
    T12wsib=T12wsib/dt
    sprintf('%16.f',2332456943534324)
    
    for i=1:1000
    wsper=wsib(randperm(numel(wsib)));
    t21_p(i)=causal_est(wsper,n,1)
    t12_p(i) = causal_est(n, wsper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->ws στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ws->ΝΑΟ στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')

