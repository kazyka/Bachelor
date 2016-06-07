label = ones(10,1);
label(6:10) = 3;
label60 = [label; label; label; label; label; label]; 
label40 = [label; label; label; label];

NumberOfPatients =100;
[~, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normal', 'noterode');

COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);

sortedData3DTrain = cell(60,1);
for i=1:6
    for j =1:5
        sortedData3DTrain{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3DTrain{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
dataSorted3DTrain = forwardFeatureDataSort(sortedData3DTrain,60);
sortedData3DTest = cell(40,1);
for i=7:10
    for j =1:5
        sortedData3DTest{j+10*(i-7)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3DTest{5+j+10*(i-7)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
dataSorted3DTest = forwardFeatureDataSort(sortedData3DTest,40);


knnmodels = fitcknn(dataSorted3DTrain(:,2,1,1),label60,'Distance','euclidean',...
    'NumNeighbors',3,'Standardize',1);

tmppredict = predict(knnmodels,dataSorted3DTest(:,2,1,1));
tmp = zeros(40,1);
for i = 1:40
    tmp(i) = tmppredict(i) == label40(i);    
end
sum(tmp)

