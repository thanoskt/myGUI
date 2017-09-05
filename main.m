%%%%%%%%%%%%%%% main %%%%%%%%%%%%

%3d reconstruction
clc
clear
close all

 %% dat to matrix for visualization and processing 
fid = fopen('Dataset02_Nx80Ny89Nz54.dat','r');

A = fread(fid,'single');
A = reshape(A,54,89,80);
% mat2gray seems to work similarly to hist. eq.
original_volume = mat2gray(A);
% saving into dicom format for Slicer or ITK-SNAP
% dicom_write_volume(original_volume,'Dataset02',[54,89,80])

% save('Dataset02.mat','original_volume');

volumesize = size(original_volume);

%show curve evolution - default is zero
show_evol = true;
segmented_volume = volume_segmentation(original_volume,show_evol);


threshold = 0.1;
reconstructed_volume = surface_reconstruction(segmented_volume,original_volume,threshold);


for i = 18:65
    img = squeeze(original_volume(:,:,i));
    
    basePath = 'C:\\Users\\Thanos\\Documents\\MATLAB\\MPI_Ultrasound\\Activeontours\\Images/original_image%d.jpg';
    path = sprintf(basePath,i);
    imwrite(img,path)
end
