function crossKNN(KTrainData, rngesus)

%find the size of the trainData
tmpPatients = size(KTrainData,1);
%The label setting
label = ones(tmpPatients,1);
label((tmpPatients/2 +1):tmpPatients) = 3;


%Laver random sample uden replace og tilpasser labels dertil, når der skal
%laves knn
[randomKTrainData, idx] = datasample(KTrainData, tmpPatients, 'Replace', false);
samplelabel = label(idx);

figure(1)
classError = zeros(20,1);
for k = 1:20
    KNNMdl = fitcknn(randomKTrainData,samplelabel,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',0);
    rng(rngesus); % For reproducibility
    CVKNNMdl = crossval(KNNMdl);
    classError(k) = kfoldLoss(CVKNNMdl);
end
plot(classError)