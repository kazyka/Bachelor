function [DATA] = dataloaderErode(NumberOfPatients)

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
for i = 1:tmp1counter
    tmp = load(['ErodeCONTROL/ErodedatafileCO' num2str(i) '.mat']);
    DATAones{i} = tmp.data_Derivations;
end
for i = 1:tmp3counter
    tmp = load(['ErodeAD/ErodedatafileAD' num2str(i) '.mat']);
    DATAthress{i} = tmp.data_Derivations;
end

DATA = [DATAones; DATAthress];

