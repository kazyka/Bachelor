function simpleplot(data, figname, variable_index)

%Plotter for data og variablen
%Distance 1-10, angle, plan, my_asm
figure('Name',figname,'NumberTitle','off')
NumberOfPatients = size(data,1)/10;
for k =1:13 %for alle angles
    if k < 8    
        subplot(4,4,k);
    elseif k > 7 && k < 11
        subplot(4,4,k+1);
    else
        subplot(4,4,k+2);
    end
    for i = 1:NumberOfPatients   %Kører alle patients vi har
         if (i <= NumberOfPatients/2)
             h1a = plot(data((1+(i-1)*10):(10*i),k,variable_index), '- .b'); h1a.Color(4)=0.9;
             hold on;
             data((1+(i-1)*10):(10*i),k,variable_index);
         else
             alpha(1)
             h2a = plot(data((1+(i-1)*10):(10*i),k,variable_index), '- .r'); h2a.Color(4)=0.3;
             
             hold on;
             data((1+(i-1)*10):(10*i),k,variable_index);
         end
    end
    hold off;
    alpha(1)
    %axis([0 10 0 500])
end    