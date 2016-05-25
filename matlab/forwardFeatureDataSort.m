function [ForwardFeatureData] = forwardFeatureDataSort (DATA,NumberOfPatients)

datapoints = size(DATA{1},1);
GLCMS = datapoints / 10;
distances = datapoints / GLCMS;
features = length(fieldnames(DATA{1}{1}));

ForwardFeatureData = zeros(NumberOfPatients, GLCMS, features, distances);

for i = 1:NumberOfPatients 
    for j = 1:GLCMS
        for k = 1:distances 
            ForwardFeatureData(i,j,1,k) = DATA{i}{j+GLCMS*(k-1)}.angularSecondMoment;
            ForwardFeatureData(i,j,2,k) = DATA{i}{j+GLCMS*(k-1)}.contrast;
            ForwardFeatureData(i,j,3,k) = DATA{i}{j+GLCMS*(k-1)}.correlation;
            ForwardFeatureData(i,j,4,k) = DATA{i}{j+GLCMS*(k-1)}.variance;
            ForwardFeatureData(i,j,5,k) = DATA{i}{j+GLCMS*(k-1)}.inverseDifferenceMoment;
            ForwardFeatureData(i,j,6,k) = DATA{i}{j+GLCMS*(k-1)}.sumAverage;
            ForwardFeatureData(i,j,7,k) = DATA{i}{j+GLCMS*(k-1)}.sumVariance;
            ForwardFeatureData(i,j,8,k) = DATA{i}{j+GLCMS*(k-1)}.sumEntropy;
            ForwardFeatureData(i,j,9,k) = DATA{i}{j+GLCMS*(k-1)}.entropy;
            ForwardFeatureData(i,j,10,k) = DATA{i}{j+GLCMS*(k-1)}.differenceVariance;
            ForwardFeatureData(i,j,11,k) = DATA{i}{j+GLCMS*(k-1)}.differenceEntropy;
            ForwardFeatureData(i,j,12,k) = DATA{i}{j+GLCMS*(k-1)}.informationMeasuresOfCorrelation1;
            ForwardFeatureData(i,j,13,k) = DATA{i}{j+GLCMS*(k-1)}.informationMeasuresOfCorrelation2;
        end
    end
end










end