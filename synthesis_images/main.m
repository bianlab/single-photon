%% Close all figures
close all;
clear;
%% Specify the path to the image files
file_path = '.\input\';

%% Load Images
I = loadImages(file_path);

%% Display the first image
figure; imshow(I{1})

start_index=1;
end_index=length(I); % Adjust based on memory capacity
frames_list=[1 2 4 8 16 32 64 128 256 512 1000];
power_list=[10 20 40];

for image_index=start_index:end_index
    processImage(I{image_index}, frames_list, power_list, image_index);
end
