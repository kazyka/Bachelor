function [sampledKTrainData, indexAll, label]  = trainKNN(DATA, rngesus)
%DOC


%Setting the labels [1, 1, ..., 3, 3]
%tmpvalue er størrelsen af data der skal bruges.
tmpPatients = 80;
label = ones(tmpPatients,1);
label((tmpPatients/2 +1):tmpPatients) = 3;


%Initilize the data for random pick
COKTrainData = DATA(1:50,:);
ADKTrainData = DATA(51:100,:);

%randomly sample from data, without replacment
[sampledCOKTrainData, idxCO] = datasample(COKTrainData, tmpPatients/2, 'Replace', false);
[sampledADKTrainData, idxAD] = datasample(ADKTrainData, tmpPatients/2, 'Replace', false);

%first the control then the AD in random sample
sampledKTrainData = [sampledCOKTrainData; sampledADKTrainData];

figure(1)
%Kører for k (neighbors) fra 1 - 20
classError = zeros(20,1);
for k = 1:20
    KNNMdl = fitcknn(sampledKTrainData,label,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',0);
    rng(rngesus); % For reproducibility
    CVKNNMdl = crossval(KNNMdl);
    classError(k) = kfoldLoss(CVKNNMdl);
end
 plot(classError)

%finding the smallest index error

indexAll = [idxCO'; (idxAD'+50)];





