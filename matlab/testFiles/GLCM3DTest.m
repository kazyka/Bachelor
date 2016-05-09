DataBox = LeftHippoMatrix('18.mat');
test = GLCM3D(DataBox,10);
A = zeros(130,1);
for i = 1:130
    A(i) = sum(sum(test{i}));
end


B = zeros(40,1);
for i=1:10
    tmp = glcm2Dy(DataBox,i);
    B(1+4*(i-1)) = sum(sum(tmp.angle0y));
    B(2+4*(i-1)) = sum(sum(tmp.angle45y));
    B(3+4*(i-1)) = sum(sum(tmp.angle90y));
    B(4+4*(i-1)) = sum(sum(tmp.angle135y));
end
C = zeros(40,1);
for i=1:10
    C(1+4*(i-1)) = A(3+13*(i-1));
    C(2+4*(i-1)) = A(4+13*(i-1));
    C(3+4*(i-1)) = A(1+13*(i-1));
    C(4+4*(i-1)) = A(2+13*(i-1));
end
kage = 0;    
kage = isequal(B,C);    
    
    
