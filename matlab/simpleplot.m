function simpleplot(data, figname, variable_index)

%Plotter for data og variablen
%Distance 1-10, angle, plan, my_asm
figure('Name',figname,'NumberTitle','off')
NumberOfPatients = size(data,1)/10;
for k =1:9 %for alle angles
    if (7 < k)
        subplot(3,4,k+1);
    else
        subplot(3,4,k);
    end
    for i = 1:NumberOfPatients   %K�rer alle patients vi har
         if (i <= NumberOfPatients/2)
             plot(data((1+(i-1)*10):(10*i),k,variable_index), '- .k');
             hold on;
             data((1+(i-1)*10):(10*i),k,variable_index);
         else
             plot(data((1+(i-1)*10):(10*i),k,variable_index), '- .m');
             hold on;
             data((1+(i-1)*10):(10*i),k,variable_index);
         end
    end
    hold off;
    %axis([0 10 0 500])
end    