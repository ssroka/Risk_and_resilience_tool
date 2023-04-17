clear;close all;clc

load NDVI_small_county.mat
N = size(NDVI_mat,1);

newNDVI = readtable("point_NDVI_IBM.csv");

NDVI_mat(:,["NDVI"]) = newNDVI(:,["NDVI"]);








