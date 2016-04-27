function out = GLCM2DErode(data, distance)
DATA = LeftHippoMatrixErode(data);
out.GLCM2dDist = cell(12*distance,1);
for i = 1:distance
    [out2Dx] = glcm2Dx(DATA,i);
    [out2Dy] = glcm2Dy(DATA,i);
    [out2Dz] = glcm2Dz(DATA,i);
    out.GLCM2dDist{((i-1)*12)+1} = out2Dx.angle0x;
    out.GLCM2dDist{((i-1)*12)+2} = out2Dx.angle45x;
    out.GLCM2dDist{((i-1)*12)+3} = out2Dx.angle90x;
    out.GLCM2dDist{((i-1)*12)+4} = out2Dx.angle135x;
    out.GLCM2dDist{((i-1)*12)+5} = out2Dy.angle0y;
    out.GLCM2dDist{((i-1)*12)+6} = out2Dy.angle45y;
    out.GLCM2dDist{((i-1)*12)+7} = out2Dy.angle90y;
    out.GLCM2dDist{((i-1)*12)+8} = out2Dy.angle135y;
    out.GLCM2dDist{((i-1)*12)+9} = out2Dz.angle0z;
    out.GLCM2dDist{((i-1)*12)+10} = out2Dz.angle45z;
    out.GLCM2dDist{((i-1)*12)+11} = out2Dz.angle90z;
    out.GLCM2dDist{((i-1)*12)+12} = out2Dz.angle135z;
end