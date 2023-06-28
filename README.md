# Large-scale high-resolution single-photon imaging


## 1. System requirements
### 1.1 All software dependencies and operating systems (including version numbers)
The project has been tested on Windows 10 and Ubuntu 18.04.1 LTS (xxx).
### 1.2 Versions the software has been tested on
The project has been tested on Python x.x.x and matlab 2022a.
### 1.3 Any required non standard hardware
There is no non-standard hardware required for this project. 



## 2. Installation guide
### 2.1 Instructions

To install the software, clone the repository and run the following command in the terminal:
```
git clone https://github.com/bianlab/single-photon.git
```
    
### 2.2 Typical install time on a "normal" desk top computer 
The installation time is approximately x minute.

## 3. Demo
### 3.1 Instructions to run on data
#### 3.1.1 How to run the software to synthesis images
To run the software on the data, run the following command in the matlab terminal:
```matlab
main.m
```

### 3.2 Expected output

#### 3.2.1 Expected output for the synthesis images 
The synthesis images are saved in the folder 'output/test' as 'xmW_yframes_z.tiff' where x is the power of the laser, y is the number of frames, and z is the number of the image in the sequence. Here are example synthetic images at 20mW, composed of 32 frames and 256 frames respectively:




| Ground truth | Composed of 32 frames at 20mW | Composed of 256 frames at 20mW |
|:---:|:---:|:---:|
| ![图片1](./images/target.jpg) | ![图片2](./images/20mW_32frames_1.jpg) | ![图片3](./images/20mW_256frames_1.jpg) |


The output is displayed in the terminal:
```matlab
256 frames, psnr = 15.8988
256 frames, psnr = 18.4644
256 frames, psnr = 20.8186
512 frames, psnr = 16.9459
512 frames, psnr = 20.6258
512 frames, psnr = 22.0559
1000 frames, psnr = 20.0973
1000 frames, psnr = 23.3283
1000 frames, psnr = 24.4419
......
```
where the first number is the number of frames, and the second number is the PSNR value compared to the ground truth.
### 3.3 Expected run time for demo on a "normal" desktop computer
The expected run time is approximately x minute.

## 4. Instructions for use
### 4.1 How to run the software on your data to synthesize images
To synthesize images using your data, please place your respective images inside the 'input' folder.

If you wish to adjust the frames and power settings of the laser, you can modify the code snippet as shown below:
```python
frames_list=[1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1000];
power_list=[10, 20, 40];
processImage(I[image_index], frames_list, power_list, image_index);
```
In this code:
- `frames_list` represents the different frame options you can choose from.
- `power_list` outlines the available power settings for the laser. 
- `processImage` function will then take these parameters and process the image.

Please note that the array `I` stores the images, and `image_index` is used to select the specific image from this array.