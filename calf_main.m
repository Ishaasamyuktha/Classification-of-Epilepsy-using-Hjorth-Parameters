function [comp] = calf_main(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%Raw data
% x = a; %load('/Users/ishaasamyuktha/Desktop/FYP-EPILEPSY/seizure data/1.\17.txt');
% fs=256;
% ts=1/fs;
% t=(0:length(x)-1)*ts;

% % figure(1);
% subplot(311);
% plot(t,x);
% xlabel('frequency in Hz');
% ylabel('amplitude');
% title('Raw EEG');
% freq=0:(fs/length(x)):fs/2;
% 
% y=fft(x);
% subplot(3,1,2);
% plot(freq,abs(y(1:length(freq)))/385);
% xlabel('frequency in Hz');
% ylabel('amplitude');
% title('spectrum of EEG');
% xlim([0 50]);
% 
% subplot(3,1,3);
% periodogram(x);
% 
%% Bandpass filtering
% w0=0.01/256;
% w1=40/256;
% wn=[w0,w1];
% [b,c]=butter(4,wn,'bandpass');
% a=filter(b,c,x);

%  % SUB BAND FREQUENCIES
% %Delta
%     w0=0.5/64;
%     w1=4/64;
% wn=[w0,w1];
%     [b,c]=butter(2,wn,'bandpass');
% pass=filter(b,c,a);
% figure(2);
% subplot(3,1,1);
% plot(t,pass);
% title('DELTA');
% xlabel('time in sec');
% ylabel('amplitude');
% 
% %  Spectrum of Delta
% passdft=fft(pass);
% figure(2);
% subplot(3,1,2);
% plot(freq,abs(passdft(1:length(freq)))/385);
% xlabel('frequency in Hz');
% ylabel('amplitude');
% title('spectrum of Delta');
% xlim([0 50]);
% figure(2);
% subplot(3,1,3);
% periodogram(pass);
% 
% %% alpha
%     w0=8/64;
%     w1=13/64;
% wn=[w0,w1];
%     [b,c]=butter(2,wn,'bandpass');
% pass1=filter(b,c,a);
% figure(3);
% subplot(3,1,1);
% plot(t,pass1);
% title('ALPHA');
% xlabel('time in sec');
% ylabel('amplitude');
% 
% %  Spectrum of alpha
% passdft=fft(pass1);
% subplot(3,1,2);
% plot(freq,abs(passdft(1:length(freq)))/385);
% xlabel('frequency in Hz');
% ylabel('amplitude');
% title('spectrum of Alpha');
% xlim([0 50]);
% subplot(3,1,3);
% periodogram(pass1);
% 
% %% beta
%     w0=13/64;
%     w1=20/64;
% wn=[w0,w1];
%     [b,c]=butter(2,wn,'bandpass');
% pass2=filter(b,c,a);
% figure(4);
% subplot(3,1,1);
% plot(t,pass2);
% title('BETA');
% xlabel('time in sec');
% ylabel('amplitude');
% 
% %  Spectrum of beta
% passdft=fft(pass2);
% subplot(3,1,2);
% plot(freq,abs(passdft(1:length(freq)))/385);
% xlabel('frequency in Hz');
% ylabel('amplitude');
% title('spectrum of beta');
% xlim([0 50]);
% subplot(3,1,3);
% periodogram(pass2);
% 
% %% 
% 
% % theta
%     w0=4/64;
%     w1=8/64;
% wn=[w0,w1];
%     [b,c]=butter(2,wn,'bandpass');
% pass3=filter(b,c,a);
% figure(5);
% subplot(3,1,1);
% plot(t,pass3);
% title('THETA');
% xlabel('time in sec');
% ylabel('amplitude');
% 
% %  Spectrum of theta
% passdft=fft(pass3);
% subplot(3,1,2);
% plot(freq,abs(passdft(1:length(freq)))/385);
% xlabel('frequency in Hz');
% ylabel('amplitude');
% title('spectrum of Theta');
% xlim([0 50]);
% 
% subplot(3,1,3);
% periodogram(pass3);
% 
% %% Gamma
% w0=31/250;
% w1=64/250;
% wn=[w0,w1];
%  [b,c]=butter(2,wn,'Bandpass');
% pass4=filter(b,c,a);
% figure(6);
% subplot(3,1,1);
% plot(t,pass4);
% title('gamma');
% xlabel('time in sec');
% ylabel('amplitude');
% 
% % Spectrum of Gamma
% passdft=fft(pass4);
% subplot(3,1,2);
% plot(freq,abs(passdft(1:length(freq)))/385);
% xlabel('frequency in Hz');
% ylabel('amplitude');
% title('spectrum of gamma');
% xlim([0 50]);
% subplot(3,1,3);
% periodogram(pass4);
%% wavelet denoising
% a1= wdenoise(a,'Wavelet','db6');
%  POWER = (sum(a1.^2))/length(a1);
%   S=std(POWER);
%   disp(S);
%  PW = POWER;
%  sd= std(a1);
%  SD=sd;
%  S=std(POWER);
%%  Wavelet Decomposition
% waveletFunction = 'db6';
% [C,L] = wavedec(a1,6,waveletFunction);
% %% Calculating the coefficients vectors
% cD1 = detcoef(C,L,1); %NOISY
% cD2 = detcoef(C,L,2); %NOISY
% cD3 = detcoef(C,L,3); %GAMMA
% cD4 = detcoef(C,L,4); %BETA
% cD5 = detcoef(C,L,5); %ALPHA
% cD6 = detcoef(C,L,6); %THETA
% cA6 = appcoef(C,L,waveletFunction,6); %DELTA
% %%%% Calculation the Details Vectors
% D1 = wrcoef('d',C,L,waveletFunction,1); %NOISY
% D2 = wrcoef('d',C,L,waveletFunction,2); %NOISY
% D3 = wrcoef('d',C,L,waveletFunction,3); %GAMMA
% D4 = wrcoef('d',C,L,waveletFunction,4); %BETA
% D5 = wrcoef('d',C,L,waveletFunction,5); %ALPHA
% D6 = wrcoef('d',C,L,waveletFunction,6); %THETA
% A6 = wrcoef('a',C,L,waveletFunction,6); %DELTA
% %% Power Calculation
% POWER_DELTA = (sum(A6.^2))/length(A6);
% PD = POWER_DELTA;
% disp('power of delta');
% disp(POWER_DELTA);
% POWER_THETA = (sum(D6.^2))/length(D6);
% PT = POWER_THETA;
% disp('power of theta');
% disp(POWER_THETA);
% 
% POWER_ALPHA = (sum(D5.^2))/length(D5);
% PA = POWER_ALPHA;
% disp('power of alpha');
% disp(POWER_ALPHA);
% 
% POWER_BETA = (sum(D4.^2))/length(D4);
% PB = POWER_BETA;
% disp('power of beta');
% disp(POWER_BETA);
% 
% POWER_GAMMA = (sum(D3.^2))/length(D3);
% PG = POWER_GAMMA;
% disp('power of gamma');
% disp(POWER_GAMMA);
% 
% Total=POWER_DELTA+ POWER_THETA+POWER_ALPHA+POWER_BETA;
% T = Total;
% disp('total power');
% disp(Total);
% 
% RELATIVE_DELTA=POWER_DELTA/Total;
% RD = RELATIVE_DELTA;
% disp('relative power of delta');
% disp(RELATIVE_DELTA);
% 
% RELATIVE_THETA=POWER_THETA/Total;
% RT = RELATIVE_THETA;
% disp('relative power of theta');
% disp(RELATIVE_THETA);
% 
% RELATIVE_ALPHA=POWER_ALPHA/Total;
% RA = RELATIVE_ALPHA;
% disp('relative power of alpha');
% disp(RELATIVE_ALPHA);
% 
% RELATIVE_BETA=POWER_BETA/Total;
% RB = RELATIVE_BETA;
% disp('relative power of beta');
% disp(RELATIVE_BETA);
% 
% RELATIVE_GAMMA=POWER_GAMMA/Total;
% RG = RELATIVE_GAMMA;
% disp('relative power of gamma');
% disp(RELATIVE_GAMMA);
% 
% %% Entropy
% App=ApEn(a1,2,0.5);
% disp('Approximate entropy');
% disp(App);
% 
% Sam=SampEn(a1,2,0.5);
% disp('Sample entropy');
% disp(Sam);
% 
% w= wentropy(a1,'shannon');
% disp('Shannon entropy');
% disp(w);
%% 
%x=xlsread('/Users/ishaasamyuktha/Desktop/FYP-EPILEPSY/Postinterictals/45.xlsx');
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
%% Hjorth Parameters
    % Activity
%     activity = var(xd);
%     act = activity;
%     disp('activity');
%     disp(activity);
   
    % Mobility
    mobility = std(diff(xd))./std(xd);
    mob = mobility;
% %     disp('mobility');
% %     disp(mobility);
% %     
%    
    % Complexity
    complexity = std(diff(diff(xd)))./std(diff(xd))./mobility;
    comp = complexity;
% %     disp('complexity');
% %     disp(complexity);

% w= wentropy(xd,'shannon');

    
m = 1 ;

end

