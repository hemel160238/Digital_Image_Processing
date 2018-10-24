clc; 
clear;
i = imgetfile;
input_image = imread(i);


n = input('Input Dimention \n');

padded_image = padarray(input_image,[floor(n/2),floor(n/2)],0);

if(n == 3)
    [numRow,numCol] = size(padded_image);
    
    w1 = [0 0 0;1 1 1;0 0 0];
    w2 = rot90(w1);
    w3 = [1 0 0;0 1 0;0 0 1];
    w4 = rot90(w3);
    ws = [w1,w2,w3,w4];
    image = padded_image;
    
    % first filter
    for r=2:numRow-1
    
         for c=2:numCol-1
        
              image1(r,c) = sum(sum(w1.*double(padded_image(r-1:r+1,c-1:c+1))))/3;
        
         end
    end
    
    new_image1 = uint8(image1);
    
    % 2nd filter
    for r=2:numRow-1
    
         for c=2:numCol-1
        
              image2(r,c) = sum(sum(w2.*double(padded_image(r-1:r+1,c-1:c+1))))/3;
        
         end
    end
    
    new_image2 = uint8(image2);
    
    % 3rd filter
    for r=2:numRow-1
    
         for c=2:numCol-1
        
              image3(r,c) = sum(sum(w3.*double(padded_image(r-1:r+1,c-1:c+1))))/3;
        
         end
    end
    
    new_image3 = uint8(image3);
    
    % 4th filter
    for r=2:numRow-1
    
         for c=2:numCol-1
        
              image4(r,c) = sum(sum(w4.*double(padded_image(r-1:r+1,c-1:c+1))))/3;
        
         end
    end
    
    new_image4 = uint8(image4);
    
    
    
    subplot(2,3,1);
    imshow(input_image),title('Original Image');
    
    subplot(2,3,2);
    imshow(new_image1),title('Horizontally Filtered Image');
    subplot(2,3,3);
    imshow(new_image2),title('Vertically Filtered Image');
    subplot(2,3,4);
    imshow(new_image3),title('Left Diagolanl Image');
    subplot(2,3,5);
    imshow(new_image4),title('Right Diagonal Image');
    
end