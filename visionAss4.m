clc
clear all
close all
%Read the image
img = imread('course1image.jpg');
figure,imshow(img);
B = img(1:341,1:400);
G = img(342:682,1:400);
R = img(683:1023,1:400);
c_x = ceil((341/2-25));
c_y = (400/2-25);
ref_img_region = double(G(c_x:c_x + 50, c_y:c_y + 50));

red_offset = offset(double(R(c_x:c_x + 50, c_y:c_y + 50)), ref_img_region);
shifted_red = circshift(R, red_offset);


blue_offset = offset(double(B(c_x:c_x + 50, c_y:c_y + 50)), ref_img_region);
shifted_blue = circshift(B, blue_offset);

ColorImg_aligned = uint8(cat(3, shifted_red, G, shifted_blue));
%ColorImg_aligned = cat(3, G, shifted_red, shifted_blue);
%ColorImg_aligned = cat(3, G, shifted_blue, shifted_red);
%ColorImg_aligned = cat(3, G, shifted_blue, shifted_red);
imshow(ColorImg_aligned);
function [output] = offset(img1, img2)
    MIN = inf; 
    for x = -10:10
        for y = -10:10
            temp = circshift(img1, [x, y]);
            ssd = sum(sum((img2 - temp).^2));
            if ssd < MIN
                MIN = ssd;
                output = [x, y];
            end
        end
    end
end
