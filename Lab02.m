

img = imread('/Users/christianchaumette-borwn/Downloads/01.jpg');
img2 = zeros(300,400+50, 3, 'uint8');
img3 = zeros(300,400,3,'uint8');
img4 = zeros(300,400,3,'uint8');
for y1=1:300
    for x1=1:400
        y2=y1;
        x2=x1+50;
        img2(y2,x2,:)=img(y1,x1,:);
    end
end



for y1=1:300
    for x1=1:400
        x2=cosd(45)*(x1-200.5)+sind(45)*(y1-150.5)+200.5;
        y2=-1*sind(45)*(x1-200.5)+cosd(45)*(y1-150.5)+150.5;
        x2=int16(x2);
        y2=int16(y2);
        if x2>1&&x2<=400&&y2>1&&y2<=300
            img3(y2,x2,:)=img(y1,x1,:);
            
        end
    end   
end      
figure, imshow(img3);
imwrite(img3,'rotate_0.jpg');
        
for y1=1:300
    for x1=1:400
        x2=cosd(-45)*(x1-200.5)+sind(-45)*(y1-150.5)+200.5;
        y2=-1*sind(-45)*(x1-200.5)+cosd(-45)*(y1-150.5)+150.5;
        x2=int16(x2);
        y2=int16(y2);
        if x2>1&&x2<=400&&y2>1&&y2<=300
            img4(y2,x2,:)=img(y1,x1,:);
            
        end
    end   
end      
figure, imshow(img4);
imwrite(img4,'rotate_1.jpg');


img = im2double(imread('/Users/christianchaumette-borwn/Downloads/lena_noisy.jpg'));
patch_size=[3,3];
%patch_size= [5,5];

img_median = median_filter(img,patch_size);
figure, imshow(img_median);
imwrite(img_median, 'median_1.jpg');
function output = median_filter(img, patch_size)
I2=zeros(size(img));
shift_u=patch_size(1,1)/2-.5;
shift_v=patch_size(1,2)/2-.5;

for y=1+shift_u:size(img,2)-shift_u
    for x=1+shift_v:size(img,1)-shift_v
      
        x1=x-shift_v;
        x2=x+shift_v;
        y1=y-shift_u;
        y2=y+shift_u;
        
      patch=img(y1:y2,x1:x2);
      A=reshape(patch,[],1);
      B= median(A);
      I2(y,x)=B;
    end
end
output=I2;
end
