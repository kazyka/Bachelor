function meanplotter(data, figname, VARIABLE)
% data = Dataset;
% figname = 'test';
% VARIABLE = 13;
NumberOfPatients = size(data,1)/10;

tmpCO = zeros(10,NumberOfPatients/2,9,13);
tmpAD = zeros(10,NumberOfPatients/2,9,13);

for i = 1:NumberOfPatients
    for j=1:10 %Distance
        for m =1:9 %plane
            if (i <= NumberOfPatients/2)
                tmpCO(j,i,m,VARIABLE) = data(j+10*(i-1),m,VARIABLE);
            else
                tmpAD(j,i-(NumberOfPatients/2),m,VARIABLE) =  data(j+10*(i-1),m,VARIABLE);
            end
        end
    end
end


%Calculate means of AD, control and together
meanCO = mean(tmpCO,2);
meanAD = mean(tmpAD,2);
meanALL = mean([meanCO  meanAD],2);
    
figure('Name',figname,'NumberTitle','off')
for i = 1:9
    if (7 < i)
        subplot(3,4,i+1);
    else
        subplot(3,4,i);
    end
    plot(meanCO(:,:,i,VARIABLE),'- .k')
    hold on;
    plot(meanAD(:,:,i,VARIABLE),'- .m')
    plot(meanALL(:,:,i,VARIABLE),'- .g')
    hold off

end 