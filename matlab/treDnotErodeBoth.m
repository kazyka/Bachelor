NumberOfPatients =100;
[~, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normal', 'noterode');
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
sortedData3D = cell(100,1);
for i=1:10
    for j =1:5
        sortedData3D{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3D{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
%Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
%distances(10)
dataSorted3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);
%Find best and accuracy K for all 4 datasets
toD = cell(10,1);
treD = cell(10,1);
for i=1:10
    treD{i} = ForwardSelection2(dataSorted3D,i,15);
    fprintf('FS done for k = %d  done \n',i)
end
save(sprintf('knnResults/notErodeLeft3DudenNorm'), 'treD');


NumberOfPatients =100;
[~, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normalize', 'noterode');
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
sortedData3D = cell(100,1);
for i=1:10
    for j =1:5
        sortedData3D{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3D{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
%Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
%distances(10)
dataSorted3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);
%Find best and accuracy K for all 4 datasets
toD = cell(10,1);
treDnormalized = cell(10,1);
for i=1:10
    treDnormalized{i} = ForwardSelection2(dataSorted3D,i,15);
    fprintf('FS done for k = %d  done \n',i)
end
save(sprintf('knnResults/notErodeLeft3DNormalized'), 'treDnormalized');