NumberOfPatients =100;
[~, DATA3D] = dataloader(NumberOfPatients , 1, 'left', 'normalize', 'erode');
COKTrainData3D = DATA3D(1:50,:);
ADKTrainData3D = DATA3D(51:100,:);
%randomly sample from data, without replacment
% naivesingles = zeros(8,10);
% naivedoubles = zeros(8,8,10);
% naivetriples = zeros(8,8,8,10);
naive4 = zeros(8,8,8,8,10);
% naive5 = zeros(8,8,8,10);
% naive6 = zeros(8,8,10);
% naive7 = zeros(8,10);
% naive8 = zeros(10,1);
rounds = 100;
for a = 1:rounds
    tic;
    [sampledCOKTrainData3D, idxCO3D] = datasample(COKTrainData3D, NumberOfPatients/2, 'Replace', false);
    [sampledADKTrainData3D, idxAD3D] = datasample(ADKTrainData3D, NumberOfPatients/2, 'Replace', false);
    sortedData3D = cell(100,1);
    for i=1:10
        for j =1:5
            sortedData3D{j+10*(i-1)} = sampledCOKTrainData3D{j+5*(i-1)};
            sortedData3D{5+j+10*(i-1)} = sampledADKTrainData3D{j+5*(i-1)};
        end
    end
    %Dataset form , patients(100) X glcms(9 2d, 13 3d) X features(13) X
    %distances(10)
    dataSorted3D = forwardFeatureDataSort(sortedData3D,NumberOfPatients);
    %Selecting relevant features
    % 
    % F1 = dataSorted3D(:,7,13,2);
    % F2 = dataSorted3D(:,3,13,3);
    % F3 = dataSorted3D(:,13,13,3);
    % F4 = dataSorted3D(:,13,12,9);
    % F5 = dataSorted3D(:,7,12,6);
    % F6 = dataSorted3D(:,13,9,10);
    % F7 = dataSorted3D(:,7,9,6);
    % F8 = dataSorted3D(:,7,6,6);
    features = zeros(100,1,1,8);
    for i = 1:100
        features(i,1,1,1) = dataSorted3D(i,7,13,2);
        features(i,1,1,2) = dataSorted3D(i,3,13,3);
        features(i,1,1,3) = dataSorted3D(i,13,13,3);
        features(i,1,1,4) = dataSorted3D(i,13,12,9);
        features(i,1,1,5) = dataSorted3D(i,7,12,6);
        features(i,1,1,6) = dataSorted3D(i,13,9,10);
        features(i,1,1,7) = dataSorted3D(i,7,9,6);
        features(i,1,1,8) = dataSorted3D(i,7,6,6);
    end
%     features2 = cell(8,1);
%     features2{1} = dataSorted3D(:,7,13,2); % 
%     features2{2} = dataSorted3D(:,3,13,3);
%     features2{3} = dataSorted3D(:,13,13,3); %
%     features2{4} = dataSorted3D(:,13,12,9); %
%     features2{5} = dataSorted3D(:,7,12,6); %
%     features2{6} = dataSorted3D(:,13,9,10);
%     features2{7} = dataSorted3D(:,7,9,6);
%     features2{8} = dataSorted3D(:,7,6,6);
% 

%     for j = 1:10
%         naive8(j) = naive8(j) + knnWithCrossval2([],features(:),j)/rounds;
%         fprintf('first %d \n',j)
%         for i=1:8
%             naivesingles(i,j) = naivesingles(i,j) + knnWithCrossval2([],features(:,1,1,i),j)/rounds;
%             naive7(i,j) = naive7(i,j) + knnWithCrossval2([],cat(1,features2{1:end ~= i}),j)/rounds;
%             for k = 1:8
%                 if i ~= k
%                     naivedoubles(i,k,j) = naivedoubles(i,k,j) + knnWithCrossval2(features(:,1,1,k),features(:,1,1,i),j)/rounds;
%                     naive6(i,k,j) = naive6(i,k,j) + knnWithCrossval2([],cat(1,features2{setdiff(1:end, [i,k])}),j)/rounds;
% %                     fprintf('third %d \n',k)
%                 end
%                 for h =1:8
%                     if k ~= h && h ~= i && k ~= i
%                         naivetriples(i,k,h,j) = naivetriples(i,k,h,j) + knnWithCrossval2(horzcat(features(:,1,1,k),features(:,1,1,h)),features(:,1,1,i),j)/rounds;
%                         naive5(i,k,h,j) = naive5(i,k,h,j) + knnWithCrossval2([],cat(1,features2{setdiff(1:end, [i,k,h])}),j)/rounds;
% %                         fprintf('forth %d \n',h)
%                     end
%                 end
%             end
%         end
%     end
    fprintf('done round %d \n',a)
    tic;
    for b = 1:10
        for i = 1:5
            for j = 2:6
                for k = 3:7
                    for h = 4:8
                        if i ~= j && i ~= k && i ~= j && i ~= h && j ~= k && j ~= h && k ~= h
                         naive4(i,j,k,h,b) = naive4(i,j,k,h,b) + knnWithCrossval2(horzcat(features(:,1,1,i),features(:,1,1,j),features(:,1,1,k)),...
                                    features(:,1,1,h),b)/rounds;
                        end
                    end
                end
            end
        end
    end
    toc;
end



maxVector(8) = max(naive8(:));
maxVector(7) = max(naive7(:));
maxVector(6) = max(naive6(:));
maxVector(5) = max(naive5(:));
maxVector(4) = max(naive4(:));
maxVector(3) = max(naivetriples(:));
maxVector(2) = max(naivedoubles(:));
maxVector(1)= max(naivesingles(:));

[~, index] = max(naive4(:));
[a, b, c, d, e] =ind2sub(size(naive4),index);



[FeatureSelected(a,1), index] = max(evaluate(:));