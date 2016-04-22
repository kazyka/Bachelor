function [DATA] = dataloader(NumberOfPatients)


%SKAL ÆNDRES TIL AT PASSE TIL LABELS!!!! 
%SÅ VENSTRE HIPPO OG HØJRE HIPPO
%Skal kigge på hvem der er AD og hvem der er KONTROL

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