% first run this file for starting the loading the data and plotiing ECG of
% mother and foetus

load Fetus_data.dat %loading fetus_data data
load secondfetus_data.dat % loading the data
x1=Fetus_data(:,8)-mean(Fetus_data(:,8));
x11=secondfetus_data(:,8)-mean(secondfetus_data(:,8));
x2=Fetus_data(:,2)-mean(Fetus_data(:,2));
x22=secondfetus_data(:,2)-mean(secondfetus_data(:,2));
Z=length(x2);

Fe = 300
Fe1=300

% estimating  h
Y=20; % Y causal
X=3; % X anticausal

X2=x2(Y:Z-X);
col=x1(Y+X:Z); lig=x1(X+Y:-1:1);
X1=toeplitz(col,lig);
h=X1 \ X2; % resolution
h1=x11 \ x22;
cf=X2-X1*h; % fetal heart beats
cf1=x22-x11*h1;
N_max=1000; indx=[1:N_max];

figure(1)
subplot(311); plot(x1(indx));title('MOTHER ECG'); grid
subplot(312); plot(x2(indx));title('ABDOMINAL ECG'); grid
subplot(313); plot([zeros(Y-1,1);cf(Y:N_max)]);title('FETUS ECG');

figure(2)
subplot(311); plot(x11(indx));title('Second data MOTHER ECG'); grid
subplot(312); plot(x22(indx));title('Second data ABDOMINAL ECG'); grid
subplot(313); plot([zeros(Y-1,1);cf1(Y:N_max)]);title('Second data FETUS ECG'); 
grid









