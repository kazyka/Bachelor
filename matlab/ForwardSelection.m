function [featureIndex,selectedDataset,newAccuracy,remaningDataset] = ForwardSelection(dataset,oldAccuracy,selectedFeatures)

Features = zeros(size(dataset,2),1);

if isequal(selectedFeatures,zeros(size(dataset,1),1)) == 0
    for i = 1:size(dataset,2)
        tmp = [selectedFeatures dataset(:,i)];
        Features(i) = crossKNN(tmp,5);
    end
else %first iteration
    for i = 1:size(dataset,2)
        Features(i) = crossKNN(dataset(:,i),5);
    end    
end
[newAccuracy,featureIndex] = min(Features);

selectedDataset = [selectedFeatures dataset(:,featureIndex)];

dataset(:,featureIndex) = [];
remaningDataset = dataset;
end

function [classError] = crossKNN(KTrainData, rngesus)

%find the size of the trainData
tmpPatients = size(KTrainData,1);
%The label setting
label = ones(tmpPatients,1);
label((tmpPatients/2 +1):tmpPatients) = 3;


%Laver random sample uden replace og tilpasser labels dertil, når der skal
%laves knn
[randomKTrainData, idx] = datasample(KTrainData, tmpPatients, 'Replace', false);
samplelabel = label(idx);

KNNMdl = fitcknn(randomKTrainData,samplelabel,'Distance','euclidean',...
    'NumNeighbors',1,'Standardize',1);
rng(rngesus); % For reproducibility
CVKNNMdl = crossval(KNNMdl);
classError = kfoldLoss(CVKNNMdl);
end
