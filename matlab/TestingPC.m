
NumberOfPatients = 100;
[DATA] = dataloader(NumberOfPatients,1,'erode');


%data(Patienter,GLCMS,Metrics,Distances)
[ForwardFeatureData] = forwardFeatureDataSort (DATA,NumberOfPatients);


%----TESTER SAMLET-----%
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
%Antal, GLCM, METRICS
pcaholder = zeros(10, 9, 13);

for k = 1:11
    for i = 1:9
        if (isempty(pca(dataholder(:,:,i,k))) == 1)
            pcaholder(:,i,k) = NaN;
        else
            [~,~,~,~,pcaholder(:,i,k),~] = pca(dataholder(:,:,i,k));
        end
    end
end
%[~,~,~,~,pcaholder(:,6,12),~] = pca(dataholder(:,:,6,12));
[~,~,~,~,test,~] = pca(dataholder(:,:,6,12));
pcaholder(1:8,6,12) = test;
for k = 12
    for i = 7:9
        if (isempty(pca(dataholder(:,:,i,k))) == 1)
            pcaholder(:,i,k) = NaN;
        else
            [~,~,~,~,pcaholder(:,i,k),~] = pca(dataholder(:,:,i,k));
        end
    end
end
for k = 13
    for i = 1:9
        if (isempty(pca(dataholder(:,:,i,k))) == 1)
            pcaholder(:,i,k) = NaN;
        else
            [~,~,~,~,pcaholder(:,i,k),~] = pca(dataholder(:,:,i,k));
        end
    end
end

%----Splitter data-----
%AD og CO for sig selv
COForwardFeatureData = ForwardFeatureData(1:50,:,:,:);

COdataholder = zeros(50, 10, 9, 13);
%Sortere så (:, :, GLCM, Metric)
%Dvs at alle patienter bliver vist og så for Energy plan X angle 0, så
%vises alle 10 distance.
%(patienter, distance, GLCM, metrics)
for j = 1:13
    for i = 1:9
        %Distance
        for k = 1:10
            COdataholder(:, k, i, j) = COForwardFeatureData(:,i,j,k);
        end
    end
end
COpcaholder = zeros(10, 9, 13);
for k = 1:13
    for i = 1:9
        if (isempty(pca(COdataholder(:,:,i,k))) == 1)
            COpcaholder(:,i,k) = NaN;
        else
            [~,~,~,~,COpcaholder(1:size(pca(COdataholder(:,:,i,k)),2),i,k),~] = pca(COdataholder(:,:,i,k));
        end
    end
end


ADForwardFeatureData = ForwardFeatureData(51:100,:,:,:);


ADdataholder = zeros(50, 10, 9, 13);
%Sortere så (:, :, GLCM, Metric)
%Dvs at alle patienter bliver vist og så for Energy plan X angle 0, så
%vises alle 10 distance.
%(patienter, distance, GLCM, metrics)
for j = 1:13
    for i = 1:9
        %Distance
        for k = 1:10
            ADdataholder(:, k, i, j) = ADForwardFeatureData(:,i,j,k);
        end
    end
end
ADpcaholder = zeros(10, 9, 13);
for k = 1:13
    for i = 1:9
        if (isempty(pca(ADdataholder(:,:,i,k))) == 1)
            ADpcaholder(:,i,k) = NaN;
        else
            [~,~,~,~,ADpcaholder(1:size(pca(ADdataholder(:,:,i,k)),2),i,k),~] = pca(ADdataholder(:,:,i,k));
        end
    end
end




