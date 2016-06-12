function accuracy = knnWithCrossval6040 (ChosenData, data,k)
label = ones(6,1);
label(4:6) = 3;
label60 = [label; label; label; label; label; label; label; label; label];

testKfolds = cell(10,1);
trainKfolds = cell(10,1);
chosenKfolds = cell(10,1);
chosenTrainKfolds = cell(10,1);
%Define kfolds
for i = 1:10
    testKfolds{i} = data(1+6*(i-1):i*6 ,:,:,:);
    if size(ChosenData,1) ~= 0
        chosenKfolds{i} = ChosenData(1+6*(i-1): i*6 ,:,:,:);
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
        knnmodels{i} = fitcknn(trainKfolds{i},label60,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',1);
    else
        knnmodels{i} = fitcknn(horzcat(trainKfolds{i},chosenTrainKfolds{i}),label60,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',1);
    end
end

accuracies = zeros(10,1);
for j = 1:10
    tmppredict = predict(knnmodels{j},horzcat(testKfolds{j},chosenKfolds{j}));
    for i = 1:6
        tmp = tmppredict(i) == label(i);
        accuracies(j) = accuracies(j) + tmp/10;
    end
end

accuracy = mean(accuracies);
end





