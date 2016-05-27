
NumberOfPatients = 100;
[DATA] = dataloader(NumberOfPatients,1,'erode');


%data(Patienter,GLCMS,Metrics,Distances)
[ForwardFeatureData] = forwardFeatureDataSort (DATA,NumberOfPatients);


%AD og CO for sig selv
COFFD = ForwardFeatureData(1:50);
ADFFD = ForwardFeatureData(51:100);



dataholder = zeros(100, 10, 9, 13);
%Sortere så (:, :, GLCM, Metric)
%Dvs at alle patienter bliver vist og så for Energy plan X angle 0, så
%vises alle 10 distance.
%(patienter, distance, GLCM, metrics)
for j = 1:13
    for i = 1:9
        %Distance
        for k = 1:10
            dataholder(:, k, i, j) = ForwardFeatureData(:,i,j,k);
        end
    end
end

%Da distance 10, så højst 10 explained og alle 3 features bliver vist for 1
%metric
pcaholder = zeros(10, 9, 13);

for k = 1:13
    for i = 1:9
        if (isempty(pca(dataholder(:,:,i,k))) == 1)
            pcaholder(:,i,k) = NaN;
        else
            [~,~,~,~,pcaholder(:,i,k),~] = pca(dataholder(:,:,i,k));
        end
    end
end

[~,~,~,~,test,~] = pca(dataholder(:,:,4,12));



pcaholder = mean(pcaholder,2);