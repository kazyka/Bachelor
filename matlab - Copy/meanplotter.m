function meanplotter(data, figname, VARIABLE)


NumberOfPatients = size(data,1)/10;

tmpCO = zeros(10,NumberOfPatients/2,4,3,13);
tmpAD = zeros(10,NumberOfPatients/2,4,3,13);

for i = 1:NumberOfPatients
    for j=1:10
        for m =1:3
            for k=1:4
                if (i <= NumberOfPatients/2)
                    tmpCO(j,i,k,m,VARIABLE) = data(j+10*(i-1),k,m,VARIABLE);
                else
                    tmpAD(j,i-(NumberOfPatients/2),k,m,VARIABLE) =  data(j+10*(i-1),k,m,VARIABLE);
                end
            end
        end
    end
end


%Calculate means of AD, control and together
meanCO = mean(tmpCO,2);
meanAD = mean(tmpAD,2);
meanALL = mean([meanCO  meanAD],2);
    
figure('Name',figname,'NumberTitle','off')
for angle = 1:4
    for xyz = 1:3
        subplot(3,4,angle+(4*(xyz-1)));
        plot(meanCO(:,:,angle,xyz,VARIABLE),'- .k')
        hold on;
        plot(meanAD(:,:,angle,xyz,VARIABLE),'- .m')
        plot(meanALL(:,:,angle,xyz,VARIABLE),'- .g')
        hold off
    end
end 