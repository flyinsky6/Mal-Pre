clc;
clear all;
load homoCa.mat
load homoIndep.mat

Malon_data=Ca;
[n,m]=size(Malon_data);
p=randperm(size(Malon_data,1));

dataall=Malon_data;
[n,m]=size(dataall);
dataall=dataall(p(1:size(Malon_data,1)),:);
flod_num=5; 
step =floor(size(dataall,1)/flod_num);
% for i=1:5
j=1
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Malon_f1_test_feature = dataall(cv_p,2:m);
     Malon_f1_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Malon_f1_train_feature= A(:,2:m);
     Malon_f1_train_label=A(:,1);
     save Malon1 Malon_f1_test_feature Malon_f1_test_label Malon_f1_train_feature Malon_f1_train_label 
     
j=2
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Malon_f2_test_feature = dataall(cv_p,2:m);
     Malon_f2_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Malon_f2_train_feature= A(:,2:m);
     Malon_f2_train_label=A(:,1);
     save Malon2 Malon_f2_test_feature Malon_f2_test_label Malon_f2_train_feature Malon_f2_train_label

j=3
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Malon_f3_test_feature = dataall(cv_p,2:m);
     Malon_f3_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Malon_f3_train_feature= A(:,2:m);
     Malon_f3_train_label=A(:,1);
     save Malon3 Malon_f3_test_feature Malon_f3_test_label Malon_f3_train_feature Malon_f3_train_label
j=4
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Malon_f4_test_feature = dataall(cv_p,2:m);
     Malon_f4_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Malon_f4_train_feature= A(:,2:m);
     Malon_f4_train_label=A(:,1);
     save Malon4 Malon_f4_test_feature Malon_f4_test_label Malon_f4_train_feature Malon_f4_train_label
     
j=5
    if j~=flod_num
        st=(j-1)*step+1;
        sed=(j)*step;
    else
        st=(j-1)*step+1;
        sed=size(dataall,1);
    end
     cv_p=[st:sed];
     Malon_f5_test_feature = dataall(cv_p,2:m);
     Malon_f5_test_label=dataall(cv_p,1);
     Tr=dataall;
     Tr(cv_p,:)='';
     A=[Tr];
     Malon_f5_train_feature= A(:,2:m);
     Malon_f5_train_label=A(:,1);
     save Malon5 Malon_f5_test_feature Malon_f5_test_label Malon_f5_train_feature Malon_f5_train_label
