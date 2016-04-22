k = 504;
Values = [];
for i = 1:256
    for j = 1:256
        if(i+j == k)
            Values = [Values; [i j ];];
        end
    end
end