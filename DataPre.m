clc;
clear all;
load homocksaapP.mat
cksaapP=cksaap;
load homocksaapN.mat
cksaapN=cksaap;
load homoaaP1.mat
aaP1=aaP;
load homoaaP2.mat
aaP2=aaP;
load homoaaP3.mat
aaP3=aaP;
load homoaaP4.mat
aaP4=aaP;
load homoaaP5.mat
aaP5=aaP;
load homoaaP6.mat
aaP6=aaP;
load homoaaP7.mat
aaP7=aaP;
load homoaaP8.mat
aaP8=aaP;
load homoaaP9.mat
aaP9=aaP;
load homoaaN1.mat
aaN1=aaN;
load homoaaN2.mat
aaN2=aaN;
load homoaaN3.mat
aaN3=aaN;
load homoaaN4.mat
aaN4=aaN;
load homoaaN5.mat
aaN5=aaN;
load homoaaN6.mat
aaN6=aaN;
load homoaaN7.mat
aaN7=aaN;
load homoaaN8.mat
aaN8=aaN;
load homoaaN9.mat
aaN9=aaN;
load homoohP.mat
load homoohN.mat

cksaapP01=mapminmax(cksaapP,0,1);
cksaapN01=mapminmax(cksaapN,0,1);
aaP01=mapminmax(aaP,0,1);
aaN01=mapminmax(aaN,0,1);
aaP02=mapminmax(aaP2,0,1);
aaN02=mapminmax(aaN2,0,1);
aaN02(425,:)=1;
aaN02(385,:)=1;
aaP03=mapminmax(aaP3,0,1);
aaN03=mapminmax(aaN3,0,1);
aaP04=mapminmax(aaP4,0,1);
aaN04=mapminmax(aaN4,0,1);
aaP05=mapminmax(aaP5,0,1);
aaN05=mapminmax(aaN5,0,1);
aaP06=mapminmax(aaP6,0,1);
aaN06=mapminmax(aaN6,0,1);
aaP07=mapminmax(aaP7,0,1);
aaN07=mapminmax(aaN7,0,1);
aaP08=mapminmax(aaP8,0,1);
aaN08=mapminmax(aaN8,0,1);
aaP09=mapminmax(aaP9,0,1);
aaN09=mapminmax(aaN9,0,1);
ohP01=mapminmax(ohP,0,1);
ohN01=mapminmax(ohN,0,1);
La1=ones(size(cksaapP,1),1);
P=[La1,cksaapP01,aaP01,aaP02,aaP03,aaP04,aaP05,aaP06,aaP07,aaP08,aaP09,ohP01];  
rowbank=randperm(size(P,1));
ll=ceil(length(rowbank)*0.8)-1;
Ptrain=P(rowbank(1:ll),:);
PIndep=P(rowbank(ll+1:length(rowbank)),:);

La2=ones(size(cksaapN,1),1)*(-1);
N1=[La2,cksaapN01,aaN01,aaN02,aaN03,aaN04,aaN05,aaN06,aaN07,aaN08,aaN09,ohN01];  %3087+17*9+357
N1train=N1(rowbank(1:ll),:);
N1Indep=N1(rowbank(ll+1:length(rowbank)),:);

CCa = [Ptrain;N1train];
IIndep = [PIndep;N1Indep];

CCCa=[CCa(:,2:1765),CCa(:,3089:end)];
IIIndep =[IIndep(:,2:1765),IIndep(:,3089:end)];

[eigvector, eigvalue, elapse]=PCA(CCCa, 100);  %3089,3242
Ca=[CCa(:,1),CCCa*eigvector];
Indep =[IIndep(:,1),IIIndep*eigvector];

save homoCa  Ca
save homoIndep Indep
