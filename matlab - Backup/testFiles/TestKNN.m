numberSample = 40;
A = ones(numberSample,1);
B = zeros(numberSample,1);
B(B==0) = 3;
[label] = [A; B];

NumberOfPatients = 100;
[DATATrain] = dataloader(NumberOfPatients,1);
KTrainData = knndatasort2D(DATATrain,NumberOfPatients,1,1,3);
% Class = fitcknn(KTrainData, DATATrainY,'NumNeighbors',1,'Standardize',1);
COKTrainData = KTrainData(1:50,:);
ADKTrainData = KTrainData(51:100,:);

[randomCOKTrainData, idxCO] = datasample(COKTrainData, numberSample, 'Replace', false);
[randomADKTrainData, idxAD] =datasample(ADKTrainData, numberSample, 'Replace', false);

randomKTrainData = [randomCOKTrainData; randomADKTrainData];

figure(1)
classError = zeros(20,1);
for k = 1:20
    KNNMdl = fitcknn(randomKTrainData,label,'Distance','euclidean',...
        'NumNeighbors',k,'Standardize',0);
    rng(1); % For reproducibility
    CVKNNMdl = crossval(KNNMdl);
    classError(k) = kfoldLoss(CVKNNMdl);
end
plot(classError)
%Samler index af kontrol og AD
indexAll = [idxCO'; (idxAD'+50)];

figure(2)
accuracy = zeros(20,1);
for k = 1:20
    KNNMdl = fitcknn(randomKTrainData,label,'Distance','euclidean',...
            'NumNeighbors',k,'Standardize',0);
    %fjerner data der er brugt.
    restKTrainData = KTrainData;
    restKTrainData(indexAll, :) = [];
    %Finder de resterende index
    tmpvec = 1:100;
    tmpvec(indexAll) = [];
    %Sætter 1:50 = 1 og 51:100 = 3
    tmpidx = ones(100,1);
    tmpidx(51:100) = 3;
    %De resterende labels
    restLABELS = tmpidx(tmpvec);
    
    %predicter på de resterende data
    tmppredict = zeros(20,1);
    for i = 1:20
        predictTEST = predict(KNNMdl, restKTrainData(i,:));
        tmppredict(i) = predictTEST == restLABELS(i);
    end
    %Får en accuracy der fortæller hvor præcis vores model er
    accuracy(k) = sum(tmppredict)/length(tmppredict);
end
plot(accuracy)
