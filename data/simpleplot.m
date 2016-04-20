function simpleplot(data, figname, variable_index)

%Plotter for data og variablen
%Distance 1-10, angle, plan, my_asm
figure('Name',figname,'NumberTitle','off')
NumberOfPatients = size(data,1)/10;
for k =1:3
    for j = 1:4
        subplot(3,4,j+(4*(k-1)));
        for i = 1:NumberOfPatients   
             if (i <= NumberOfPatients/2)
                 plot(data(1+(i-1)*10:10*i,j,k,variable_index), '- .k');
                 hold on;
             else
                 plot(data(1+(i-1)*10:10*i,j,k,variable_index), '- .m');
                 hold on;
             end
        end
        hold off;
        %axis([0 10 0 5000])
    end
end    