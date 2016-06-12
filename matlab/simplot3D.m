function simplot3D(data, figname, variable_index)


Metrics = cell(13,1);
Metrics{1} = 'Offset - (d 0 0)';
Metrics{2} = 'Offset - (d 0 d)';
Metrics{3} = 'Offset - (0 0 d)';
Metrics{4} = 'Offset - (-d 0 d)';
Metrics{5} = 'Offset - (d -d 0)';
Metrics{6} = 'Offset - (d -d d)';
Metrics{7} = 'Offset - (0 -d d)';
Metrics{8} = 'Offset - (-d -d d)';
Metrics{9} = 'Offset - (-d -d 0)';
Metrics{10} = 'Offset - (-d -d -d)';
Metrics{11} = 'Offset - (0 -d -d)';
Metrics{12} = 'Offset - (d -d -d)';
Metrics{13} = 'Offset - (0 -d 0)';



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
             title(Metrics{k});
         else
             alpha(1)
             h2a = plot(data((1+(i-1)*10):(10*i),k,variable_index), '- .r'); h2a.Color(4)=0.3;
             
             hold on;
         end
    end
    hold off;
    alpha(1)
    %axis([0 10 0 500])
end    