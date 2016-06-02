function [data_Derivations2D, data_Derivations3D] = datacalculation(start, finish, leftright, norm, erode)

%lefthright can be 'left' or 'right'
%norm can be 'normal' or 'normalize'
%erode can be 'noterode' or 'erode'


load('labels.mat');
name1 = start;
name3 = start;

for i = start:finish
    
    files = dir(sprintf('data/%d.mat',i));
    for j = 1:length(files)
        %output for which file is loading currently
        
        if (labels(i) == 1)
            fprintf('Current file : %s\n',files(j).name, 'labelCO')
        else
            fprintf('Current file : %s\n',files(j).name, 'labelAD')
        end
        
        
        %takes input of either left or right hippo and if it should be
        %eroded or not
        data_glcm2D = glcm2dFast(HippoMatrix(files(j).name, erode, leftright), 10);
        data_glcm3D = GLCM3D(HippoMatrix(files(j).name, erode, leftright),10);
        
        data_Derivations2D = cell(90, 1);
        data_Derivations3D = cell(130, 1);
        
        for k = 1:size(data_Derivations2D, 1)
            data_Derivations2D{k} = GLCMDerivations(data_glcm2D{k}, norm);
        end
        for k = 1:size(data_Derivations3D, 1)
            data_Derivations3D{k} = GLCMDerivations(data_glcm3D{k}, norm);
        end
        
        if (strcmp(leftright, 'left') == 1)
            if (strcmp(norm, 'normal') == 1)
                if (strcmp(erode, 'erode') == 1)
                    if (labels(i) == 3)
                        save(sprintf('left/normal/erode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('left/normal/erode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1
                    else
                        save(sprintf('left/normal/erode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('left/normal/erode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1
                    end
                else
                    if (labels(i) == 3)
                        save(sprintf('left/normal/noterode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('left/normal/noterode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1;
                    else
                        save(sprintf('left/normal/noterode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('left/normal/noterode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1;
                    end
                end
            else
                if (strcmp(erode, 'erode') == 1)
                    if (labels(i) == 3)
                        save(sprintf('left/normalize/erode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('left/normalize/erode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1;
                    else
                        save(sprintf('left/normalize/erode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('left/normalize/erode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1;
                    end
                else
                    if (labels(i) == 3)
                        save(sprintf('left/normalize/noterode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('left/normalize/noterode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1;
                    else
                        save(sprintf('left/normalize/noterode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('left/normalize/noterode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1;
                    end
                end
            end
        else
            if (strcmp(norm, 'normal') == 1)
                if (strcmp(erode, 'erode') == 1)
                    if (labels(i) == 3)
                        save(sprintf('right/normal/erode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('right/normal/erode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1;
                    else
                        save(sprintf('right/normal/erode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('right/normal/erode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1;
                    end
                else
                    if (labels(i) == 3)
                        save(sprintf('right/normal/noterode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('right/normal/noterode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1;
                    else
                        save(sprintf('right/normal/noterode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('right/normal/noterode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1;
                    end
                end
            else
                if (strcmp(erode, 'erode') == 1)
                    if (labels(i) == 3)
                        save(sprintf('right/normalize/erode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('right/normalize/erode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1;
                    else
                        save(sprintf('right/normalize/erode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('right/normalize/erode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1;
                    end
                else
                    if (labels(i) == 3)
                        save(sprintf('right/normalize/noterode/AD/2D/datafileAD%1d',name3), 'data_Derivations2D');
                        save(sprintf('right/normalize/noterode/AD/3D/datafileAD%1d',name3), 'data_Derivations3D');
                        name3 = name3 + 1;
                    else
                        save(sprintf('right/normalize/noterode/CO/2D/datafileCO%1d',name1), 'data_Derivations2D');
                        save(sprintf('right/normalize/noterode/CO/3D/datafileCO%1d',name1), 'data_Derivations3D');
                        name1 = name1 + 1;
                    end
                end
            end
        end 
        
        if (i == finish)
            fprintf('Done');
        end
    end
end