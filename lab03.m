img = im2double(imread('/Users/christianchaumette-borwn/Downloads/lena.jpg'));
%figure, imshow(img);
%Sobel Filter initial set up
%H =[1,2,1;0,0,0;-1,-2,-1]; %vertical 2d initial
%H = [1,0,-1; 2,0,-2;1,0,-1] %horizontal 2d initial
%img_sobel = sobel_filter(img,H);
img_sobel = sobel_filter(img);
%figure, imshow(img_sobel);
imwrite(img_sobel,'sobel_rc.jpg');

%%Gaussian Filter

%hsize=5; sigma=2;
hsize=9; sigma=4;
img_gaussian =gaussian_filter(img,hsize,sigma);
figure, imshow(img_gaussian);
%imwrite(img_gaussian, 'gaussian_9.jpg');
%bonus Gaussian implementation
clear D;
 m=hsize;
   n=hsize;
   for x=1:m
       for y=1:n
           D(x,y)=exp(-.5*((x-(hsize/2+.5))^2+(y-(hsize/2+.5))^2)/sigma^2);
       end
   end
   D=(1/sum(sum(D)))*D;

%function output =sobel_filter(img, kernel) tic [rows,cols]=size(img);
%I1=zeros(rows+2,cols+2);
%I1(1+1:rows+1,1+1:cols+1)=img;
%for i=1:rows
   % for j=1:cols
    %    S1(i,j)=sum(sum (kernel.*I1(i:i+2,j:j+2)));
   % end 
   % end
    


%output=S1;

%toc
%end %function