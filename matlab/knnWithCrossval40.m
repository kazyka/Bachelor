function accuracy = knnWithCrossval40 (ChosenData, data,k)
label = ones(4,1);
label(3:4) = 3;
label40 = [label; label; label; label; label; label; label; label; label];

testKfolds = cell(10,1);
trainKfolds = cell(10,1);
chosenKfolds = cell(10,1);
chosenTrainKfolds = cell(10,1);
%Define kfolds
for i = 1:10
    testKfolds{i} = data(1+4*(i-1):i*4 ,:,:,:);
    if size(ChosenData,1) ~= 0
        chosenKfolds{i} = ChosenData(1+6*(i-1): i*4 ,:,:,:);
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
        knnmodels{i} = fitcknn(trainKfolds{i},label40,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',1);
    else
        knnmodels{i} = fitcknn(horzcat(trainKfolds{i},chosenTrainKfolds{i}),label40,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',1);
    end
end

accuracies = zeros(10,1);
for j = 1:10
    tmppredict = predict(knnmodels{j},horzcat(testKfolds{j},chosenKfolds{j}));
    for i = 1:4
        tmp = tmppredict(i) == label(i);
        accuracies(j) = accuracies(j) + tmp/4;
    end
end

accuracy = mean(accuracies);
end





