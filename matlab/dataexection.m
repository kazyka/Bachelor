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
              
        %loads the file
        data_load = glcm2dFast(LeftHippoMatrix(files(j).name, 'normal'), 10);
        data_3D = GLCM3D(LeftHippoMatrix(files(j).name, 'normal'),10);
        
        data_loadErode = glcm2dFast(LeftHippoMatrix(files(j).name, 'erode'), 10);
        data_3DErode = GLCM3DErode(LeftHippoMatrix(files(j).name, 'erode'),10);
        %Doing the calculation for GLCM
        %First doing GLCM2D and then the derivation
        data_Derivations = cell(120, 1);
        data_DerivationsErode = cell(120, 1);
        data_Derivations3D = cell(130, 1);
        data_Derivations3DErode = cell(130, 1);
        for k=1:120
            data_Derivations{k} =  GLCMDerivations(data_load{k});
            data_DerivationsErode{k} =  GLCMDerivations(data_loadErode{k});
        end
        for k=1:130
            data_Derivations3D{k} =  GLCMDerivations(data_3D{k});
            data_Derivations3DErode{k} =  GLCMDerivations(data_3DErode{k});
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