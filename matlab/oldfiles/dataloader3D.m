function [DATA] = dataloader3D(NumberOfPatients,Start)

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
    tmp = load(['3DCONTROL/datafileCO' num2str(i) '.mat']);
    DATAones{i-Start+1} = tmp.data_Derivations;
end
for i = Start:(tmp3counter+Start-1)
    tmp = load(['3DAD/datafileAD' num2str(i) '.mat']);
    DATAthress{i-Start+1} = tmp.data_Derivations;
end

DATA = [DATAones; DATAthress];

















%------------GAMMEL KODE-------------------


%SKAL �NDRES TIL AT PASSE TIL LABELS!!!! PASSER NU, IKKE?
%
%Skal kigge p� hvem der er AD og hvem der er KONTROL

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
%Cell af patient data, f�rst alle kontrol patienter derefter alle AD
%patienter
%NumberOfPatients = 4;


%SKAL �NDRES TIL AT PASSE TIL LABELS!!!!
%Labels k�rer fra [3, 1, 3, 1, 3, 1, 1, 1, ...]
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