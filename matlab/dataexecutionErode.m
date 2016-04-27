function [data_Derivations] = dataexecutionErode(start, finish)

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
        data_load = GLCM2DErode(files(j).name,10);
        
        %Doing the calculation for GLCM
        %First doing GLCM2D and then the derivation
        data_Derivations = cell(120, 1);
        for k=1:120
            data_Derivations{k} =  derivations(data_load.GLCM2dDist{k}, 256);
        end
        
        if (labels(i) == 3)
            save(sprintf('ErodeAD/ErodedatafileAD%1d',name1), 'data_Derivations');
            name1 = name1 + 1;
        else
            save(sprintf('ErodeCONTROL/ErodedatafileCO%1d',name3), 'data_Derivations');
            name3 = name3 + 1;
        end
        
        if (i == finish)
            fprintf('Done');
        end
    end
end