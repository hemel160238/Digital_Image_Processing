clear; 
clc;
input_image = imread('images/miranda.jpg');

transform_image = fft2(input_image);
 shift_image= fftshift(fft2(input_image));
 
subplot(2,2,1); imshow(input_image),title('Original Image');
subplot(2,2,2); imshow(transform_image),title('Image after fft2');
subplot(2,2,3); imshow(afhb),title('Image after fftshift');
