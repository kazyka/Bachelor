function HXY2 = HXY2(my_glcm, N)


Ci_y = sum(my_glcm);

Ci_x = sum(my_glcm,2);


%If Ci_y(i) ~= 0 && Ci_x(j) ~= 0 er forskellig fra 0 så er produktet også.

HXY2 = 0;
for i = 1:N
    for j = 1:N
        if(Ci_y(i) ~= 0 && Ci_x(j) ~= 0)
            HXY2 = HXY2 + Ci_y(i)*Ci_x(j)*log(Ci_y(i)*Ci_x(j));
        end
    end
end
HXY2 = -HXY2;