k = 147;
Values = zeros(256-k,2);
counter = 1;
for i = 1:256
    for j = 1:256
        if(abs(i-j) == k)
            Values(counter,1) = i;
            Values(counter,2) = j;
            counter = counter +1;
        end
    end
end

A = ones(256);
CxminusTest = C_xminusy(A,k);