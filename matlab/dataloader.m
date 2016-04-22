function [DATA] = dataloader(NumberOfPatients)


%SKAL �NDRES TIL AT PASSE TIL LABELS!!!! 
%S� VENSTRE HIPPO OG H�JRE HIPPO
%Skal kigge p� hvem der er AD og hvem der er KONTROL

%Filtering AD from Control group
DATA = cell(NumberOfPatients,1); 
for i=1:NumberOfPatients
    if (mod(i,2) == 0)
        tmp = load(['datafile' num2str(i) '.mat']);
        DATA{i/2} = tmp.data_Derivations;
    else
        tmp = load(['datafile' num2str(i) '.mat']);
        DATA{NumberOfPatients/2 + ceil(i/2)} = tmp.data_Derivations;
    end
end