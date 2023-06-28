function I = loadImages(file_path)
    % Get a list of all .jpg image files in the directory
    img_path_list = dir(strcat(file_path,'*.jpg'));

    % Get the number of image files
    img_num = length(img_path_list);

    % Create a cell array to store the images
    I = cell(1, img_num);

    % Check if there are any image files
    if img_num > 0
        % Read each image file
        for j = 1:img_num
            % Get the name of the image file
            image_name = img_path_list(j).name;

            % Read the image file
            image = imread(strcat(file_path, image_name));

            % Store the image in the cell array
            I{j} = image;
        end
    end
end
