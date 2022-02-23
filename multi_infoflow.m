function [Tij, ntij] = multi_infoflow(eeg, options)

%   Function multi_inflow calculates the multivariate information flow rate
%   and the normalized information flow rates for an ensemble of L time
%   series
%================ INPUT PARAMETERS ========================================
%   eeg:        Marix containing L times series of length N. It is assumed
%               that N > L.
%   options:    structure array containing optional parameters
%   opt.ord:    Order of differentiation (typically ord = 1 or 2)
%   opt.dt      Time step (assumed to be the same for all time series)     
%
%================ OUTPUT PARAMETERS =======================================
%   Tij:        L x L matrix of information flow rates
%   ntij:       L x L matrix of normalized information flow rates
%==========================================================================
%  Copyright (C) 2021  Dionisis Hristopulos
%   email: dchristopoulos@ece.tuc.gr
%
%  This program is free software; you can redistribute it and/or modify it
%  under the terms of the GNU General Public License as published by the
%  Free Software Foundation (version 2 of the License or  later version).
%
%  This program is distributed WITHOUT ANY WARRANTY.
%  See the GNU General Public License for more details.
%==========================================================================
%   Reference (Equation numbers below refer to this publication)
%   Liang, X.S. Normalized Multivariate Time Series Causality Analysis and 
%   Causal Graph Reconstruction. Entropy 2021, 23, 679. 
%   https://doi.org/10.3390/e23060679 

if nargin >1 && isfield(options,'ord')==1
    ord = options.ord;
else
    ord = 1;
end
if nargin >1 && isfield(options,'dt')==1
    dt = options.dt;
else
    dt = 1;
end

%   Number of components
L = min( size(eeg,1), size(eeg, 2));

%   Ensure that the input matrix has dimensions N x L and takes double
%   precision numbers
if size(eeg, 2) > size(eeg, 1)
    eeg = eeg';
end
eeg = double(eeg);

%   Initialize matrices
Tij = zeros(L, L);
ntij = zeros(L, L);
Cd = zeros(L, L);

%   Calculate the L x L covariance matrix
C = cov(eeg);
detC = det(C); 

%    Matrix of time series differences of order "ord"
Xd = diff( eeg, ord, 1 ) / dt; 

%   Cofactors of the covariance matrix
%   Covariance between derivatives and values
covfa = zeros(L,L);

%   Generalize Eq. (14) in Liang2021
for m=1: L
    for n = 1: L
        covfa(m,n) = cofactor(m, n, C);
        Cdmn = cov( eeg(1:end-1, m) , Xd(:,n) );
        Cd(m,n) = Cdmn(1,2);    % Cd(m,n) is the covariance C_{m,dn}
    end
end

mTij = covfa * Cd /detC ;

for m = 1: L
    for n =1 : L
        Tij(m,n)  = mTij(m,n) * C(n,m) / C(n,n) ;
    end
end
%==========================================================================
%   Here starts the calculation of normalized information flow rates
%==========================================================================
Cdndn = cov(Xd);    % Covariance of the differences

self = zeros(L, 1);
interact = zeros(L, 1);
noise = zeros(L, 1);

hata = mTij'; 
for n =1 :L
    self(n) = abs( covfa(n, :) * Cd(:, n) );  % This is dH*_1/dt, Eq. (15)
    interact(n) = sum( abs(Tij(:,n)) ) - abs(Tij(n,n)); 
    % This is Sum_{j\neq n} | T_{j \to n} |
    term3 = 0;
    for i1 = 1: L 
        for i2 = 1 : L
            term3 = term3 + hata(n,i1)*hata(n,i2)*C(i1,i2); % based on Eq. (10)
        end
    end
    gnn  = Cdndn(n,n) - 2 *hata(n,:) * Cd(:,n) + term3; % based on Eq. (10) and Q(N,1)---below Eq. (13)
    noise(n) =  gnn * dt / ( 2* C(n,n)) ;
    
end

%   Determine the normalization factor for each time series
self = self / detC;

Z = self + interact + noise;

%   Normalized information flow
for j = 1: L
    ntij(:, j) = Tij(:, j) / Z(j); 
end


