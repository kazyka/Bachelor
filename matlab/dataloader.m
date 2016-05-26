function [DATA] = dataloader(NumberOfPatients,Start, var)

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


if (strcmp(var,'normal') == 1)

    for i = Start:(tmp1counter+Start-1)
        tmp = load(['CONTROL/datafileCO' num2str(i) '.mat']);
        DATAones{i-Start+1} = tmp.data_Derivations;
    end
    for i = Start:(tmp3counter+Start-1)
        tmp = load(['AD/datafileAD' num2str(i) '.mat']);
        DATAthress{i-Start+1} = tmp.data_Derivations;
    end

    DATA = [DATAones; DATAthress];
    
elseif (strcmp(var,'erode')  == 1)
    for i = 1:tmp1counter
        tmp = load(['ErodeCONTROL/datafileCO' num2str(i) '.mat']);
        DATAones{i} = tmp.data_DerivationsErode;
    end
    for i = 1:tmp3counter
        tmp = load(['ErodeAD/datafileAD' num2str(i) '.mat']);
        DATAthress{i} = tmp.data_DerivationsErode;
    end
    DATA = [DATAones; DATAthress];
    
elseif (strcmp(var, '3D') || strcmp(var, '3d'))  == 1
    for i = Start:(tmp1counter+Start-1)
    tmp = load(['3DCONTROL/datafileCO' num2str(i) '.mat']);
    DATAones{i-Start+1} = tmp.data_Derivations3D;
    end
    for i = Start:(tmp3counter+Start-1)
        tmp = load(['3DAD/datafileAD' num2str(i) '.mat']);
        DATAthress{i-Start+1} = tmp.data_Derivations3D;
    end

    DATA = [DATAones; DATAthress];
    
elseif (strcmp(var, '3Derode') || strcmp(var, '3derode'))  == 1
    for i = Start:(tmp1counter+Start-1)
    tmp = load(['3DErodeCONTROL/datafileCO' num2str(i) '.mat']);
    DATAones{i-Start+1} = tmp.data_Derivations3DErode;
    end
    for i = Start:(tmp3counter+Start-1)
        tmp = load(['3DErodeAD/datafileAD' num2str(i) '.mat']);
        DATAthress{i-Start+1} = tmp.data_Derivations3DErode;
    end

    DATA = [DATAones; DATAthress];
    
end

















%------------GAMMEL KODE-------------------


%SKAL ÆNDRES TIL AT PASSE TIL LABELS!!!! PASSER NU, IKKE?
%
%Skal kigge på hvem der er AD og hvem der er KONTROL

% %Filtering AD from Control group
% DATA = cell(NumberOfPatients,1); 
% for i=1:NumberOfPatients
%     if (labels(i) == 1)
%         tmp = load(['datafile' num2str(i) '.mat']);
%         DATA{i/2} = tmp.data_Derivations;
%     else
%         tmp = load(['datafile' num2str(i) '.mat']);
%         DATA{NumberOfPatients/2 + ceil(i/2)} = tmp.data_Derivations;
%     end
% end


%ulige er AD og lige er kontrol
%Cell af patient data, først alle kontrol patienter derefter alle AD
%patienter
%NumberOfPatients = 4;


%SKAL ÆNDRES TIL AT PASSE TIL LABELS!!!!
%Labels kører fra [3, 1, 3, 1, 3, 1, 1, 1, ...]
% DATA = cell(NumberOfPatients,1); 
% for i=1:NumberOfPatients
%     if (mod(i,2) == 0)
%         tmp = load(['datafile' num2str(i) '.mat']);
%         DATA{i/2} = tmp.data_Derivations;
%     else
%         tmp = load(['datafile' num2str(i) '.mat']);
%         DATA{NumberOfPatients/2 + ceil(i/2)} = tmp.data_Derivations;
%     end
% end