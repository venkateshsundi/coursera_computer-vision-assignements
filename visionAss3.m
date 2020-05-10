clc
clear all
close all
img = imread('cameraman.tif');
[Gx, Gy] = imgradientxy(img);
[Gmag, Gdir] = imgradient(Gx, Gy);