%change current folder og kør koden under
%RUN THESE FIRST
addpath(fullfile(pwd,'data'));
addpath(fullfile(pwd,'AD'));
addpath(fullfile(pwd,'CONTROL'));
addpath(fullfile(pwd,'ErodeAD'));
addpath(fullfile(pwd,'ErodeCONTROL'));
addpath(fullfile(pwd,'olddata'));
addpath(fullfile(pwd,'testFiles'));
% load('labels.mat')

%KØR KUN HVIS DATA IKKE ER BLEVET KØRT FØR; ELLERS LOAD
%HVIS UDREGNINGSMETODEN ER ÆNDRET; SÅ SKAL DEN KØRES IGEN
%Kalder GLCM2D -> (glcm2dx,glcm2dy,glcm2dz) -> GLCM Toolbox
[data_Derivations] = dataexection(1,100);
[data_DerivationsErode] = dataexecutionErode(1,100);

%Huske huske
%anglex0 = angley0
%angley90 = anglez90
%transpose(anglex90) = anglez90

%LoadData
NumberOfPatients = 10;
[DATA] = dataloader(NumberOfPatients,1);
[DATAErode] = dataloaderErode(NumberOfPatients,1);
%LOADER OG PLOTTER DATA
%Kalder dataloader -> loader fra data folder
simpleAllplot(DATA, NumberOfPatients, 12, 1);





%-----KNN---------------



NumberOfPatients = 100;
[DATATrain] = dataloader(NumberOfPatients,1);
KTrainData = knndatasort2D(DATATrain,NumberOfPatients,1,1,3);
figure(1)
[trainedData, indexAll, label] = trainKNN(KTrainData, 6);
figure(2)
[accuracymodel] = testKNN(trainedData, KTrainData, indexAll, 1, label);






%------LEGACY-------

% numberSample = 45;
% A = ones(numberSample,1);
% B = zeros(numberSample,1);
% B(B==0) = 3;
% [label] = [A; B];
% 
% NumberOfPatients = 100;
% [DATATrain] = dataloader(NumberOfPatients,1);
% KTrainData = knndatasort2D(DATATrain,NumberOfPatients,1,1,3);
% % Class = fitcknn(KTrainData, DATATrainY,'NumNeighbors',1,'Standardize',1);
% COKTrainData = KTrainData(1:50,:);
% ADKTrainData = KTrainData(51:100,:);
% 
% [randomCOKTrainData, idxCO] = datasample(COKTrainData, numberSample, 'Replace', false);
% [randomADKTrainData, idxAD] =datasample(ADKTrainData, numberSample, 'Replace', false);
% 
% randomKTrainData = [randomCOKTrainData; randomADKTrainData];
% 
% figure(1)
% classError = zeros(20,1);
% for k = 1:20
%     KNNMdl = fitcknn(randomKTrainData,label,'Distance','euclidean',...
%         'NumNeighbors',k,'Standardize',0);
%     rng(1); % For reproducibility
%     CVKNNMdl = crossval(KNNMdl);
%     classError(k) = kfoldLoss(CVKNNMdl);
% end
% plot(classError)
% %Samler index af kontrol og AD
% indexAll = [idxCO'; (idxAD'+50)];
% 
% figure(2)
% accuracy = zeros(20,1);
% for k = 1:20
%     KNNMdl = fitcknn(randomKTrainData,label,'Distance','euclidean',...
%             'NumNeighbors',k,'Standardize',0);
%     %fjerner data der er brugt.
%     restKTrainData = KTrainData;
%     restKTrainData(indexAll, :) = [];
%     %Finder de resterende index
%     tmpvec = 1:100;
%     tmpvec(indexAll) = [];
%     %Sætter 1:50 = 1 og 51:100 = 3
%     tmpidx = ones(100,1);
%     tmpidx(51:100) = 3;
%     %De resterende labels
%     restLABELS = tmpidx(tmpvec);
%     
%     %predicter på de resterende data
%     tmppredict = zeros((100-size(label,1)),1);
%     for i = 1:size(tmppredict,1)
%         predictTEST = predict(KNNMdl, restKTrainData(i,:));
%         tmppredict(i) = predictTEST == restLABELS(i);
%     end
%     %Får en accuracy der fortæller hvor præcis vores model er
%     accuracy(k) = sum(tmppredict)/length(tmppredict);
% end
% plot(accuracy)




%---PCA ANALYSE---
% Z = zscore(KTrainData);

% bob = var(KTrainData);

% [wcoeff,~,latent,~,explained] = pca(Z);




%-----CHECKING FOR EQUAL---------------
Test = LeftHippoMatrix('77.mat');
Test2 = GLCM2D('57.mat',10);
% data_Derivations = cell(120, 1);
% for k=1:120
%     data_Derivations{k} =  derivations(Test2.GLCM2dDist{k}, 256);
% end
tmp = zeros(10,1);
for i=1:10
    tmp(i) = isequal(transpose(Test2.GLCM2dDist{3+12*(i-1)}),Test2.GLCM2dDist{9+12*(i-1)});
end
hej = isequal(Test2.GLCM2dDist{i},Test2.GLCM2dDist{i+4});

find(hej1 ~= 0);






%----LEGACY KODE-------
% %leg
% NumberOfPatients = 100;
% [DATA] = dataloader(NumberOfPatients);
% 
% Dataset = zeros(NumberOfPatients*10,4,3,13);
% for i=1:NumberOfPatients %datasæt
%     for j=1:10 %distance
%         for m=1:3 %plans x,y,z
%             for k=1:4  %angles 0-135
% %                 tmp = DATA(i);
%                 index = j+10*(i-1); %For distance 1..10
%                 Dataset(index,k,m,1) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_asm;
%                 Dataset(index,k,m,2) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_con;
%                 Dataset(index,k,m,3) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_corr;
%                 Dataset(index,k,m,4) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_var;
%                 Dataset(index,k,m,5) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_idm;
%                 Dataset(index,k,m,6) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_sa;
%                 Dataset(index,k,m,7) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_sv;
%                 Dataset(index,k,m,8) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_se;
%                 Dataset(index,k,m,9) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_en;
%                 Dataset(index,k,m,10) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_dv;
%                 Dataset(index,k,m,11) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_de;
%                 Dataset(index,k,m,12) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc1;
%                 %Dataset(j+10*(i-1),k,m,1) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc2;
%             end
%         end
%     end
% end
% 
% 
% 
% 
% 
% 
% 
% 
% 
% A = zeros(NumberOfPatients/2,1);
% B = zeros(NumberOfPatients/2,1);
% for j=1:NumberOfPatients/2
%     tmp = 0;
%     for i=1:10
%         tmp = tmp + Dataset(i+10*(j-1),1,1,2);
%     end
%     A(j) = tmp;
% end
% for j=(NumberOfPatients/2+1):NumberOfPatients
%     tmp = 0;
%     for i=1:10
%         tmp = tmp + Dataset(i+10*(j-1),1,1,2);
%     end
%     B(j-50) = tmp;
% end
% figure
% plot(A,'.k');
% hold on
% plot(B,'.m');
% hold off






























%-----------------------------------------
% 
% NumberOfPatients = 6;
% [DATA] = dataloader(NumberOfPatients);
% %10 distance gange 2 mean af alle patienter, 4 angles, 3 akser, 13 variable
% %Første 10 distance er CONTROL
% %Næste 10 er AD
% 
% %Tager stepwise kun den ene variabel for alle patienter
% Dataset = zeros(NumberOfPatients*10,4,3,13);
% for i=1:NumberOfPatients %datasæt
%     for j=1:10 %distance
%         for m=1:3 %plans x,y,z
%             for k=1:4  %angles 0-135
% %                 tmp = DATA(i);
%                 index = j+10*(i-1); %For distance 1..10
%                 Dataset(index,k,m,1) = DATA{i,1}{(k+4*(m-1))+(12*(j-1)),1}.my_asm;
%                 Dataset(index,k,m,2) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_con;
%                 Dataset(index,k,m,3) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_corr;
%                 Dataset(index,k,m,4) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_var;
%                 Dataset(index,k,m,5) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_idm;
%                 Dataset(index,k,m,6) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_sa;
%                 Dataset(index,k,m,7) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_sv;
%                 Dataset(index,k,m,8) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_se;
%                 Dataset(index,k,m,9) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_en;
%                 Dataset(index,k,m,10) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_dv;
%                 Dataset(index,k,m,11) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_de;
%                 Dataset(index,k,m,12) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc1;
%                 %Dataset(j+10*(i-1),k,m,1) = DATA{i}{(k+4*(m-1))+(12*(j-1)),1}.my_imoc2;
%             end
%         end
%     end
% end
% 
% 
% %Alle 10 Distance, Antale kollonner som man skal finde mean af, (0,45,90,135), (x,y,z)
% tmpCO = zeros(10,NumberOfPatients/2,4,3,13);
% tmpAD = zeros(10,NumberOfPatients/2,4,3,13);
% 
% for i = 1:NumberOfPatients
%     for j=1:10
%         for m =1:3
%             for k=1:4
%                 if (i <= NumberOfPatients/2)
%                     tmpCO(j,i,k,m,VARIABLE) = Dataset(j+10*(i-1),k,m,VARIABLE);
%                 else
%                     tmpAD(j,i-(NumberOfPatients/2),k,m,VARIABLE) =  Dataset(j+10*(i-1),k,m,VARIABLE);
%                 end
%             end
%         end
%     end
% end
% 
% 
% %Calculate means of AD, control and together
% meanCO = mean(tmpCO,2);
% meanAD = mean(tmpAD,2);
% meanALL = mean([meanCO  meanAD],2);
%     
% 
% figure
% for angle = 1:4
%     for xyz = 1:3
%         subplot(3,4,angle+(4*(xyz-1)));
%         plot(meanCO(:,:,angle,xyz,VARIABLE),'- .k')
%         hold on;
%         plot(meanAD(:,:,angle,xyz,VARIABLE),'- .m')
%         plot(meanALL(:,:,angle,xyz,VARIABLE),'- .g')
%         hold off
%     end
% end 
% 
% 
% 
% 
% 



%------------------------------------------------------
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


