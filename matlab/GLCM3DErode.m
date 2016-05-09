function GLCM3D = GLCM3DErode(data, distance)
DATA = LeftHippoMatrix(data);
GLCM3D = cell(13*distance,1);

%Matrix Boundries
sizex = size(DATA,1);
sizey = size(DATA,2);
sizez = size(DATA,3);

%Initialisere GLCM for alle 13 angles
for d = 1:distance
    glcm1 = zeros(256, 256);
    glcm2 = zeros(256, 256);
    glcm3 = zeros(256, 256);
    glcm4 = zeros(256, 256);
    glcm5 = zeros(256, 256);
    glcm6 = zeros(256, 256);
    glcm7 = zeros(256, 256);
    glcm8 = zeros(256, 256);
    glcm9 = zeros(256, 256);
    glcm10 = zeros(256, 256);
    glcm11 = zeros(256, 256);
    glcm12 = zeros(256, 256);
    glcm13 = zeros(256, 256);
    %Gennemløber Matricen
    for i = 1:sizex
        for j = 1:sizey
            for k = 1:sizez
                %Tjekker om datapunktet er forskelligt fra nan
                datapoint = DATA(i,j,k);
                if (isnan(datapoint) == 0)
                    %Fire første svarer til glcm2D i x plan, samme
                    %rækkefølgeme som 2D
                    if (i + d <= sizex)
                        %hvis forskelligt for nan sætter ind i glcm
                        if (isnan(DATA(i+d,j,k)) == 0)
                            glcm1(datapoint,DATA(i+d,j,k)) = glcm1(datapoint,DATA(i+d,j,k)) +1;
                        end
                    end
                    
                    if (i + d <= sizex && k+d <= sizez)
                        if (isnan(DATA(i+d,j,k+d)) == 0)
                           glcm2(datapoint,DATA(i+d,j,k+d)) = glcm2(datapoint,DATA(i+d,j,k+d)) +1;
                        end
                    end
                    
                    if (k+d <= sizez)
                        if (isnan(DATA(i,j,k+d)) == 0)
                           glcm3(datapoint,DATA(i,j,k+d)) = glcm3(datapoint,DATA(i,j,k+d)) +1;
                        end
                    end
                    
                    if (i - d > 0 && k+d <= sizez)
                        if (isnan(DATA(i-d,j,k+d)) == 0)
                           glcm4(datapoint,DATA(i-d,j,k+d)) = glcm4(datapoint,DATA(i-d,j,k+d)) +1;
                        end
                    end
                    %De resterende 9 værdier der ligger d højere end
                    %punktet vi kigger på
                    if (j-d > 0)
                        if (i + d <= sizex)
                            if (isnan(DATA(i+d,j-d,k)) == 0)
                                glcm5(datapoint,DATA(i+d,j-d,k)) = glcm5(datapoint,DATA(i+d,j-d,k)) +1;
                            end
                        end
                        if (i + d <= sizex && k + d <= sizez)
                            if (isnan(DATA(i+d,j-d,k+d)) == 0)
                                glcm6(datapoint,DATA(i+d,j-d,k+d)) = glcm6(datapoint,DATA(i+d,j-d,k+d)) +1;
                            end
                         end
                         if (k + d <= sizez)
                            if (isnan(DATA(i,j-d,k+d)) == 0)
                                glcm7(datapoint,DATA(i,j-d,k+d)) = glcm7(datapoint,DATA(i,j-d,k+d)) +1;
                            end
                         end
                         if (i - d > 0 && k + d <= sizez)
                            if (isnan(DATA(i-d,j-d,k+d)) == 0)
                                glcm8(datapoint,DATA(i-d,j-d,k+d)) = glcm8(datapoint,DATA(i-d,j-d,k+d)) +1;
                            end
                         end
                        if (i - d > 0)
                            if (isnan(DATA(i-d,j-d,k)) == 0)
                                glcm9(datapoint,DATA(i-d,j-d,k)) = glcm9(datapoint,DATA(i-d,j-d,k)) +1;
                            end
                        end
                         if (i - d > 0 && k - d > 0)
                            if (isnan(DATA(i-d,j-d,k-d)) == 0)
                                glcm10(datapoint,DATA(i-d,j-d,k-d)) = glcm10(datapoint,DATA(i-d,j-d,k-d)) +1;
                            end
                         end                                                 

                         if (k - d > 0)
                            if (isnan(DATA(i,j-d,k-d)) == 0)
                                glcm11(datapoint,DATA(i,j-d,k-d)) = glcm11(datapoint,DATA(i,j-d,k-d)) +1;
                            end
                         end                                                 
                         
                         if (i + d <= sizex && k - d > 0)
                            if (isnan(DATA(i+d,j-d,k-d)) == 0)
                                glcm12(datapoint,DATA(i+d,j-d,k-d)) = glcm12(datapoint,DATA(i+d,j-d,k-d)) +1;
                            end
                         end
                                                  
                         if (isnan(DATA(i,j-d,k)) == 0)
                            glcm13(datapoint,DATA(i,j-d,k)) = glcm13(datapoint,DATA(i,j-d,k)) +1;
                         end  
                    end
                end         
            end
        end
    end
    GLCM3D{1+13*(d-1)} = glcm1;
    GLCM3D{2+13*(d-1)} = glcm2;
    GLCM3D{3+13*(d-1)} = glcm3;
    GLCM3D{4+13*(d-1)} = glcm4;
    GLCM3D{5+13*(d-1)} = glcm5;
    GLCM3D{6+13*(d-1)} = glcm6;
    GLCM3D{7+13*(d-1)} = glcm7;
    GLCM3D{8+13*(d-1)} = glcm8;
    GLCM3D{9+13*(d-1)} = glcm9;
    GLCM3D{10+13*(d-1)} = glcm10;
    GLCM3D{11+13*(d-1)} = glcm11;
    GLCM3D{12+13*(d-1)} = glcm12;
    GLCM3D{13+13*(d-1)} = glcm13;    
end
