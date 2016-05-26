function [DATA] = specialLoader(NumberOfPatients,Start)

if (mod(NumberOfPatients,2) ~= 0)
    disp('ERROR: Input needs to be even')
    return;
end

load('labels.mat')


tmp1counter = 0;
tmp3counter = 0;
for i = 1:NumberOfPatients
    if (i <= NumberOfPatients/2) 
        tmp1counter = tmp1counter + 1;
    else
        tmp3counter = tmp3counter + 1;
    end
end
DATAones = cell(tmp1counter,1);
DATAthress = cell(tmp3counter,1);



for i = Start:(tmp1counter+Start-1)
    tmp = load(['2dControlTest/datafileCO' num2str(i) '.mat']);
    DATAones{i-Start+1} = tmp.data_DerivationsErode;
end
for i = Start:(tmp3counter+Start-1)
    tmp = load(['2dADTest/datafileAD' num2str(i) '.mat']);
    DATAthress{i-Start+1} = tmp.data_DerivationsErode;
end


DATA = [DATAones; DATAthress];
    
end