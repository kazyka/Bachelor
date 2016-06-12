function simpleplot(data, figname, variable_index)

Metrics = cell(9,1);
Metrics{1} = 'Slice X - (0 d)';
Metrics{2} = 'Slice X - (-d d)';
Metrics{3} = 'Slice X - (-d 0)';
Metrics{4} = 'Slice X - (-d -d)';
Metrics{5} = 'Slice Y - (-d d)';
Metrics{6} = 'Slice Y - (-d 0)';
Metrics{7} = 'Slice Y - (-d -d)';
Metrics{8} = 'Slice Z - (-d d)';
Metrics{9} = 'Slice Z - (-d -d)';



%Plotter for data og variablen
%Distance 1-10, angle, plan, my_asm
figure('Name',figname,'NumberTitle','off')
NumberOfPatients = size(data,1)/10;
for k =1:9 %for alle angles
    if (7 < k)
        subplot(3,4,k+1);
        title('test1');
    else
        subplot(3,4,k);
        title('test1')
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
end    