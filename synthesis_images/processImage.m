function processImage(image, num_sub_values, scale_values, image_index)
    a = image;
    b = rgb2gray(a); %% Convert the image to grayscale
    c = im2double(b); %% Convert the image to double precision

    num_pixel = 32;

    for num_sub = num_sub_values
        for scale = scale_values
            processScaleAndSubframes(c, num_pixel, num_sub, scale, image_index);
        end
    end
end
