DataBox = LeftHippoMatrix('12.mat');
test = GLCM3D('12.mat',10);
test1 = GLCM3DErode('12.mat',10);


A = cell(130, 1);
for i = 1:130
    A{i} = derivations(test{i}, 256);
end
A1 = cell(130, 1);
for i = 1:130
    A1{i} = derivations(test1{i}, 256);
end
% 
% 
% A = zeros(130,1);
% for i = 1:130
%     A(i) = sum(sum(test{i}));
% end
% 
% 
% B = zeros(80,1);
% for i=1:10
%     tmp = glcm2Dy(DataBox,i);
%     B(1+4*(i-1)) = sum(sum(tmp.angle0y));
%     B(2+4*(i-1)) = sum(sum(tmp.angle45y));
%     B(3+4*(i-1)) = sum(sum(tmp.angle90y));
%     B(4+4*(i-1)) = sum(sum(tmp.angle135y));
% end
% for i=1:10
%     tmp = glcm2Dz(DataBox,i);
%     B(41+4*(i-1)) = sum(sum(tmp.angle0z));
%     B(42+4*(i-1)) = sum(sum(tmp.angle45z));
%     B(44+4*(i-1)) = sum(sum(tmp.angle90z));
%     B(43+4*(i-1)) = sum(sum(tmp.angle135z));
% end
% 
% 
% 
% C = zeros(80,1);
% for i=1:10
%     C(1+4*(i-1)) = A(3+13*(i-1));
%     C(2+4*(i-1)) = A(4+13*(i-1));
%     C(3+4*(i-1)) = A(1+13*(i-1));
%     C(4+4*(i-1)) = A(2+13*(i-1));
%     C(41+4*(i-1)) = A(13+13*(i-1));
%     C(42+4*(i-1)) = A(5+13*(i-1));
%     C(43+4*(i-1)) = A(9+13*(i-1));
%     C(44+4*(i-1)) = A(1+13*(i-1));
%     
% end
% 
% 
% kage = [B(41); B(42); B(43); C(41);C(42);C(43)];    
% kage = isequal(B,C);    
    
    
