function [FeatureSelected] = ForwardSelection100(dataset,knearest, Rounds)
%The label setting
label = ones(10,1);
label(6:10) = 3;
label = [label; label; label; label; label; label; label; label; label; label];


NumberOfPatients = size(dataset,1);
NumberOfGLCMS = size(dataset,2);
NumberOfFeatures = size(dataset,3);
NumberOfDistances = size(dataset,4);

%evaluate = zeros(NumberOfGLCMS,NumberOfFeatures,NumberOfDistances);
FeatureSelected = zeros(15,4);
SelectedData = [];

%test = find(dataset(:,8,8,10) == 0);

for a = 1:Rounds
    
    %NumberOfPatients, GLCMS, features, distances
    tic;
    evaluate = zeros(NumberOfGLCMS,NumberOfFeatures,NumberOfDistances);
    for i=1:NumberOfGLCMS
        parfor j = 1:NumberOfFeatures
            for k = 1:NumberOfDistances
                if ~isempty(find(isnan(dataset(:,i,j,k))== 1, 1)) == 1
                        evaluate(i,j,k) = 0;
                else
                    if a == 1
                        evaluate(i,j,k) = knnWithCrossval100([],dataset(:,i,j,k),1);
                    else
                        evaluate(i,j,k) = knnWithCrossval100(SelectedData, dataset(:,i,j,k),knearest);
                    end
                end
            end
        end
    end
    
    [FeatureSelected(a,1), index] = max(evaluate(:));
    [FeatureSelected(a,2), FeatureSelected(a,3), FeatureSelected(a,4)] = ind2sub(size(evaluate),index);
    
    if a == 1
        SelectedData = dataset(:,FeatureSelected(a,2), FeatureSelected(a,3), FeatureSelected(a,4));
    else
        if FeatureSelected(a,1) >= FeatureSelected(a-1,1)
            SelectedData = horzcat(SelectedData, dataset(:,FeatureSelected(a,2), FeatureSelected(a,3), FeatureSelected(a,4)));
        else
            fprintf('Done after %d rounds \n', a)
            return;
        end
    end 
    dataset(:,FeatureSelected(a,2), FeatureSelected(a,3), FeatureSelected(a,4)) = NaN; 
    fprintf('Round: %d  done \n',a)
    toc;
end


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


% function [classError] = crossKNN(KTrainData, rngesus, label)
% 
% %find the size of the trainData
% % tmpPatients = size(KTrainData,1);
% 
% %Laver random sample uden replace og tilpasser labels dertil, n�r der skal
% %laves knn
% % [randomKTrainData, idx] = datasample(KTrainData, tmpPatients, 'Replace', false);
% % samplelabel = label(idx);
% 
% KNNMdl = fitcknn(KTrainData,label,'Distance','euclidean',...
%     'NumNeighbors',1,'Standardize',1);
% rng(rngesus); % For reproducibility
% CVKNNMdl = crossval(KNNMdl);
% classError = kfoldLoss(CVKNNMdl);
% end
