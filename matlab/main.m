%change current folder og kør koden under
addpath(fullfile(pwd,'data'));
addpath(fullfile(pwd,'olddata'));

load('labels.mat')

%KØR KUN HVIS DATA IKKE ER BLEVET KØRT FØR; ELLERS LOAD
%HVIS UDREGNINGSMETODEN ER ÆNDRET; SÅ SKAL DEN KØRES IGEN
%Kalder GLCM2D -> (glcm2dx,glcm2dy,glcm2dz) -> GLCM Toolbox
[data_Derivations] = dataexection(1,4);

%LOADER OG PLOTTER DATA
%Kalder dataloader -> loader fra data folder
[DATA] = simpleAllplot(4);



%1 left, 3 right?
%Hvem er AD og KONTROL?
tmp = 1;
leftA = zeros(50,1);
tmp2 = 1;
rightA = zeros(50,1);
for i = 1:100
    if (labels(i) == 1)
        leftA(tmp) = labels(i);
        tmp = tmp + 1;
    else
        rightA(tmp2) = labels(i);
        tmp2 = tmp2 + 1;
    end
end
















































%------------------------------------------------------
% for i = 1:1
%     % get allfiles matching the pattern 'dataset(i)_*'
%     files = dir(sprintf('data/%d.mat',i));
%     for j = 1:length(files)
%         %output for which file is loading currently
%         fprintf('Current file : %s\n',files(j).name)
%         
%         
%         %a = load(files(j).name);
%         %mri = a.mri;
%         %segmentation = a.segmentation;
%         
%         %tmp = load(sprintf('%d.mat',i));
%         %save(sprintf('datafile%1d',i), 'tmp');
%         
%         
%         %loads the file
%         data_load = GLCM2D(files(j).name,10);
%         
%         %Doing the calculation for GLCM
%         %First doing GLCM2D and then the derivation
%         data_Derivations = cell(120, 1);
%         for k=1:120
%             data_Derivations{k} =  derivations(data_load.GLCM2dDist{k}, 256);
%         end
%         
%         save(sprintf('data/datafile%1d',i), 'data_Derivations'); 
%     end
% end

%------------------------------------------------------
% 
% Metrics = cell(13,1);
% Metrics{1} = 'Angular Second Moment';
% Metrics{2} = 'Contrast';
% Metrics{3} = 'Correlation';
% Metrics{4} = 'Variance';
% Metrics{5} = 'Inverse Difference Moment';
% Metrics{6} = 'Sum Average';
% Metrics{7} = 'Sum Variance';
% Metrics{8} = 'Sum Entropy';
% Metrics{9} = 'Entropy';
% Metrics{10} = 'Difference Variance';
% Metrics{11} = 'Difference Entropy'; 
% Metrics{12} = 'Information measures of correlation1';
% Metrics{13} = 'Information measures of correlation2';
% %ulige er AD og lige er kontrol
% %Cell af patient data, først alle kontrol patienter derefter alle AD
% %patienter
% NumberOfPatients = 4;
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
% 
% %1-4 = x, 5-8=y og 9-12=z
% %alle angles, distance 10, asm variable, alle planer
% %Datasæt(patient*distance,angles,planes,metric(minus imoc_2))
% Dataset = zeros(NumberOfPatients*10,4,3,13);
% for i=1:4 %datasæt
%     for j=1:10 %distance
%         for m=1:3 %plans x,y,z
%             for k=1:4  %angles 0-135
%                 tmp = DATA(i);
%                 index = j+10*(i-1);
%                 Dataset(index,k,m,1) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_asm;
%                 Dataset(index,k,m,2) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_con;
%                 Dataset(index,k,m,3) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_corr;
%                 Dataset(index,k,m,4) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_var;
%                 Dataset(index,k,m,5) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_idm;
%                 Dataset(index,k,m,6) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_sa;
%                 Dataset(index,k,m,7) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_sv;
%                 Dataset(index,k,m,8) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_se;
%                 Dataset(index,k,m,9) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_en;
%                 Dataset(index,k,m,10) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_dv;
%                 Dataset(index,k,m,11) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_de;
%                 Dataset(index,k,m,12) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc1;
%                 %Dataset(j+10*(i-1),k,m,1) = tmp{1,1}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc2;
%             end
%         end
%     end
% end
% 
% for i = 1:12
%     simpleplot(Dataset,Metrics{i}, i);
% end

%------------------------------------------------------

%figure(1);
% angle0(angle0 == 0) = NaN;
%imgwhatevs = surf(GLCM2dDist1{1});
% figure(2);
% angle45(angle45 == 0) = NaN;
% imgwhatevs1 = surf(angle45);
% figure(3);
% angle90(angle90 == 0) = NaN;
% imgwhatevs2 = surf(angle90);
% figure(4);
% angle135(angle135 == 0) = NaN;
% imgwhatevs3 = surf(angle135);

%imgwhatevs = surf(glcm);

%
%Timeplan
%3D Image Texture Analysis
%Machine Learning
%Machine Learning 3D
%Forskel i slicing på 2D - Kun hvis tid

% 
%load('1.mat');
%img2D = imagesc(imfuse(mri(:,:,150),segmentation(:,:,150),'blend'));

% 
 %img2D2 = imagesc(squeeze(mri(:,100,:)));
 %figure;
 %img2D2 = imagesc(squeeze(mri(100,:,:)));
% colormap gray;

%
% [temp1, temp2, temp3] = mri(100,:,:);
% 
% S = permute(mri, [2 3 1]);
% 
% img2D2 = imagesc(S(:,:,150));


%Finder værdier


