NumberOfPatients =100;
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
%Find best and accuracy K for all 4 datasets
toD = cell(10,1);
treD = cell(10,1);
for i=1:10
    toD{i} = ForwardSelection2(dataSorted2D,i,15);
    treD{i} = ForwardSelection2(dataSorted3D,i,15);
    fprintf('FS done for k = %d  done \n',i)
end
save(sprintf('knnResults/notErodeRight2DNormalized'), 'toD');
save(sprintf('knnResults/notErodeRight3DNormalized'), 'treD');

load('notErodeRight2DNormalized.mat');
load('notErodeRight3DNormalized.mat');


% for i = 1:10
%     test2d(i) = max(toD{i}(:,1));
%     test3d(i) = max(treD{i}(:,1));
% end

% tre d k = 1 og 3, 2d k = 4
features3d = zeros(12,3);
features3dekstra = zeros(12,3);
for i = 1:size(features3d,1)
    features3d(i,1) = treD{1}(i,2);
    features3d(i,2) = treD{1}(i,3);
    features3d(i,3) = treD{1}(i,4);
    features3dekstra(i,1) = treD{3}(i,2);
    features3dekstra(i,2) = treD{3}(i,3);
    features3dekstra(i,3) = treD{3}(i,4);
end

features2d= zeros(8,3);
for i = 1:size(features2d,1)
    features2d(i,1) = toD{4}(i,2);
    features2d(i,2) = toD{4}(i,3);
    features2d(i,3) = toD{4}(i,4);
end

NumberOfPatients =100;
[DATA2D, DATA3D] = dataloader(NumberOfPatients , 1, 'right', 'normalize', 'noterode');
COKTrainData = DATA2D(1:50,:);
ADKTrainData = DATA2D(51:100,:);
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);

%randomly sample from data, without replacment
acc2D = zeros(10,1);
acc3D = zeros(10,1);
acc3Dekstra = zeros(10,1);

for a = 1:100
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

    selFeat3Dekstra = [];
    selFeat3D = [];
    for i = 1:size(features3d,1)
        selFeat3D = cat(2,selFeat3D,dataSorted3D(:,features3d(i,1),features3d(i,2),features3d(i,3)));
        selFeat3Dekstra = cat(2,selFeat3Dekstra,dataSorted3D(:,features3dekstra(i,1),features3dekstra(i,2),features3dekstra(i,3)));
    end
    selFeat2D = [];
    for i = 1:size(features2d,1)
        selFeat2D = cat(2,selFeat2D,dataSorted2D(:,features2d(i,1),features2d(i,2),features2d(i,3)));
    end

    for i = 1:10
        acc2D(i) = acc2D(i) + knnWithCrossval2([],selFeat2D,i)/100;
        acc3D(i) = acc3D(i) + knnWithCrossval2([],selFeat3D,i)/100;
        acc3Dekstra(i) = acc3Dekstra(i) + knnWithCrossval2([],selFeat3Dekstra,i)/100;
    end
    fprintf('done round %d \n',a) 
end