BestSingleFeatures = cell(8,1);
NumberOfPatients =100;
[DATA2D, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normal', 'noterode');
COKTrainData = DATA2D(1:50,:);
ADKTrainData = DATA2D(51:100,:);
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData2D, idxCO2D] = datasample(COKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData2D, idxAD2D] = datasample(ADKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
sortedData2D = cell(100,1);
sortedData3D = cell(100,1);
for i=1:10
    for j =1:5
        sortedData2D{j+10*(i-1)} = sampledCOKTrainData2D{j+5*(i-1)};
        sortedData2D{5+j+10*(i-1)} = sampledADKTrainData2D{j+5*(i-1)};
        sortedData3D{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3D{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
%Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
%distances(10)
dataSorted2D = forwardFeatureDataSort(sortedData2D,NumberOfPatients);
dataSorted3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);

SingleFeatures2d = cell(13,10);
SingleFeatures3d = cell(13,10);
for i = 1:13
    for j = 1:10
        SingleFeatures2d{i,j} = ForwardSelection2(dataSorted2D(:,:,i,:),j,9);
        SingleFeatures3d{i,j} = ForwardSelection2(dataSorted3D(:,:,i,:),j,13);
        fprintf('FS done for k = %d  done \n',j)
    end
    fprintf('GF done for feature = %d  done \n',i)
end
BestSingleFeatures{1} = SingleFeatures2d;
BestSingleFeatures{2} = SingleFeatures3d;

[DATA2D, DATA3D] = dataloader(NumberOfPatients , 1, 'right', 'normal', 'noterode');
COKTrainData = DATA2D(1:50,:);
ADKTrainData = DATA2D(51:100,:);
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData2D, idxCO2D] = datasample(COKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData2D, idxAD2D] = datasample(ADKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
sortedData2D = cell(100,1);
sortedData3D = cell(100,1);
for i=1:10
    for j =1:5
        sortedData2D{j+10*(i-1)} = sampledCOKTrainData2D{j+5*(i-1)};
        sortedData2D{5+j+10*(i-1)} = sampledADKTrainData2D{j+5*(i-1)};
        sortedData3D{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3D{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
%Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
%distances(10)
dataSorted2D = forwardFeatureDataSort(sortedData2D,NumberOfPatients);
dataSorted3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);

SingleFeatures2d = cell(13,5);
SingleFeatures3d = cell(13,5);
for i = 1:13
    for j = 1:10
        SingleFeatures2d{i,j} = ForwardSelection2(dataSorted2D(:,:,i,:),j,9);
        SingleFeatures3d{i,j} = ForwardSelection2(dataSorted3D(:,:,i,:),j,13);
        fprintf('FS done for k = %d  done \n',j)
    end
    fprintf('GF done for feature = %d  done \n',i)
end
BestSingleFeatures{3} = SingleFeatures2d;
BestSingleFeatures{4} = SingleFeatures3d;

[DATA2D, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normalize', 'noterode');
COKTrainData = DATA2D(1:50,:);
ADKTrainData = DATA2D(51:100,:);
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData2D, idxCO2D] = datasample(COKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData2D, idxAD2D] = datasample(ADKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
sortedData2D = cell(100,1);
sortedData3D = cell(100,1);
for i=1:10
    for j =1:5
        sortedData2D{j+10*(i-1)} = sampledCOKTrainData2D{j+5*(i-1)};
        sortedData2D{5+j+10*(i-1)} = sampledADKTrainData2D{j+5*(i-1)};
        sortedData3D{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3D{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
%Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
%distances(10)
dataSorted2D = forwardFeatureDataSort(sortedData2D,NumberOfPatients);
dataSorted3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);

SingleFeatures2d = cell(13,5);
SingleFeatures3d = cell(13,5);
for i = 1:13
    for j = 1:10
        SingleFeatures2d{i,j} = ForwardSelection2(dataSorted2D(:,:,i,:),j,9);
        SingleFeatures3d{i,j} = ForwardSelection2(dataSorted3D(:,:,i,:),j,13);
        fprintf('FS done for k = %d  done \n',j)
    end
    fprintf('GF done for feature = %d  done \n',i)
end
BestSingleFeatures{5} = SingleFeatures2d;
BestSingleFeatures{6} = SingleFeatures3d;

[DATA2D, DATA3D] = dataloader(NumberOfPatients , 1, 'right', 'normalize', 'noterode');
COKTrainData = DATA2D(1:50,:);
ADKTrainData = DATA2D(51:100,:);
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
[sampledCOKTrainData2D, idxCO2D] = datasample(COKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData2D, idxAD2D] = datasample(ADKTrainData, NumberOfPatients/2, 'Replace', false);
[sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
[sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
sortedData2D = cell(100,1);
sortedData3D = cell(100,1);
for i=1:10
    for j =1:5
        sortedData2D{j+10*(i-1)} = sampledCOKTrainData2D{j+5*(i-1)};
        sortedData2D{5+j+10*(i-1)} = sampledADKTrainData2D{j+5*(i-1)};
        sortedData3D{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
        sortedData3D{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
    end
end
%Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
%distances(10)
dataSorted2D = forwardFeatureDataSort(sortedData2D,NumberOfPatients);
dataSorted3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);

SingleFeatures2d = cell(13,5);
SingleFeatures3d = cell(13,5);
for i = 1:13
    for j = 1:10
        SingleFeatures2d{i,j} = ForwardSelection2(dataSorted2D(:,:,i,:),j,9);
        SingleFeatures3d{i,j} = ForwardSelection2(dataSorted3D(:,:,i,:),j,13);
        fprintf('FS done for k = %d  done \n',j)
    end
    fprintf('GF done for feature = %d  done \n',i)
end
BestSingleFeatures{7} = SingleFeatures2d;
BestSingleFeatures{8} = SingleFeatures3d;



save(sprintf('knnResults/GoodFeaturesnoErode'), 'BestSingleFeatures');





