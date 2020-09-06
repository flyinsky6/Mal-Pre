clc;
clear all;
load homoIndep.mat
load homoCa.mat
c=1.6;
g=0.08;
cmd = ['-c ',num2str(c),' -g ',num2str(g),' -b ',num2str(1)];
model1=svmtrain(Ca(:,1),Ca(:,101),cmd);
[predictions_fIndepSVM,accuracy1,dec_values1]=svmpredict(Indep(:,1),Indep(:,2:101),model1,'-b 1');
[ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_fIndepSVM,Indep(:,1));
        R = [ACC,SN,SP,PPV,NPV,F1,MCC];

