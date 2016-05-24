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