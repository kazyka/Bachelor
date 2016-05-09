function [data_Derivations] = dataexection(start, finish)

%Finds the files in a folder, and then calc

load('labels.mat')
name1 = 1;
name3 = 1;
for i = start:finish
    % get allfiles matching the pattern 'dataset(i)_*'
    files = dir(sprintf('data/%d.mat',i));
    for j = 1:length(files)
        %output for which file is loading currently
        fprintf('Current file : %s\n',files(j).name)
        
        
        %a = load(files(j).name);
        %mri = a.mri;
        %segmentation = a.segmentation;
        
        %tmp = load(sprintf('%d.mat',i));
        %save(sprintf('datafile%1d',i), 'tmp');
        
        
        %loads the file
        data_load = GLCM2D(files(j).name,10);
        data_3D = GLCM3D(files(j).name,10);
        
        data_loadErode = GLCM2DErode(files(j).name,10);
        data_3DErode = GLCM3DErode(files(j).name,10);
        %Doing the calculation for GLCM
        %First doing GLCM2D and then the derivation
        data_Derivations = cell(120, 1);
        data_DerivationsErode = cell(120, 1);
        data_Derivations3D = cell(130, 1);
        data_Derivations3DErode = cell(130, 1);
        for k=1:120
            data_Derivations{k} =  derivations(data_load.GLCM2dDist{k}, 256);
            data_DerivationsErode{k} =  derivations(data_loadErode.GLCM2dDist{k}, 256);
        end
        for k=1:130
            data_Derivations3D{k} =  derivations(data_3D{k}, 256);
            data_Derivations3DErode{k} =  derivations(data_3DErode{k}, 256);
        end
        
        if (labels(i) == 3)
            save(sprintf('AD/datafileAD%1d',name1), 'data_Derivations');
            save(sprintf('3DAD/datafileAD%1d',name1), 'data_Derivations3D');
            save(sprintf('ErodeAD/datafileAD%1d',name1), 'data_DerivationsErode');
            save(sprintf('3DErodeAD/datafileAD%1d',name1), 'data_Derivations3DErode');
            name1 = name1 + 1;
        else
            save(sprintf('CONTROL/datafileCO%1d',name3), 'data_Derivations');
            save(sprintf('3DCONTROL/datafileCO%1d',name3), 'data_Derivations3D');
            save(sprintf('ErodeCONTROL/datafileCO%1d',name3), 'data_DerivationsErode');
            save(sprintf('3DErodeCONTROL/datafileCO%1d',name3), 'data_Derivations3DErode');
            name3 = name3 + 1;
        end
        
        if (i == finish)
            fprintf('Done');
        end
    end
end