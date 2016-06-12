function [FeatureSelected] = ForwardSelection6040(dataset,knearest, Rounds)
%The label setting


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
    evaluate = zeros(NumberOfGLCMS,NumberOfFeatures,NumberOfDistances);
    for i=1:NumberOfGLCMS
        for j = 1:NumberOfFeatures
            for k = 1:NumberOfDistances
                if ~isempty(find(isnan(dataset(:,i,j,k))== 1, 1)) == 1
                        evaluate(i,j,k) = 0;
                else
                    if a == 1
                        evaluate(i,j,k) = knnWithCrossval6040([],dataset(:,i,j,k),1);
                    else
                        evaluate(i,j,k) = knnWithCrossval6040(SelectedData, dataset(:,i,j,k),knearest);
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
    dataset(:,FeatureSelected(a,2), FeatureSelected(a,3), :) = NaN; 
    fprintf('Round: %d  done \n',a)
end

end


