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
        sortedData3D{j+6*(i-1)} = sampledCOKTrainData3D{j+3*(i-1)};
        sortedData3D{3+j+6*(i-1)} = sampledADKTrainData3D{j+3*(i-1)};
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

for i = 1:6
    treD{i}(:,1) = treD{i}(:,1)*10/6;
    toD{i}(:,1) = toD{i}(:,1)*10/6;
end
for i = 1:6
    test2d(i) = max(toD{i}(:,1));
    test3d(i) = max(treD{i}(:,1));
end

% tre d k = 2, 2d k = 1 + k =3
features3d = zeros(9,3);
features2d1k = zeros(9,3);
for i = 1:9
    features3d(i,1) = treD{2}(i,2);
    features3d(i,2) = treD{2}(i,3);
    features3d(i,3) = treD{2}(i,4);
end
for i = 1:9
    features2d1k(i,1) = toD{1}(i,2);
    features2d1k(i,2) = toD{1}(i,3);
    features2d1k(i,3) = toD{1}(i,4);
end

features2d3k = zeros(5,3);
for i = 1:5
    features2d3k(i,1) = toD{1}(i,2);
    features2d3k(i,2) = toD{1}(i,3);
    features2d3k(i,3) = toD{1}(i,4);
end



sortedData2DTest = cell(40,1);
sortedData3DTest = cell(40,1);
for i=1:10
    for j =1:2
        sortedData2DTest{j+4*(i-1)} = sampledCOKTrainData2D{30 + j+2*(i-1)};
        sortedData2DTest{2+j+4*(i-1)} = sampledADKTrainData2D{30 +j+2*(i-1)};
        sortedData3DTest{j+4*(i-1)} = sampledCOKTrainData3D{30 +j+2*(i-1)};
       sortedData3DTest{2+j+4*(i-1)} = sampledADKTrainData3D{30 +j+2*(i-1)};
    end
end

dataSorted2Dtest = forwardFeatureDataSort(sortedData2DTest,40);
dataSorted3Dtest = forwardFeatureDataSort(sortedData3DTest,40);
selFeat3D = [];
selFeat2D1k = [];
for i = 1:9
    selFeat2D1k = cat(2,selFeat2D1k,dataSorted2Dtest(:,features2d1k(i,1),features2d1k(i,2),features2d1k(i,3)));
    selFeat3D = cat(2,selFeat3D,dataSorted3Dtest(:,features3d(i,1),features3d(i,2),features3d(i,3)));
end
selFeat2D3k = [];
for i = 1:5
    selFeat2D3k = cat(2,selFeat2D3k,dataSorted2Dtest(:,features2d3k(i,1),features2d3k(i,2),features2d3k(i,3)));
end

for i = 1:10
    acc2D1k(i) = knnWithCrossval40([],selFeat2D1k,i);
    acc2D3k(i) = knnWithCrossval40([],selFeat2D3k,i);
    acc3D(i) = knnWithCrossval40([],selFeat3D,i);
end

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
FDS2D = forwardFeatureDataSort(sortedData2D,NumberOfPatients);
FDS3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);
selFeat3D = [];
selFeat2D1k = [];

for i = 1:9
    selFeat3D = cat(2,selFeat3D,FDS3D(:,features3d(i,1),features3d(i,2),features3d(i,3)));
    selFeat2D1k = cat(2,selFeat2D1k,FDS2D(:,features2d1k(i,1),features2d1k(i,2),features2d1k(i,3)));
end
selFeat2D3k = [];
for i = 1:5
    selFeat2D3k = cat(2,selFeat2D3k,FDS2D(:,features2d3k(i,1),features2d3k(i,2),features2d3k(i,3)));
end
for i = 1:10
    test3d(i) = knnWithCrossval2([],selFeat3D,i);
    test2d1(i) = knnWithCrossval40([],selFeat2D1k,i);
    test2d3(i) = knnWithCrossval40([],selFeat2D3k,i);
end


