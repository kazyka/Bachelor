function [DATA] = simpleAllplot(NumberOfPatients)

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


[DATA] = dataloader(NumberOfPatients);

%1-4 = x, 5-8=y og 9-12=z
%alle angles, distance 10, asm variable, alle planer
%Datasæt(patient*distance,angles,planes,metric(minus imoc_2))
Dataset = zeros(NumberOfPatients*10,4,3,13);
for i=1:4 %datasæt
    for j=1:10 %distance
        for m=1:3 %plans x,y,z
            for k=1:4  %angles 0-135
                tmp = DATA(i);
                index = j+10*(i-1);
                Dataset(index,k,m,1) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_asm;
                Dataset(index,k,m,2) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_con;
                Dataset(index,k,m,3) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_corr;
                Dataset(index,k,m,4) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_var;
                Dataset(index,k,m,5) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_idm;
                Dataset(index,k,m,6) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_sa;
                Dataset(index,k,m,7) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_sv;
                Dataset(index,k,m,8) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_se;
                Dataset(index,k,m,9) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_en;
                Dataset(index,k,m,10) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_dv;
                Dataset(index,k,m,11) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_de;
                Dataset(index,k,m,12) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc1;
                %Dataset(j+10*(i-1),k,m,1) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc2;
            end
        end
    end
end

    

for i = 1:12
    simpleplot(Dataset,Metrics{i}, i);
end




