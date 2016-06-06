
noterodetmp = HippoMatrix('1.mat', 'noterode', 'left');
erodetmp = HippoMatrix('1.mat', 'erode', 'left');



imagesc(squeeze(erodetmp(10, :, :)))
colormap(gray);
figure()
imagesc(squeeze(noterodetmp(10, :, :)))
colormap(gray);

