clc;
clear all;

filename = '.\homoN.csv';

delimiter = ',';
formatSpec = '%*s%s%*s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
fclose(fileID);
PepN = [dataArray{1:end-1}];
clearvars filename delimiter formatSpec fileID dataArray ans;

filename = '.\homoP.csv';
delimiter = ',';
formatSpec = '%*s%s%*s%[^\n\r]';

fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
% 关闭文本文件。
fclose(fileID);
PepP = [dataArray{1:end-1}];
clearvars filename delimiter formatSpec fileID dataArray ans;


ll=17;
K=6;
[m,n]=size(PepP);
% cksaap=zeros(m,441);
for k=0:K           
    p=0;    
    AM='ACDEFGHIKLMNPQRSTVWYX';
    for i=1:21
        for j=1:21
            p=p+1;
            sap{p,1}=[AM(i),AM(j)];
        end
    end
    
    for i=1:m
        p=0;
        a=char(PepP(i));
        pep={};
        for j=1:length(a)
            if j+k+1<=length(a)
                p=p+1;
                pep{p,1}=[a(j),a(j+k+1)];
            elseif j+k+1>length(a)
                p=p+1;
                pep{p,1}= [a(j),'X'];
            end
        end
        ss=tabulate(pep);
        for kk=1:length(ss)
            mk=find(strcmp(sap, ss{kk,1}));
            saap(i,mk,k+1)=ss{kk,2}/441;
        end
    end

end
cksaap=[saap(:,:,1),saap(:,:,2),saap(:,:,3),saap(:,:,4),saap(:,:,5),saap(:,:,6),saap(:,:,7)];
save homocksaapP cksaap


for k=0:K        
    p=0;  
    [m,n]=size(PepN);
    cksaap=zeros(m,441);
    AM='ACDEFGHIKLMNPQRSTVWYX';
    for i=1:21
        for j=1:21
            p=p+1;
            sap{p,1}=[AM(i),AM(j)];
        end
    end
    
    for i=1:m
        p=0;
        pep={};
        a=char(PepN(i));
        for j=1:length(a)
            if j+k+1<=length(a)
                p=p+1;
                pep{p,1}=[a(j),a(j+k+1)];
            elseif j+k+1>length(a)
                p=p+1;
                pep{p,1}= [a(j),'X'];
            end
        end
        ss=tabulate(pep);
        for kk=1:length(ss)
            mk=find(strcmp(sap, ss{kk,1}));
            saap(i,mk,k+1)=ss{kk,2}/441;
        end
    end
end
cksaap=[saap(:,:,1),saap(:,:,2),saap(:,:,3),saap(:,:,4),saap(:,:,5),saap(:,:,6),saap(:,:,7)];
save homocksaapN cksaap

%%%%%%%%%%%%%%%%%%one-hot
AMX='ACDEFGHIKLMNPQRSTVWYX';
ll=length(PepN{1,1});
ohN=[];
for i=1:m
    onehot=zeros(ll,21);
    for j=1:ll  
         loc=strfind(AMX,PepN{i,1}(j));   
         onehot(j,loc)=1;
    end 
    ohN(i,:)=onehot(:)';
end

ohP=[];
for i=1:m
    onehot=zeros(ll,21);
    for j=1:ll  
         loc=strfind(AMX,PepP{i,1}(j));     
         onehot(j,loc)=1;
    end 
    ohP(i,:)=onehot(:)';
end

save homoohP ohP
save homoohN ohN

%%%%%%%%%%%%%%%%%AAindex
% %%Transfer free energy to surface
 AA='ALRKNMDFCPQSETGWHYIVX';
AMXV=[-0.2,-2.46,-0.12,-0.35,0.08,-1.47,-0.20,-2.33,-0.45,-0.98,0.16,-0.39,-0.30,-0.52,0.00,-2.01,-0.12,-2.24,-2.26,-1.56,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end

save homoaaN1 aaN
save homoaaP1 aaP

%%Hydrophilicity value
AMXV=[-0.5,-1.8,3.0,3.0,0.2,-1.3,3.0,-2.5,-1.0,0.0,0.2,0.3,3.0,-0.4,0.00,-3.4,-0.5,-2.3,-1.8,-1.5,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save homoaaN2 aaN
save homoaaP2 aaP


%%Mean polarity
AMXV=[-0.06,1.21,-0.84,-1.18,-0,48,1.27,-0.80,1.27,1.36,0,-0.73,-0.50,-0.77,-0.27,-0.41,0.88,0.49,0.33,1.31,1.09,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save homoaaN3 aaN
save homoaaP3 aaP

%%Isoelectric point
AMXV=[9.9,17.6,4.6,3.5,5.4,14.9,2.8,18.8,2.8,14.8,9.0,6.9,3.2,9.5,5.6,17.1,8.2,15.0,17.1,14.3,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll
         loc=strfind(AA,PepP{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));    
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save homoaaN4 aaN
save homoaaP4 aaP

%Refractivityt
AMXV=[4.34,18.78,26.66,21.29,13.28,21.64,12.00,29.40,35.77,10.93,17.56,6.35,17.26,11.01,0.00,42.53,21.81,31.53,19.06,13.92,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));    
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));    
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save homoaaN5 aaN
save homoaaP5 aaP

%%Average flexibility indices
AMXV=[0.357,0.365,0.529,0.466,0.463,0.295,0.511,0.314,0.346,0.509,0.493,0.507,0.497,0.444,0.544,0.305,0.323,0.420,0.462,0.386,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));   
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));  
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save homoaaN6 aaN
save homoaaP6 aaP


%%Average volume of buried residue 
AMXV=[91.5,167.9,202.0,171.3,135.2,170.8,124.5,203.4,117.7,129.3,161.1,99.1,155.1,122.1,66.4,237.6,167.3,203.6,168.8,141.7,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));    
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll 
         loc=strfind(AA,PepN{i,1}(j));   
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save musaaN7 aaN
save musaaP7 aaP


%%Electron-ion interaction potential values
AMXV=[0.0373,0.0000,0.0959,0.0371,0.0036,0.0823,0.1263,0.0946,0.0829,0.0198,0.0761,0.0829,0.0058,0.0941,0.0050,0.0548,0.0242,0.0516,0.0000,0.0057,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));    
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));     
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save homoaaN8 aaN
save homoaaP8 aaP

%%Consensus normalized hydrophobicity scale
AMXV=[0.25,0.53,-1.76,-1.1,-0.64,0.26,-0.72,0.61,0.04,-0.07,-0.69,-0.26,-0.62,-0.18,0.16,0.37,-0.40,0.02,0.73,0.54,0.00];
aaP=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepP{i,1}(j));   
         aa1(1,j)=AMXV(loc);
    end 
    aaP(i,:)=aa1(:)';
end

aaN=[];
for i=1:m
    aa1=zeros(1,ll);
    for j=1:ll  
         loc=strfind(AA,PepN{i,1}(j));   
         aa1(1,j)=AMXV(loc);
    end 
    aaN(i,:)=aa1(:)';
end
save homoaaN9 aaN
save homoaaP9 aaP
