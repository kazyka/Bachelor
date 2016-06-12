NumberOfPatients =100;
[DATA2D, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normalize', 'erode');
COKTrainData = DATA2D(1:50,:);
ADKTrainData = DATA2D(51:100,:);
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData2D, idxCO2D] = datasample(COKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData2D, idxAD2D] = datasample(ADKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
sortedData2D = cell(60,1);
sortedData3D = cell(60,1);
for i=1:10
    for j =1:3
        sortedData2D{j+6*(i-1)} = sampledCOKTrainData2D{j+3*(i-1)};
        sortedData2D{3+j+6*(i-1)} = sampledADKTrainData2D{j+3*(i-1)};
        sortedData3D{j+6*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3D{3+j+6*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
%Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
%distances(10)
dataSorted2D = forwardFeatureDataSort(sortedData2D,60);
dataSorted3D = forwardFeatureDataSort(sortedData3D,60);
%Find best and accuracy K for all 4 datasets
toD = cell(6,1);
treD = cell(6,1);
for i=1:6
    tic;
    toD{i} = ForwardSelection6040(dataSorted2D,i,15);
    treD{i} = ForwardSelection6040(dataSorted3D,i,15);
    toc;
    fprintf('FS done for k = %d  done \n',i)
end
save(sprintf('knnResults/Left2DNormalizedErodeSplit'), 'toD');
save(sprintf('knnResults/Left3DNormalizedErodeSplit'), 'treD');




