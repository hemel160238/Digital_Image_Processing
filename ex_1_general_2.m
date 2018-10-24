clc; 
clear;
i = imgetfile;
input_image = imread(i);


n = input('Input Dimention \n');

w1 = zeros(n);
w5 = w1;
w1(ceil(n/2),:) = 1;
w2 = rot90(w1);

w3 = eye(n);
w4 = rot90(w3);
w5(:,:) = 1;

padded_image = padarray(input_image,[floor(n/2),floor(n/2)],0);
[numRow,numCol] = size(padded_image);

image1 = padded_image;
image2 = padded_image;
image3 = padded_image;
image4 = padded_image;

image5 = padded_image;

f = floor(n/2);

for r = ceil(n/2):(numRow - floor(n/2))
    for c = ceil(n/2):(numCol - floor(n/2))
        
        image1(r,c) = sum(sum(w1.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        image2(r,c) = sum(sum(w2.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        image3(r,c) = sum(sum(w3.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        image4(r,c) = sum(sum(w4.*double(padded_image(r-f:r+f,c-f:c+f))))/n;
        
        image5(r,c) = sum(sum(w5.*double(padded_image(r-f:r+f,c-f:c+f))))/(n*n);
        
        
        
    end
end

new_image1 = uint8(image1);
new_image2 = uint8(image2);
new_image3 = uint8(image3);
new_image4 = uint8(image4);

new_image5 = uint8(image5);

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
    subplot(2,3,6);
    imshow(new_image5),title('All Directional Image');
        
        
        
        