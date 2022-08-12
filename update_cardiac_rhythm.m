% second run this file to calculate and plot the correlation ,it also calls
% up the function to calculate

% Cardiac Rhythm estimation
% The following program uses signals from ECG.m
% Uses: Function.m
pulse_min=50; %bpm
pulse_max=300; % bpm
% over sampling_ratio
P=2;
maxcor_apriori=0.25;

Fe1=350

[F_mother, corr_mother]=...
Function(x1,Fe,P,maxcor_apriori,pulse_min/60,pulse_max/60);
[F_fetus, corr_fetus]=...
Function(cf,Fe,P,maxcor_apriori,pulse_min/60,pulse_max/60);
% results
disp('*****************************')
fprintf('* Pulses (mother): %5.2f\n',60*F_mother);
fprintf('* Pulses (fetus) : %5.2f\n',60*F_fetus);                                        
disp('*****************************')
lagminM=fix(60*Fe*P/pulse_max);
lagminF=fix(60*Fe*P/pulse_max);
MinCM=min(corr_mother);
LCM=length(corr_mother); 
MaxCM=max(corr_mother);
subplot(211);
plot((lagminM:LCM+lagminM-1)/P,corr_mother);title('LEVEL CORRELATION OF MOTHER');
grid; hold on;
plot(Fe/F_mother*[1 1]+1,[min(corr_mother) MaxCM],':');
hold off

MinCF=min(corr_fetus); MaxCF=max(corr_fetus);
subplot(212);
plot((lagminF:length(corr_fetus)+lagminF-1)/P,...
corr_fetus);title('LEVEL CORRELATION OF FETUS');
grid; hold on;
plot(Fe/F_fetus*[1 1]+1,[MinCF MaxCF],':');
hold off
%%%%%%2
% Uses: Function.m
pulsemin=50; %bpm
pulsemax=300; % bpm
% over sampling_ratio
P=2;
maxcor_apriori=0.20;
[Fmother, corrmother]=...
Function(x11,Fe1,P,maxcor_apriori,pulsemin/60,pulsemax/60);
[Ffetus, corr_fetus]=...
Function(cf1,Fe1,P,maxcor_apriori,pulsemin/60,pulsemax/60);
% results
disp('*****************************')
fprintf('* Pulses (mother) Second data: %5.2f\n',60*Fmother);
fprintf('* Pulses (fetus) Second data : %5.2f\n',60*Ffetus);                                        
disp('*****************************')
lagminM=fix(60*Fe*P/pulsemax);
lagminF=fix(60*Fe*P/pulsemax);
MinCM=min(corrmother);
LCM=length(corrmother); 
MaxCM=max(corrmother);
figure(2)
subplot(211);
plot((lagminM:LCM+lagminM-1)/P,corrmother);title('SECOND DATA LEVEL CORRELATION OF MOTHER');
grid; hold on;
plot(Fe/Fmother*[1 1]+1,[min(corrmother) MaxCM],':');
hold off

MinCF=min(corr_fetus); MaxCF=max(corr_fetus);
subplot(212);
plot((lagminF:length(corr_fetus)+lagminF-1)/P,...
corr_fetus);title('SECOND DATA LEVEL CORRELATION OF FETUS');
grid; hold on;
plot(Fe/Ffetus*[1 1]+1,[MinCF MaxCF],':');
hold off
