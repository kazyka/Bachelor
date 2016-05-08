function [accuracymodel] = testKNN(sampledKTrainData, KTrainData, indexAll, k, label)
%DOC


if (k > 0)
    KNNMdl = fitcknn(sampledKTrainData,label,'Distance','euclidean',...
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
    accuracymodel = sum(tmppredict)/length(tmppredict);
else
    accuracymodel = zeros((100-size(label,1)),1);
    k = 1;
    for k = 1:20
        KNNMdl = fitcknn(sampledKTrainData,label,'Distance','euclidean',...
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
        accuracymodel(k) = sum(tmppredict)/length(tmppredict);
    end
end
    
    