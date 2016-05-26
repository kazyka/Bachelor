
NumberOfPatients = 100;
[DATA] = dataloader(NumberOfPatients,1,'normal');


%data(Patienter,GLCMS,Metrics,Distances)
[ForwardFeatureData] = forwardFeatureDataSort (DATA,NumberOfPatients);



dataholder = zeros(100, 10, 9, 13);


%(patienter, distance, GLCM, metrics)
for j = 1:13
    for i = 1:9
        %Distance
        for k = 1:10
            dataholder(:, k, i, j) = ForwardFeatureData(:,j,i,k);
        end
    end
end

testData = ForwardFeatureData(:,:,1,1);

[coeff,score,latent,tsquared,explained,mu] = pca(testData);