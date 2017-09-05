% A small script %
close all
clc
clear all

 %% dat to matrix for visualization and processing 
fid = fopen('Dataset02_Nx80Ny89Nz54.dat','r');
A = fread(fid,'single');
A = reshape(A,54,89,80);
% mat2gray seems to work similarly to hist. eq.
B = mat2gray(A);
%%

threshold = 0.35;
%// Read, threshold and clean up the image
%%%%%%%%%%%Im = im2bw(imread('frame_xz_Dataset02.jpg'));

for i=25:80
    Im = squeeze(B(:,:,i))>(threshold);
    %Im = imclearborder(Im,4);

    %// Apply disk structuring element to morphologically close the image.
    %// Play around with the size to alter the output.
    se = strel('diamond',1);

    Im_closed = imclose(Im,se);
    figure
    imshow(Im_closed);
    figure
    imshow(~Im_closed)

    %// Find centroids of circle-ish shapes. You can also get the area to filter
    %// out those you don't want.
    S = regionprops(~Im_closed,'Centroid','Area');

    %// remove the outer border of the image (1st output of regioprops).
    S(1) = [];

    %// Make array with centroids and show them.
    centroids  = vertcat(S.Centroid);

    imshow(Im)
    hold on
    scatter(centroids (:,1),centroids (:,2),40,'filled')

pause, i
end