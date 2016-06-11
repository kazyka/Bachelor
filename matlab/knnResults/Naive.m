NumberOfPatients =100;
[~, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normalize', 'erode');
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
%Selecting relevant features
% 
% F1 = dataSorted3D(:,7,13,2);
% F2 = dataSorted3D(:,3,13,3);
% F3 = dataSorted3D(:,13,13,3);
% F4 = dataSorted3D(:,13,12,9);
% F5 = dataSorted3D(:,7,12,6);
% F6 = dataSorted3D(:,13,9,10);
% F7 = dataSorted3D(:,7,9,6);
% F8 = dataSorted3D(:,7,6,6);
features = zeros(100,1,1,8);
for i = 1:100
    features(i,1,1,1) = dataSorted3D(i,7,13,2);
    features(i,1,1,2) = dataSorted3D(i,3,13,3);
    features(i,1,1,3) = dataSorted3D(i,13,13,3);
    features(i,1,1,4) = dataSorted3D(i,13,12,9);
    features(i,1,1,5) = dataSorted3D(i,7,12,6);
    features(i,1,1,6) = dataSorted3D(i,13,9,10);
    features(i,1,1,7) = dataSorted3D(i,7,9,6);
    features(i,1,1,8) = dataSorted3D(i,7,6,6);
end


treD = cell(10,1);
for i=1:30
    treD{i} = naivefeature(features,i,8);
    fprintf('FS done for k = %d  done \n',i)
end
