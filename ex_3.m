clear; 
clc;

input_image = imread('images/miranda.jpg');
noisy_image = imnoise(input_image,'salt & pepper',.02);

median_filtered = medfilt2(noisy_image);

new10 = medfilt_th(noisy_image,3,10);
new20 = medfilt_th(noisy_image,3,20);
new30 = medfilt_th(noisy_image,3,30);
new40 = medfilt_th(noisy_image,3,40);
new100 = medfilt_th(noisy_image,3,100);
new120 = medfilt_th(noisy_image,3,120);

subplot(2,5,1)
imshow(input_image),title('Original Image');

subplot(2,5,2)
imshow(noisy_image),title('Noisy Image');

subplot(2,5,3)
imshow(median_filtered),title('Median Filtered only  Image');


subplot(2,5,4)
imshow(new10),title('Filter threshold 10');

subplot(2,5,5)
imshow(new20),title('Filter threshold 20');
subplot(2,5,6)
imshow(new30),title('Filter threshold 30');
subplot(2,5,7)
imshow(new40),title('Filter threshold 40');
subplot(2,5,8)
imshow(new100),title('Filter threshold 100');
subplot(2,5,9)
imshow(new120),title('Filter threshold 120');








