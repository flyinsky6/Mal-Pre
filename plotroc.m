clc;
clear all;
load Malon1.mat
load Malon2.mat
load Malon3.mat
load Malon4.mat
load Malon5.mat

c=1.6;
g=0.08;

cmd = ['-c ',num2str(c),' -g ',num2str(g),' -b ',num2str(1)];
% fold-1
model1=svmtrain(Malon_f1_train_label,Malon_f1_train_feature,cmd);
[predictions_f1,accuracy1,dec_values1]=svmpredict(Malon_f1_test_label,Malon_f1_test_feature,model1,'-b 1');
% k=k+1;
% result{k,1}=[i;g;accuracy1];
%
% fold-2
model2=svmtrain(Malon_f2_train_label,Malon_f2_train_feature,cmd);
[predictions_f2,accuracy2,dec_values2]=svmpredict(Malon_f2_test_label,Malon_f2_test_feature,model2,'-b 1');

% fold-3
model3=svmtrain(Malon_f3_train_label,Malon_f3_train_feature,cmd);
[predictions_f3,accuracy3,dec_values3]=svmpredict(Malon_f3_test_label,Malon_f3_test_feature,model3,'-b 1');

% fold-4
model4=svmtrain(Malon_f4_train_label,Malon_f4_train_feature,cmd);
[predictions_f4,accuracy4,dec_values4]=svmpredict(Malon_f4_test_label,Malon_f4_test_feature,model4,'-b 1');

% fold-5
model5=svmtrain(Malon_f5_train_label,Malon_f5_train_feature,cmd);
[predictions_f5,accuracy5,dec_values5]=svmpredict(Malon_f5_test_label,Malon_f5_test_feature,model5,'-b 1');


[X1,Y1,THRE,AUC1,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(Malon_f1_test_label,dec_values1(:,1),'1');
[X2,Y2,THRE,AUC2,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(Malon_f2_test_label,dec_values2(:,1),'1');
[X3,Y3,THRE,AUC3,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(Malon_f3_test_label,dec_values3(:,1),'1');
[X4,Y4,THRE,AUC4,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(Malon_f4_test_label,dec_values4(:,1),'1');
[X5,Y5,THRE,AUC5,OPTROCPT,SUBY,SUBYNAMES] = perfcurve(Malon_f5_test_label,dec_values5(:,1),'1');


hold on
    plot(X1,Y1,'g','LineWidth',1.5);
    plot(X2,Y2,'y','LineWidth',1.5);
    plot(X3,Y3,'b','LineWidth',1.5);    
    plot(X4,Y4,'r','LineWidth',1.5);    
    plot(X5,Y5,'k','LineWidth',1.5);grid on;ll=legend('1th fold','2th fold','3th fold','4th fold','5th fold');
    xlabel('1-Specificity');ylabel('Sensitivity');
    box on;
   meanAUC=mean([AUC1,AUC2,AUC3,AUC4,AUC5]);
    grid off;

 text(0.3,0.05,num2str(meanAUC,'Average AUC =%.4f'),'Fontsize',18)
 
set(get(gca,'XLabel'),'FontSize',18);
set(get(gca,'YLabel'),'FontSize',18);
set(gca,'FontSize',10);
set(ll,'FontSize',10);
set(gcf,'color','w');

