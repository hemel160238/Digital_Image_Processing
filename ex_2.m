clear; 
clc;

%i = imgetfile;
input_image = imread('images/miranda.jpg');
%gray_image = rgb2gray(input_image);
padded_image = padarray(input_image,[1,1],0);
[numRow,numCol] = size(padded_image);

image = padded_image;


w = [1 1 1;1 1 1;1 1 1];

for r=2:numRow-1
    for c=2:numCol-1
        image(r,c) = sum(sum(w.*double(padded_image(r-1:r+1,c-1:c+1))))/9;
        
    end
end

new_image = uint8(image);
subplot(2,2,1);
imshow(input_image),title('Original Image');
subplot(2,2,2);

imshow(new_image),title('Blurred Image');

sharp_part = padded_image-image;

final_image_matrix = padded_image+sharp_part;
final_image = uint8(final_image_matrix);

subplot(2,2,3);
imshow(final_image),title('Sharpened Image');
