function [out] = derivations(my_glcm, gsl)

%
%ASM = Angular second momemt
%Contrast
%Correlation
%Variance
%IDM = Inverse difference moment
%SA = Sum average
%SV = Sum variance
%SE = Sum Entropy
%Entropy
%DV = Difference Variance
%DE = Difference Entropy
%IMoC = Information measures of correlation
%gsl = gray scale levels
%




Ci_y = sum(my_glcm);

Ci_x = sum(my_glcm,2);

%Angular second moment
i = 1;
j = 1;
out.my_asm = 0;
for  i = 1:gsl
     for j = 1:gsl
         out.my_asm = out.my_asm + my_glcm(i, j)^2;
     end
end

%Contrast
%Can ignore n = 0 as 0^2 = 0 so 0*C_x-y = 0;
n = 1;
i = 1;
j = 1;
out.my_con = 0;
for n = 1: (gsl - 1)
    out.my_con = out.my_con + n^2*C_xminusy(my_glcm,n);
end

%Correlation
i = 1;
j = 1;
mu_x = mean(Ci_x);
mu_y = mean(Ci_y);
std_x = std(Ci_x);
std_y = std(Ci_y);
out.my_corr = 0;
for i = 1:gsl
    for j = 1:gsl
        out.my_corr = out.my_corr + (i * j * my_glcm(i,j) - mu_x*mu_y);
    end
end
out.my_corr = out.my_corr/(std_x*std_y);

%Variance
out.my_var = var(var(my_glcm));

%Inverse difference moment
i = 1;
j = 1;
out.my_idm = 0;
for i = 1:gsl
    for j = 1:gsl
        out.my_idm = out.my_idm + (1 / (1 + (i - j)^2)) * my_glcm(i,j);
    end
end

%Sum average
i = 2;
out.my_sa = 0;
for i = 2:(2*gsl)
    out.my_sa = out.my_sa + i*C_xplusy(my_glcm, i);
end

%Sum Variance
i = 2;
out.my_sv = 0;
for i = 2:(2*gsl)
    out.my_sv = out.my_sv + (i - out.my_sa)^2*C_xplusy(my_glcm, i);
end

%Sum Entropy
i = 2;
out.my_se = 0;
for i = 2:(2*gsl)
    tmp = C_xplusy(my_glcm,i);
    if(tmp ~= 0)
        out.my_se = out.my_se + tmp*log(tmp);
    end
end

%Entropy
i = 1;
j = 1;
out.my_en = 0;
for i = 1:gsl
    for j = 1:gsl
        tmp = my_glcm(i , j);
        if(tmp ~= 0)
            out.my_en = out.my_en + tmp*log(tmp);
        end
    end
end

%Difference variance
out.my_dv = 0;
i = 1;
my_dv_vec = zeros(gsl,1);
for i = 1:gsl
    my_dv_vec(i) = C_xminusy(my_glcm,i-1);
end
out.my_dv = var(my_dv_vec);

%Difference Entropy
out.my_de = 0;
i = 0;
for i = 0:(gsl - 1)
    tmp = C_xminusy(my_glcm,i);
    if(tmp ~= 0)
        out.my_de =  out.my_de + tmp*log(tmp);
    end
end



HX = 0;
for i = 1:gsl
    tmp = Ci_x(i);
    if(tmp ~= 0)
        HX = HX + tmp*log(tmp);
    end
end
HX = -HX;

HY = 0;
for i = 1:gsl
    tmp = Ci_y(i);
    if(tmp ~= 0)
        HY = HY + tmp*log(tmp);
    end
end
HY = -HY;



%Information measures of correlation
out.my_imoc1 = (HXY(my_glcm,gsl) - HXY1(my_glcm,gsl)) / (max(HX,HY));

out.my_imoc2 = sqrt(1 - exp(-2*(HXY2(my_glcm,gsl) - HXY(my_glcm,gsl))));


