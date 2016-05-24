function [] = ForwardSelection(dataset,k)
%The label setting
label = ones(10,1);
label(6:10) = 3;
label = [label; label; label; label; label; label; label; label; label; label];

%tmp fil
dataset = dataSorted;

NumberOfFeatures = size(dataset,3);
NumberOfGLCMS = size(dataset,2);
NumberOfDistances = size(dataset,4);
NumberOfPatients = size(dataset,1);

evaluate = zeros(NumberOfGLCMS,NumberOfFeatures,NumberOfDistances);
test = ~isempty(find(isnan(dataset(:,1,1,1))== 1, 1));
SelectedData = [];

%NumberOfPatients, GLCMS, features, distances
tic;
for i=1:NumberOfGLCMS
    for j = 1:NumberOfFeatures
        for k = 1:NumberOfDistances
            if ~isempty(find(isnan(dataset(:,i,j,k))== 1, 1)) == 1
                evaluate(i,j,k) = 0;
            else
                evaluate(i,j,k) = 1 - crossKNN(dataset(:,i,j,k),1);
            end
        end
    end
end
toc;



% if isequal(selectedFeatures,zeros(size(dataset,1),1)) == 0
%     for i = 1:size(dataset,2)
%         tmp = [selectedFeatures dataset(:,i)];
%         Features(i) = crossKNN(tmp,5);
%     end
% else %first iteration
%     for i = 1:size(dataset,2)
%         Features(i) = 1 - crossKNN(dataset(:,i),5);
%     end    
% end
% [newAccuracy,featureIndex] = max(Features);
% 
% selectedDataset = [selectedFeatures dataset(:,featureIndex)];
% 
% dataset(:,featureIndex) = [];
% remaningDataset = dataset;
end
[luder luderidx] = ((max(evaluate)));


function [classError] = crossKNN(KTrainData, rngesus, label)

%find the size of the trainData
% tmpPatients = size(KTrainData,1);

%Laver random sample uden replace og tilpasser labels dertil, n�r der skal
%laves knn
% [randomKTrainData, idx] = datasample(KTrainData, tmpPatients, 'Replace', false);
% samplelabel = label(idx);

KNNMdl = fitcknn(KTrainData,label,'Distance','euclidean',...
    'NumNeighbors',1,'Standardize',1);
rng(rngesus); % For reproducibility
CVKNNMdl = crossval(KNNMdl);
classError = kfoldLoss(CVKNNMdl);
end
