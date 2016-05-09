function [neighborIds, neighborDistances] = MyKNN(X, Y, k)
neighborIds = zeros(size(Y,1),k);
neighborDistances = neighborIds;
numDataVectors = size(X,1);
numQueryVectors = size(Y,1);
for i=1:numQueryVectors,
    dist = sum((repmat(Y(i,:),numDataVectors,1)-X).^2,2);
    [sortval, sortpos] = sort(dist,'ascend');
    neighborIds(i,:) = sortpos(1:k);
    neighborDistances(i,:) = sqrt(sortval(1:k));
end
