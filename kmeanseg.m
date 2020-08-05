clc;
clear all;
close all;


nBins=5;
winSize=7;
nClass=6;

inImg = imread('logo.jpeg');
figure,imshow(inImg);title('Input Image RGB');
outImg = colImgSeg(inImg, nBins, winSize, nClass);
figure,imshow(outImg);title('Segmentation Maps RGB');

imghsv=rgb2hsv(inImg);
figure,imshow(imghsv);title('Input Image HSV');
I2 = im2double(inImg);
HSV = rgb2hsv(I2);
H = HSV(:,:,1); H = H(:);
S = HSV(:,:,2); S = S(:);
V = HSV(:,:,3); V = V(:);
idx = kmeans([H S V], 2);
figure,imshow(ind2rgb(reshape(idx, size(I2,1), size(I2, 2)), [0 0 1; 0 0.8 0]));
title('Segmentation Maps HSV');

img3=rgb2ycbcr(inImg);
figure,imshow(img3);title('Input Image YCBCR');
outImg3 = colImgSeg(img3, nBins, winSize, nClass);
figure,imshow(outImg3);title('Segmentation Maps ycbcr');
colormap('default');