function [DATA] = simpleAllplot(DATA, NumberOfPatients ,looping, var)
%SIMPLEALLPLOT loads the datafiles and then plots them
%NumberOfPatients should be an even number
%
%looping should be between 1 and 13, for the number of variables you wish
%to loop through
%
%both is if you wish to plot all the variables or only the mean or both


if (mod(NumberOfPatients,2) ~= 0)
    disp('ERROR: Input needs to be even. STOPPING FUNCTION')
    return;
end

if (looping > 13) || (looping < 1)
    disp('ERROR: Input needs to be between 1 and 13. STOPPING FUNCTION')
    return;
end

if (strcmp(var,'simple') && strcmp(var,'mean') && strcmp(var,'both') ~= 1)
    disp('ERROR: Input needs to be simple, mean or both. STOPPING FUNCTION')
    return;
end



%LOADS AND PLOTS THE DATA
%defines names for figures, puts the controle first in a cell then all the
%AD and then plots
%If the number of arguments are 1, then it will not plot the plots
%for all the metrics. Just do the calculation


Metrics = cell(13,1);
Metrics{1} = 'Angular Second Moment';
Metrics{2} = 'Contrast';
Metrics{3} = 'Correlation';
Metrics{4} = 'Variance';
Metrics{5} = 'Inverse Difference Moment';
Metrics{6} = 'Sum Average';
Metrics{7} = 'Sum Variance';
Metrics{8} = 'Sum Entropy';
Metrics{9} = 'Entropy';
Metrics{10} = 'Difference Variance';
Metrics{11} = 'Difference Entropy'; 
Metrics{12} = 'Information measures of correlation1';
Metrics{13} = 'Information measures of correlation2';


%1-4 = x, 5-8=y og 9-12=z
%alle angles, distance 10, variable, alle planer
%Datasæt(patient*distance,angles,planes,metric)
%NumberOfPatients = 10;
Dataset = zeros(NumberOfPatients*10,4,3,13);
for i=1:NumberOfPatients %datasæt
    for j=1:10 %distance
        for m=1:3 %plans x,y,z
            for k=1:4  %angles 0-135
%                 tmp = DATA(i);
                index = j+10*(i-1); %For distance 1..10
                Dataset(index,k,m,1) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.angularSecondMoment;
                Dataset(index,k,m,2) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.contrast;
                Dataset(index,k,m,3) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.correlation;
                Dataset(index,k,m,4) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.variance;
                Dataset(index,k,m,5) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.inverseDifferenceMoment;
                Dataset(index,k,m,6) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.sumAverage;
                Dataset(index,k,m,7) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.sumVariance;
                Dataset(index,k,m,8) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.sumEntropy;
                Dataset(index,k,m,9) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.entropy;
                Dataset(index,k,m,10) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.differenceVariance;
                Dataset(index,k,m,11) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.differenceEntropy;
                Dataset(index,k,m,12) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.informationMeasuresOfCorrelation1;
                Dataset(index,k,m,13) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.informationMeasuresOfCorrelation2;
            end
        end
    end
end


if (strcmp(var, 'simple') == 1)
    for i = 1:looping
        simpleplot(Dataset,Metrics{i}, i);
    end
elseif (strcmp(var, 'mean') == 2)
    for i = 1:looping
        meanplotter(Dataset,Metrics{i}, i);
    end
end

if (strcmp(var, 'both') == 3) 
    for i = 1:looping
        simpleplot(Dataset,Metrics{i}, i);
        meanplotter(Dataset,Metrics{i}, i);
    end
end

