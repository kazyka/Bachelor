function accuracy = knnWithCrossval (ChosenData, data,k)
label = ones(10,1);
label(6:10) = 3;
label90 = [label; label; label; label; label; label; label; label; label];

testKfolds = cell(10,1);
trainKfolds = cell(10,1);
chosenKfolds = cell(10,1);
chosenTrainKfolds = cell(10,1);
%Define kfolds
for i = 1:10
    testKfolds{i} = data(1+10*(i-1):i*10 ,:,:,:);
    if size(ChosenData,1) ~= 0
        chosenKfolds{i} = ChosenData(1+10*(i-1): i*10 ,:,:,:);
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
tmp = horzcat(chosenTrainKfolds{1},trainKfolds{1});
for i = 1:10
    if size(ChosenData,1) == 0
        knnmodels{i} = fitcknn(trainKfolds{i},label90,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',1);
    else
        knnmodels{i} = fitcknn(horzcat(chosenTrainKfolds{i},trainKfolds{i}),label90,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',1);
    end
end

accuracies = zeros(10,1);
for j = 1:10
    tmppredict = predict(knnmodels{j},testKfolds{j});
    for i = 1:10
        tmp = tmppredict(i) == label(i);
        accuracies(j) = accuracies(j) + tmp/10;
    end
end

accuracy = mean(accuracies);
end





