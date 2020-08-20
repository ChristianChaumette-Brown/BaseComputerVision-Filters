function output = gaussian_filter(img,hsize,sigma)
    H=fspecial('gaussian',hsize,sigma);
   % x=[x(1:end-1),x(2:end)];
    %for n=2:K-1
    %Kernel(n)=exp(-0.5*(dist(x(:,2:n),x(:,n)')/sigma^2));
   % end
   %Bonus Gaussian kernel implementation
  clear D;
 m=hsize;
   n=hsize;
   for x=1:m
       for y=1:n
           D(x,y)=exp(-.5*((x-(hsize/2+.5))^2+(y-(hsize/2+.5))^2)/sigma^2);
       end
   end
   D=(1/sum(sum(D)))*D;
   
%I2=zeros(size(img));
[rows,cols]=size(img);
I2=zeros(rows+2,cols+2);
edge=1;
I2(1+1:rows+1,1+1:cols+1)=img;
I=imfilter(img,H);
figure, imshow(I);
shift=hsize/2-.5;
%base zeros edge extension
I3=zeros(rows+(2*shift),cols+(2*shift));
[row2,col2]=size(I3);
if edge~=0
I3(1+shift:row2-shift,1+shift:col2-shift)=img;
%edge extending code with replication
%corners
for y=1:shift
    for x=1:shift
        
        I3(y,x)=img(1,1);
    end
end
for y=1:shift
    for x=cols:cols+2*shift
        I3(y+shift,x)=img(1,cols);
    end
end
for y=1:shift
    for x=cols:cols+2*shift
        I3(y,x)=img(1,cols);
    end
end

for y=rows:rows+2*shift
    for x=1:shift
    I3(y,x)=img(rows,1);
    end
end
for y=rows:rows+2*shift
    for x=cols:cols+2*shift
        
        I3(y,x)=img(rows,cols);
    end
end
%right edge
for y=1:rows
    for x=cols:cols+2*shift
        
        I3(y+shift*2,x)=img(y,cols);
        
    end
end

%top edge
for y=1:shift
    for x=1:cols
        I3(y,x+shift)=img(1,x);   
    end
end
for x=1:shift
    for y =1:rows
    
    I3(y+shift,x)=img(y,1);
    end
end

for y=rows:rows+2*shift
    for x=1:cols
    I3(y,x+(1*shift)-1)=img(rows,x);
    end
end

end
%end edge extending code
figure, imshow(I3);
for y=1:size(img,2)
    for x=1:size(img,1)
      
        
        x1=x-shift;
        x2=x+shift;
        y1=y-shift;
        y2=y+shift;
        if x-shift<1
            x1=x;
            x2=x+(2*(x-(x-shift)));
        end
        if y-shift<1
            y1=y;
            y2=y+(2*(y-(y-shift)));
        end
        patch=I3(y1:y2,x1:x2);
        %{
        %base interior check
        if (x-shift)>=1&&(x+shift)<=cols&&(y-shift)>=1&&(y+shift)<=rows
            patch=I2(y1:y2,x1:x2);
        end
        %left edge interior check
        if (x-shift)<1&&(y-shift)>=1&&((y+shift)<=rows)
            x1=x;
            x2=x-(x-shift);
           patch=I3(y1:y2,x1:x2);
        end
        %right edge interior check
         if((x+shift)>rows)&&((y-shift)>=1)&&((y+shift)<=cols)
           x1=rows-(x-shift);
           x2=rows;
           patch=I3(y1:y2,x1:x2);
         end
         %top edge interior check
         if (y-shift)<1&&(x-shift)>=1&&((x+shift)<=cols)
            y1=y;
            y2=y-(y-shift);
            patch=I3(y1:y2,x1:x2);
         end
         %bottom edge interior check
         if(y+shift)>cols&&(x-shift)>=1&&((x+shift)<=cols)
             y1=cols-(y-shift);
             y2=cols;
             patch=I3(y1:y2,x1:x2);
         end
         %bottom left corner
        if(y+shift)>cols&&(x-shift)<1
            x1=x;
            x2=x-(x-shift);
            y1=cols-(y-shift);
            y2=cols;
            patch=I3(y1:y2,x1:x2);
            
        end
        %bottom right corner
        if(y+shift)>cols&&(x+shift)>rows
            x1=rows-(x-shift);
            x2=rows;
            y1=cols-(y-shift);
            y2=cols;
            patch=I3(y1:y2,x1:x2);
            
        end
        %top right corner
        if(y-shift)<1&&(x+shift)>rows
            x1=rows-(x-shift);
            x2=rows;
            y1=y;
            y2=y-(y-shift);
            patch=I3(y1:y2,x1:x2); 
        end
        %top left corner
        if(y-shift)<1&&(x-shift)<1
            x1=x;
            x2=x-(x-shift);
            y1=y;
            y2=y-(y-shift);
            patch=I3(y1:y2,x1:x2); 
        end
        %}
        S1(y,x)=sum(sum(D.*patch));

    end
end

    

output=S1;
end