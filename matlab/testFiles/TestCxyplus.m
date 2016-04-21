k = 5;
Values = [];
for i = 1:256
    for j = 1:256
        if(abs(i+j) == k)
            Values = [Values; [i j ];];
        end
    end
end