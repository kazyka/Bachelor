
A = magic(4);
B = A;
B(:,2) = [];
[~ ,test] = max(A(4,:));
dataset(:,selected) = [];

C = [A; B];