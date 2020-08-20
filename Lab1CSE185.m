img = imread('/Users/christianchaumette-borwn/Downloads/01.jpg');
img1=img;
img2=img;
img(:,:,2)=0;
img1=img1(:,:,1)*.299+img1(:,:,2)*.587+img1(:,:,3)*.114;
figure, imshow(img1);
imwrite(img,'green.jpg');
imwrite(img1,'gray.jpg');