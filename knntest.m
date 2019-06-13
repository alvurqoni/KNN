clear all;
clc;

%data 
dataTrain = xlsread('dataset.xlsx','DataTrain','A1:F3001');
dataTes = xlsread('dataset.xlsx','DataTest','A1:F1001');

%cek e
%%

k = 21;
hoax = [];

for j = 1:length(dataTes)
    
    %hitung euclidean
    euc = [];
    for i= 1 : length(dataTrain)
        
         euc = [euc; sqrt(sum((dataTrain(i,1:4)-dataTes(j,1:4)).^2)) dataTrain(i,5)];
     
        
    end
 
    urut = sortrows(euc);
    jum = 0;
    for kk = 1:k
     jum = jum + urut(kk,2);
    
    end
    if (jum < round(k/2))
            hoax = [hoax; 0];
        else 
            hoax = [hoax; 1];
    end
end
save('hasil.mat','hoax');
