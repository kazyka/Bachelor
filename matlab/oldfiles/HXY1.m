function HXY1 = HXY1(my_glcm, N)

% my_glcm = glcm;
% N = 256;
Ci_y = sum(my_glcm);

Ci_x = sum(my_glcm,2);

%Grunden til at vi tjekker for if, skyldes at man ikke kan tage log(0)
i = 1;
j = 1;
HXY1 = 0;
for i = 1:N
    for j = 1:N
        if(Ci_y(i)*Ci_x(j) ~= 0)
            HXY1 = HXY1 + my_glcm(i , j)*log(Ci_y(i)*Ci_x(j));
        end
    end
end
HXY1 = -HXY1;


%sum(my_glcm(find(my_glcm))) burde gerne være 1