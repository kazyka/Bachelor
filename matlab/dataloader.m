function [DATA2D, DATA3D] = dataloader(NumberOfPatients, Start, leftright, norm, erode)

%lefthright can be 'left' or 'right'
%norm can be 'normal' or 'normalize'
%erode can be 'noterode' or 'erode'

if (mod(NumberOfPatients,2) ~= 0)
    disp('ERROR: Input needs to be even')
    return;
end

load('labels.mat');


tmp1counter = 0;
tmp3counter = 0;
for i = 1:NumberOfPatients
    if (i <= NumberOfPatients/2) 
        tmp1counter = tmp1counter + 1;
    else
        tmp3counter = tmp3counter + 1;
    end
end
DATAones2D = cell(tmp1counter,1);
DATAones3D = cell(tmp1counter,1);
DATAthress2D = cell(tmp3counter,1);
DATAthress3D = cell(tmp3counter,1);


if (strcmp(leftright,'left') == 1)
    if (strcmp(norm, 'normal') == 1)
        if (strcmp(erode, 'erode') == 1)
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['left/normal/erode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normal/erode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['left/normal/erode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normal/erode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];
            
        else
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['left/normal/noterode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normal/noterode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['left/normal/noterode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normal/noterode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];
        end
    else
        if (strcmp(erode, 'erode') == 1)
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['left/normalize/erode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normalize/erode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['left/normalize/erode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normalize/erode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];
            
        else
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['left/normalize/noterode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normalize/noterode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['left/normalize/noterode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['left/normalize/noterode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];

        end
    end
else
    if (strcmp(norm, 'normal') == 1)
        if (strcmp(erode, 'erode') == 1)
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['right/normal/erode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normal/erode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['right/normal/erode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normal/erode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];
            
        else
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['right/normal/noterode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normal/noterode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['right/normal/noterode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normal/noterode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];
        end
    else
        if (strcmp(erode, 'erode') == 1)
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['right/normalize/erode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normalize/erode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['right/normalize/erode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normalize/erode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];
            
        else
            for i = Start:(tmp3counter+Start-1)
                tmp = load(['right/normalize/noterode/AD/2D/datafileAD' num2str(i) '.mat']);
                DATAthress2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normalize/noterode/AD/3D/datafileAD' num2str(i) '.mat']);
                DATAthress3D{i-Start+1} = tmp.data_Derivations3D;
            end
            for i = Start:(tmp1counter+Start-1)
                tmp = load(['right/normalize/noterode/CO/2D/datafileCO' num2str(i) '.mat']);
                DATAones2D{i-Start+1} = tmp.data_Derivations2D;
                tmp = load(['right/normalize/noterode/CO/3D/datafileCO' num2str(i) '.mat']);
                DATAones3D{i-Start+1} = tmp.data_Derivations3D;
            end

            DATA2D = [DATAones2D; DATAthress2D];
            DATA3D = [DATAones3D; DATAthress3D];

        end
    end
end
    

    
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