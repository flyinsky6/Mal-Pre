% clc;
% clear all;
% load Indep.mat
% load Ca.mat
% c=0.8;
% g=0.2;
% cmd = ['-c ',num2str(c),' -g ',num2str(g),' -b ',num2str(1)];
% model1=svmtrain(Ca(:,1),Ca(:,426),cmd);
% [predictions_fIndepSVM,accuracy1,dec_values1]=svmpredict(Indep(:,1),Indep(:,2:426),model1,'-b 1');
% [ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_fIndepSVM,Indep(:,1));
%         R = [ACC,SN,SP,PPV,NPV,F1,MCC];

clc;
clear all;
load Malon1.mat
load Malon2.mat
load Malon3.mat
load Malon4.mat
load Malon5.mat
k=1;
max=0;
maxc =0 ;
maxg =0 ;
for c=0.1:0.1:32
    for g=0.01:0.01:32
        % c=1.6;
        % g=0.08;   %eColi
        
        cmd = ['-c ',num2str(c),' -g ',num2str(g),' -b ',num2str(1)];
        % fold-1
        model1=svmtrain(Malon_f1_train_label,Malon_f1_train_feature,cmd);
        [predictions_f1,accuracy1,dec_values1]=svmpredict(Malon_f1_test_label,Malon_f1_test_feature,model1,'-b 1');
     
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
        
        
        [ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f1,Malon_f1_test_label);
        aa = [ACC,SN,SP,PPV,NPV,F1,MCC];
        
        [ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f2,Malon_f2_test_label);
        bb = [ACC,SN,SP,PPV,NPV,F1,MCC];
        [ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f3,Malon_f3_test_label);
        cc = [ACC,SN,SP,PPV,NPV,F1,MCC];
        [ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f4,Malon_f4_test_label);
        dd = [ACC,SN,SP,PPV,NPV,F1,MCC];
        [ACC,SN,SP,PPV,NPV,F1,MCC] = roc1(predictions_f5,Malon_f5_test_label);
        ee = [ACC,SN,SP,PPV,NPV,F1,MCC];
        R=[];
        R=[aa;bb;cc;dd;ee]; 
        accuracy1=(aa(1)+bb(1)+cc(1)+dd(1)+ee(1))/5;
        result{k,:}=[c;g;accuracy1];
        k=k+1; 
        if accuracy1>max
            max=accuracy1;
            maxc= c;
            maxg= g;
        end            
    end
end
