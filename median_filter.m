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
