clear all;
clc;

%data 
 dataTrain = xlsread('dataset.xlsx','DataTrain','A1:F2001');
 dataValid = xlsread('dataset.xlsx','DataTrain','A3002:F3502');


%cek e
knn =21;
nilai= 0;
prediksi= [];
    for j = 1:length(dataValid)
       
        euc = [];
        for i= 1 : length(dataTrain)
        euc = [euc; sqrt(sum((dataTrain(i,1:4)-dataValid(j,1:4)).^2)) dataTrain(i,5)];
        end
        
        urut = sortrows(euc);
        jum = 0;
        for kk = 1:knn
            jum = jum + urut(kk,2);
        end
        if (jum < round(knn/2))
                prediksi = [prediksi; 0];
            else 
                prediksi = [prediksi; 1];
        end
    end
    for i = 1:length(dataValid)
         if prediksi(i,1) == dataValid(i,5) 
             nilai = nilai + 1;
         end
    end
akurasi = (nilai/length(dataValid))* 100;
