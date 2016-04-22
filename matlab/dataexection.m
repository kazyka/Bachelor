function [data_Derivations] = dataexection(start, finish)

%Finds the files in a folder, and then calc

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
        
        %Doing the calculation for GLCM
        %First doing GLCM2D and then the derivation
        data_Derivations = cell(120, 1);
        for k=1:120
            data_Derivations{k} =  derivations(data_load.GLCM2dDist{k}, 256);
        end
        
        save(sprintf('data/datafile%1d',i), 'data_Derivations'); 
        
        if (i == finish)
            fprintf('Done');
        end
    end
end