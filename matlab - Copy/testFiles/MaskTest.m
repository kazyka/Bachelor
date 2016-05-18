% Compares sizes of data entries between all %d.mat files
A = zeros(100,4);
for j = 1:100
    files = dir(sprintf('data/%d.mat',j));
    for i = 1:length(files)
        load(files(i).name);
        [xx,yy,zz] = ndgrid(-1:1);
        nhood = sqrt(xx.^2 + yy.^2 + zz.^2) <= 1.0;
        segErode = imerode(segmentation, nhood);
        sum_of_1 = size(find(segmentation == true),1);
        sum_of_2 = size(find(segmentation == 2),1);

        sum_of_1_erode = size(find(segErode == true),1);
        sum_of_2_erode = size(find(segErode ==2),1);
        A(j,1) = sum_of_1;
        A(j,2) = sum_of_2;
        A(j,3) = sum_of_1_erode;
        A(j,4) = sum_of_2_erode;
    end
end

%Specifics for that weirdo #12
B = [A(12,1) A(12,2) A(12,3) A(12,4)];
A(12,:) = NaN;
maxAwithout12 = max(A);
Difference = B - maxAwithout12;
MinValues = min(A);
FindingMinPatient = find(A == 567);
