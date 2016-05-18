kage = glcm2dFast('12.mat',1);
glcm = kage{1};

size_glcm_1 = size(glcm,1);
size_glcm_2 = size(glcm,2);
size_glcm_3 = 1;


u_x = zeros(size_glcm_3,1);
u_y = zeros(size_glcm_3,1);
s_x = zeros(size_glcm_3,1);
s_y = zeros(size_glcm_3,1);

p_x = zeros(size_glcm_1,size_glcm_3); % Ng x #glcms[1]  
p_y = zeros(size_glcm_2,size_glcm_3); % Ng x #glcms[1]
p_xplusy = zeros((size_glcm_1*2 - 1),size_glcm_3); %[1]
p_xminusy = zeros((size_glcm_1),size_glcm_3); %[1]

% NORMALISING
glcm_sum = sum(sum(glcm(:,:)));
glcm(:,:) = glcm(:,:)./glcm_sum; % Normalize each glcm
glcm_mean = mean2(glcm(:,:)); % compute mean after norm
glcm_var  = (std2(glcm(:,:)))^2;



    for i = 1:size_glcm_1

        for j = 1:size_glcm_2
            u_x(1)          = u_x(1) + (i)*glcm(i,j); % changed 10/26/08
            u_y(1)          = u_y(1) + (j)*glcm(i,j); % changed 10/26/08
        end
    end
for k = 1:size_glcm_3
    
    for i = 1:size_glcm_1
        
        for j = 1:size_glcm_2
            p_x(i) = p_x(i) + glcm(i,j); 
            p_y(i) = p_y(i) + glcm(j,i); % taking i for j and j for i
            if (ismember((i + j),[2:2*size_glcm_1])) 
                p_xplusy((i+j)-1) = p_xplusy((i+j)-1) + glcm(i,j);
            end
            if (ismember(abs(i-j),[0:(size_glcm_1-1)])) 
                p_xminusy((abs(i-j))+1) = p_xminusy((abs(i-j))+1) +...
                    glcm(i,j);
            end
        end
    end
    
%     % consider u_x and u_y and s_x and s_y as means and standard deviations
%     % of p_x and p_y
    u_x2(k) = mean(p_x(:,k));
    u_y2(k) = mean(p_y(:,k));
    s_x2(k) = std(p_x(:,k));
    s_y2(k) = std(p_y(:,k));
    
end

for k = 1:size_glcm_3
    for i = 1:size_glcm_1
        for j = 1:size_glcm_2
            s_x(k)  = s_x(k)  + (((i) - u_x(k))^2)*glcm(i,j);
            s_y(k)  = s_y(k)  + (((j) - u_y(k))^2)*glcm(i,j);
        end
    end
    s_x(k) = s_x(k) ^ 0.5;
    s_y(k) = s_y(k) ^ 0.5;
end

s = size(glcm);
[c,r] = meshgrid(1:s(1),1:s(2));
r = r(:);
c = c(:);
  

mr = r .*glcm(:);
mr = sum(mr);
term1 = (r - mr).^2 .* glcm(:);
Sr = sqrt(sum(term1));

mc = c .*glcm(:);
mc = sum(mc);
term2 = (c - mc).^2 .* glcm(:);
Sc = sqrt(sum(term2));


tmp1 = (r-mr) .*(c-mc) .* glcm(:);
tmp2 = sum(tmp1);


Corr = tmp2 / (Sr * Sc);
  
  
test1 = derivationsTest(glcm,256);

B = zeros(511,1);
for i=1:511
    B(i) = test1.CV_xplusy(i+1);
end
equalityTest1 = isequal(B,p_xplusy);
equalityTest2 = isequal(test1.CV_xminusy,p_xminusy);
