load fal
load n2
j=1;
for  i=9:339
    
        falrf(j,1)=fal{i,8};
        j=j+1;
    
end
falrf=double(falrf);
plotmatrix(falrf)
n(334:end,:)=[];
dt =1;
n=table2array(n);
T21falrf = causal_est(falrf, n, 1);
T21falrf=T21falrf/dt;


for i=1:1000
    falrfper=falrf(randperm(numel(falrf)));
    t21_p(i)=causal_est(falrfper,n,1);
end 
figure;
h21=histogram(t21_p)
title('Τ_{ΝΑΟ->βροχόπτωση} στα Φαλάσσαρνα με αναδιατάξεις στην χρονοσειρά της βροχόπτωσης.')

% falrf=falrf(:)
% n=n(:,2)
% falrfcof=corrcoef(falrf,n)

%% temperature-nao
load n
j=1;
n=table2array(n)
for  i=3:339
    
        falt(j,1)=fal{i,3};
        j=j+1;
    
end
falt=double(falt);
n(338:end,:)=[];
dt =1;
T21falt = causal_est(falt, n, 1);
T21falt=T21falt/dt;


for i=1:1000
    faltper=falt(randperm(numel(falt)));
    t21_p(i)=causal_est(faltper,n,1);
end 
figure;
h21=histogram(t21_p)
title('Τ_{ΝΑΟ->θερμοκρασια} στα Φαλάσσαρνα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')


%% humidity-nao
for i=1:339
    humf(i,1)=fal{i,4};
end
    dt =1;
    T21hf = causal_est(humf, n, 1);
    T21hf=T21hf/dt
    sprintf('%16.f',2332456943534324)
    T12hf = causal_est(n, humf, 1);
    T12hf=T12hf/dt
    sprintf('%16.f',2332456943534324)
      
 for i=1:1000
    humfper=humf(randperm(numel(humf)));
    t21_p(i)=causal_est(humfper,n,1)
    t12_p(i) = causal_est(n, humfper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας υγρασία->ΝΑΟ στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ΝΑΟ->υγρασία στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
falrf=array2table(falrf)


% windspeed-nao
for i=1:339
   wsf(i,1)=fal{i,3};
end
    dt =1;
    T21wsf= causal_est(wsf, n, 1);
    T21wsf=T21wsf/dt
    sprintf('%16.f',2332456943534324)
    T12wsf = causal_est(n, wsf, 1);
    T12wsf=T12wsf/dt
    sprintf('%16.f',2332456943534324)
    
    for i=1:1000
    wsper=wsf(randperm(numel(wsf)));
    t21_p(i)=causal_est(wsper,n,1)
    t12_p(i) = causal_est(n, wsper, 1);
end 
figure;
h21=histogram(t21_p)
title('Μεταφορά πληροφορίας ΝΑΟ->ws στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')
figure;
h12=histogram(t12_p)
title('Μεταφορά πληροφορίας ws->ΝΑΟ στην Ιεράπετρα με αναδιατάξεις στην χρονοσειρά της θερμοκρασίας.')

