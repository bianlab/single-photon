function processScaleAndSubframes(c, num_pixel, num_sub, scale, image_index)
c = imresize(c,[num_pixel 1*num_pixel]); %% Resize the image
d = scale*c;
subframes = zeros(num_pixel,1*num_pixel,num_sub);

%% Subframes generation
for i = 1:num_pixel
    for j = 1:num_pixel*1
        for k = 1:num_sub
            m = frame_si(d(i,j));
            subframes(i,j,k) = m;
        end
    end
end

%% Afterpulsing
% The code here adds afterpulsing effects
for k=1:num_sub-1
    for i=1:num_pixel
        for j=1:num_pixel*1
            if subframes(i,j,k)>0
                for t=1:subframes(i,j,k)
                    if rand(1)<0.01
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
            end

        end
    end
end
%% Crosstalking
% The code here adds crosstalking effects

for k=1:num_sub
    for i=1:num_pixel
        for j=1:num_pixel
            if rand(1)<0.0001
                if i==1 && j==1
                    if (subframes(i+1,j,k)+subframes(i,j+1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if i==num_pixel &&j==1
                    if (subframes(i-1,j,k)+subframes(i,j+1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if i==1 && j==num_pixel
                    if (subframes(i+1,j,k)+subframes(i,j-1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if i==num_pixel && j==num_pixel
                    if (subframes(i-1,j,k)+subframes(i,j-1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if i==1 && j>1 && j<num_pixel
                    if (subframes(i+1,j,k)+subframes(i,j-1,k)+subframes(i,j+1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if i==num_pixel && j>1 && j<num_pixel
                    if (subframes(i-1,j,k)+subframes(i,j-1,k)+subframes(i,j+1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if j==1 && i>1 && i<num_pixel
                    if (subframes(i-1,j,k)+subframes(i+1,j,k)+subframes(i,j+1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if j==num_pixel && i>1 && i<num_pixel
                    if (subframes(i-1,j,k)+subframes(i+1,j,k)+subframes(i,j-1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
                if i>1 && i<num_pixel && j>1 && j<num_pixel
                    if (subframes(i-1,j,k)+subframes(i+1,j,k)+subframes(i,j-1,k)+subframes(i,j+1,k))>0
                        subframes(i,j,k)=subframes(i,j,k)+1;
                    end
                end
            end
        end
    end
end
%% Generate a frame from subframes
frame = zeros(num_pixel,1*num_pixel);
for i = 1:num_pixel
    for j = 1:num_pixel*1
        for k = 1:num_sub
            frame(i,j) = frame(i,j) + subframes(i,j,k);
        end
    end
end

%% Dark count rate
load('count_dark.mat');
randomdcr = zeros(32,32); %% used for 60000 frames at 0.02us integration time
for i = 1:32
    for j = 1:32
        randomdcr(i,j) = random('Poisson',count_dark(i,j));
    end
end

%% Add noise
frame2 = frame + randomdcr/60000*num_sub;

%% Normalize
truthp = mat2gray(d); %% the truth ranges in (0-1)
frameout = mat2gray(frame2);

%% Display the final output
figure; imshow(frameout);
p = psnr(truthp, frameout);
title([num2str(num_sub) ' frames, psnr = ' num2str(p) ])
disp([num2str(num_sub) ' frames, psnr = ' num2str(p) ])
%% Save the output frame
imwrite(frameout,['.\output\test\' num2str(scale) 'mW_'  num2str(num_sub) 'frames_' num2str(image_index) '.tiff'])
end
