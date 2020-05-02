x=xlsread('/Users/ishaasamyuktha/Desktop/FYP-EPILEPSY/Postinterictals/45.xlsx');
a= smoothdata(x,'movmean',4);
fs=256;
ts=1/fs;
t=(0:length(x)-1)*ts;
w0=0.1/256;
w1=40/256;
wn=[w0,w1];
[b,c]=butter(4,wn);
z=filter(b,c,a);
[thr,sorh,keepapp]= ddencmp('den','wv',z);
xd=wdencmp('gbl',z,'db6',6,thr,sorh,keepapp);

%delta
w0=0.1/256;
w1=3.5/256;
wn=[w0,w1];
[b,c]=butter(4,wn);
delta=filter(b,c,xd);

%theta
w0=3.5/256;
w1=8/256;
wn=[w0,w1];
[b,c]=butter(4,wn);
theta=filter(b,c,xd);


%alpha
w1=13/256;
wn=[w0,w1];
[b,c]=butter(4,wn);
alpha=filter(b,c,xd);

%beta
w0=13/256;
w1=30/256;
wn=[w0,w1];
[b,c]=butter(4,wn);
beta=filter(b,c,xd);

%gamma
w0=30/256;
w1=40/256;
wn=[w0,w1];
[b,c]=butter(4,wn);
gamma=filter(b,c,xd);

% Hjorth Parameters

L = [fe(delta), fe(theta),fe(alpha),fe(beta),fe(gamma)];

xlswrite('45.xlsx', L);

function [M] = fe(del)

% Activity
activity = var(del);
actd = activity;

   
% Mobility
mobility = std(diff(del))./std(del);
mobd = mobility;

    
   
% Complexity
complexity = std(diff(diff(del)))./std(diff(del))./mobility;
compd = complexity;


for i = 1:19
    xf = del(:,i);
    entropd(i)=wentropy(xf, 'shannon');
end
M = [actd, mobd, compd, entropd];
   
end





