function HXY = HXY(my_glcm, N)

i = 1;
j = 1;
HXY = 0;
for i = 1:N
    for j = 1:N
        tmp = my_glcm(i , j);
        if(tmp ~= 0)
            HXY = HXY + tmp*log(tmp);
        end
    end
end
HXY = -HXY;