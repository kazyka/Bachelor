DataBox = LeftHippoMatrix('1.mat');
glcm4a = glcm2Dx(DataBox,1);
glcm = glcm4a.angle0x;
derivationOld = derivationsOLD(glcm, 256);
derivationO = derivations(glcm,256);

