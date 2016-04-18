for i = 1:4
    % get allfiles matching the pattern 'dataset(i)_*'
    files = dir(sprintf('%d.mat',i));
    for j = 1:length(files)
        fprintf('Current file : %s\n',files(j).name)
        %a = load(files(j).name);
        %mri = a.mri;
        %segmentation = a.segmentation;
        
        %tmp = load(sprintf('%d.mat',i));
        %save(sprintf('datafile%1d',i), 'tmp');

        
        data_load = GLCM2D(files(j).name,10);
        data_Derivations = cell(120, 1);
        for k=1:120
            data_Derivations{k} =  derivations(data_load.GLCM2dDist{k}, 256);
        end
        
        save(sprintf('datafile%1d',i), 'data_Derivations');
        
    end
end










% for i = 1:2
%     tmp = load(sprintf('%d.mat',i));
%     mri = tmp.mri;
%     segmentation = tmp.segmentation;
%     data_load = LeftHippoMatrix(tmp);
% end
% 
% load('1.mat')
% 
% 

% 
% data_load = GLCM2D('1.mat',10);
% data_Derivations = cell(120, 1);
% for i=1:120
%     data_Derivations{i} =  derivations(data_load.GLCM2dDist{i}, 256);
% end
% 
% save('AD1Derivations.mat', 'AD1Derivations');
% load('AD1Derivations.mat');
% 
% plottermachine(data_Derivations, 'my_asm');
% 
% %for loop til at �ndre
% for i = 1:2
% 
% random_sample = poissrnd(2,1,100)>0.25;
% 
% save(sprintf('datafile%1d',i), 'random_sample');
% 
% end



% A = zeros(40,1);
% %Distance 1 til 10 for X 0 til 135 grader
% A = zeros(40,1);
% for i=1:10
%     A(i)    = AD1Derivations{1+(12*(i-1))}.my_asm;
%     A(10+i) = AD1Derivations{2+(12*(i-1))}.my_asm;
%     A(20+i) = AD1Derivations{3+(12*(i-1))}.my_asm;
%     A(30+i) = AD1Derivations{4+(12*(i-1))}.my_asm;
% end
% subplot(3,4,1)
% plot(A(1:10,1), '.');
% title({'X distance 1-10', 'degree 0'})
% axis([0 10 0 2.5*10^6])
% 
% subplot(3,4,2)
% plot(A(11:20,1), '.');
% axis([0 10 0 2.5*10^6])
% 
% subplot(3,4,3)
% plot(A(21:30,1), '.');
% axis([0 10 0 2.5*10^6])
% 
% subplot(3,4,4)
% plot(A(31:40,1), '.');
% axis([0 10 0 2.5*10^6])
% 
% 
% 
% %Distance 1 til 10 for Y 0 til 135 grader
% A = zeros(40,1);
% for i=1:10
%     A(i)    = AD1Derivations{5+(12*(i-1))}.my_asm;
%     A(10+i) = AD1Derivations{6+(12*(i-1))}.my_asm;
%     A(20+i) = AD1Derivations{7+(12*(i-1))}.my_asm;
%     A(30+i) = AD1Derivations{8+(12*(i-1))}.my_asm;
% end
% subplot(3,4,5)
% plot(A(1:10,1), '.');
% title({'X distance 1-10', 'degree 0'})
% axis([0 10 0 5*10^3])
% 
% subplot(3,4,6)
% plot(A(11:20,1), '.');
% axis([0 10 0 5*10^3])
% 
% subplot(3,4,7)
% plot(A(21:30,1), '.');
% axis([0 10 0 5*10^3])
% 
% subplot(3,4,8)
% plot(A(31:40,1), '.');
% axis([0 10 0 5*10^3])
% 
% 
% %Distance 1 til 10 for Z 0 til 135 grader
% A = zeros(40,1);
% for i=1:10
%     A(i)    = AD1Derivations{9+(12*(i-1))}.my_asm;
%     A(10+i) = AD1Derivations{10+(12*(i-1))}.my_asm;
%     A(20+i) = AD1Derivations{11+(12*(i-1))}.my_asm;
%     A(30+i) = AD1Derivations{12+(12*(i-1))}.my_asm;
% end
% subplot(3,4,9)
% plot(A(1:10,1), '.');
% title({'Z distance 1-10', 'degree 0'})
% axis([0 10 0 5*10^3])
% 
% subplot(3,4,10)
% plot(A(11:20,1), '.');
% title({'Z distance 1-10', 'degree 0'})
% axis([0 10 0 5*10^3])
% 
% subplot(3,4,11)
% plot(A(21:30,1), '.');
% title({'Z distance 1-10', 'degree 0'})
% axis([0 10 0 5*10^3])
% 
% subplot(3,4,12)
% plot(A(31:40,1), '.');
% title({'Z distance 1-10', 'degree 0'})
% axis([0 10 0 5*10^3])
% 
% figure;



% tmp = {'my_asm'; 'my_con'; 'my_corr'; 'my_var'; 'my_idm';
%     'my_sa'; 'my_sv'; 'my_se'; 'my_en'; 'my_dv'; 'my_de';
%     'my_imoc1'; 'my_imoc2'};
% 
% for i = 1:size(tmp)
%     AD1Derivations{1}.tmp(i);
% end




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
%Forskel i slicing p� 2D - Kun hvis tid

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


%Finder v�rdier


