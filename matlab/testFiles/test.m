
A = NaN(4);
A(isnan(A) == 1) = 0;
B(:,2) = [];
[~ ,test] = max(A(4,:));
dataset(:,selected) = [];

C = [A; B];