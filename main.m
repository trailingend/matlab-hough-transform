clear all;

%parameters
sigma     = 2;
threshold = 0.2;
rhoRes    = 2;
thetaRes  = pi/180;

% Load image
I = imread('sfu.jpg');

% Convert to grayscale and scale to [0,1]
I = rgb2gray(I);
I = im2double(I / 255);

% Gaussian filter
I_smooth = imgaussfilt(I, sigma);

% Edge filter - use edge()
I_BW = edge(I_smooth, 'Canny');

% Hough transform
[H] = houghTransform(I_BW, threshold, rhoRes, thetaRes);

% Show normalized H
figure;
imshow(H/ max(H(:)));
