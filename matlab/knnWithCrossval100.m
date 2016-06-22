function accuracy = knnWithCrossval100 (ChosenData, data,k)
label = ones(10,1);
label(6:10) = 3;
label90 = [label; label; label; label; label; label; label; label; label];
accuracy = 0;
index = transpose(1:50);
parfor a = 1:100
    [idx, ~] = datasample(index, 50, 'Replace', false);  
    testKfolds = cell(10,1);
    trainKfolds = cell(10,1);
    chosenKfolds = cell(10,1);
    chosenTrainKfolds = cell(10,1);    
     %Define kfolds
    for i = 1:10
        tmpAD = [];
        tmpCON = [];
        ChotmpAD = [];
        ChotmpCON = [];
        for j = 1:5
            tmpAD = vertcat(tmpAD,data(50+idx(j+5*(i-1)),1));
            tmpCON = vertcat(tmpCON,data(idx(j+5*(i-1)),1));
            if size(ChosenData,1) ~= 0
                ChotmpAD = vertcat(ChotmpAD,data(50+idx(j+5*(i-1)),:));
                ChotmpCON = vertcat(ChotmpCON,data(idx(j+5*(i-1)),:));
            end
        end
        testKfolds{i} = vertcat(tmpCON,tmpAD);
        if size(ChosenData,1) ~= 0
            chosenKfolds{i} = vertcat(ChotmpCON,ChotmpAD);
        end

    end

    %Define trait set
    for i = 1:10
        for j = 1:10
            if i ~= j
                trainKfolds{i} = [trainKfolds{i}; testKfolds{j};];
                chosenTrainKfolds{i} = [chosenTrainKfolds{i}; chosenKfolds{j}];
            end
        end
    end   
    knnmodels = cell(10,1);
    %tmp = horzcat(chosenTrainKfolds{1},trainKfolds{1});
    for i = 1:10
        if size(ChosenData,1) == 0
            knnmodels{i} = fitcknn(trainKfolds{i},label90,'Distance','euclidean',...
            'NumNeighbors',k,'Standardize',1);
        else
            knnmodels{i} = fitcknn(horzcat(trainKfolds{i},chosenTrainKfolds{i}),label90,'Distance','euclidean',...
            'NumNeighbors',k,'Standardize',1);
        end
    end
    
    
    accuracies = zeros(10,1);
    for j = 1:10
        tmppredict = predict(knnmodels{j},horzcat(testKfolds{j},chosenKfolds{j}));
        for i = 1:10
            tmp = tmppredict(i) == label(i);
            accuracies(j) = accuracies(j) + tmp/10;
        end
    end
    accuracy = accuracy + mean(accuracies);
    
end


accuracy = accuracy/100;





end





