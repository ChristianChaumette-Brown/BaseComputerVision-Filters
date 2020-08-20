function output = sobel_filter(img)
%vertical filter sobel
    %HX1=[1,1,1;0,0,0;-1,-1,-1];HX2=[1,2,1]; %cr set up
    HX1=[1,2,1;0,0,0;-1,-2,-1];HX2=[1,1,1]; %rc set up
        tic

    [rows,cols]=size(img);
    I2=zeros(rows+2,cols+2);
    I2(1+1:rows+1,1+1:cols+1)=img;
    outputa = zeros(rows+2,cols+2);
    output=zeros(rows,cols);
    for i=1:rows
        for j=1:cols
            
            %outputa(i,j:j+2)=sum(HX1.*I2(i:i+2,j:j+2),1);%cr set up
            outputa(i:i+2,j)=sum(HX1.*I2(i:i+2,j:j+2),2); %rc set up
            %output(i,j)=sum(HX2.*outputa(i,j:j+2)); %cr set up
            output(i,j)=sum(HX2'.*outputa(i:i+2,j)); %rc set up
            
        end
    end

toc
end