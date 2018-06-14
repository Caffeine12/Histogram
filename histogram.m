%Here I will read image file from UI
[fn pn] = uigetfile('*.png', 'Select image file');
filepath= strcat(pn,fn);
image = imread(filepath);
%Read red green and blue pixel values
red = double(image(:,:,1));
green = double(image(:,:,2));
blue = double(image(:,:,3));
%Took average of red green and blue values of pixels
average = double((red+green+blue)/3);
%Converting double matrix into integer matrix
grayscale = uint8(average);
%Converting grayscale image to binary image
binary = grayscale;
for i=1:size(grayscale,1)
    for j=1:size(grayscale,2)
        if(grayscale(i,j))>127
            binary(i,j)=1;
        else
            binary(i,j)=0;
        end
    end
end
binary=single(binary);
%Displaying the image in UI
figure, imshow(binary);