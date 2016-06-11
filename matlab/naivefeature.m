function [FeatureSelected] = ForwardSelection2(dataset,knearest, Rounds)
%The label setting
label = ones(10,1);
label(6:10) = 3;
label = [label; label; label; label; label; label; label; label; label; label];


NumberOfPatients = size(dataset,1);
NumberOfGLCMS = size(dataset,2);
NumberOfFeatures = size(dataset,3);
NumberOfDistances = size(dataset,4);
evaluate = zeros(NumberOfGLCMS,NumberOfFeatures,NumberOfDistances,Rounds);

%evaluate = zeros(NumberOfGLCMS,NumberOfFeatures,NumberOfDistances);
FeatureSelected = zeros(15,4);
SelectedData = [];

%test = find(dataset(:,8,8,10) == 0);

for a = 1:Rounds
    
    %NumberOfPatients, GLCMS, features, distances
    evaluate = zeros(NumberOfGLCMS,NumberOfFeatures,NumberOfDistances,a);
    for i=1:NumberOfGLCMS
        for j = 1:NumberOfFeatures
            for k = 1:NumberOfDistances
                if a == 1
                    evaluate(i,j,k) = knnWithCrossval2([],dataset(:,i,j,k),1);
                else
                    evaluate(i,j,k) = knnWithCrossval2(SelectedData, dataset(:,i,j,k),knearest);
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
            fprintf('quickFix \n', a)
            %return;
        end
    end 
    dataset(:,FeatureSelected(a,2), FeatureSelected(a,3), FeatureSelected(a,4)) = NaN; 
    fprintf('Round: %d  done \n',a)
end


end

