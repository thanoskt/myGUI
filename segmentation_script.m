% A small script %
clc
clear all
% close all

 %% dat to matrix for visualization and processing 
fid = fopen('Dataset02_Nx80Ny89Nz54.dat','r');
A = fread(fid,'single');
A = reshape(A,54,89,80);
% mat2gray seems to work similarly to hist. eq.
I = mat2gray(A);

heart = imread('IMG_011.JPG');
Im = imrotate(heart,-90);
I= mat2gray(Im);

% vis3d(Im)

% saving into dicom format for Slicer or ITK-SNAP
% dicom_write_volume(B,'Dataset02',[54,89,80])


% save('Dataset02.mat','B');





% 
% for i=30:80
%    
%   Im = squeeze(I(:,:,35));
%   num_iter = 2;
%   delta_t = 1/7;
%   kappa = 30;
%   option = 1;
% %   ad = anisodiff2D(Im,num_iter,delta_t,kappa,option);
%   ad = histeq(ad);
%   figure, subplot 121, imshow(Im,[]), subplot 122, imshow(ad,[])

% 
% ad =Im;
% %     Im = squeeze(I(:,:,i));
%     m = zeros(size(ad,1),size(ad,2));
%     m(5:53,30:65)=1;
%     seg = chenvese(ad,'whole',1000,0.01,'vector');
%     
% 
%     basePath = 'C:\\Users\\Thanos\\Documents\\MATLAB\\MPI_Ultrasound\\Chan-Vese\\images2/image%d.jpg';
%     path = sprintf(basePath,i);
%     imwrite(seg, path);
% end







%%

%for loop for each slice
for i=30:80
    % %   ad = anisodiff2D(Im,num_iter,delta_t,kappa,option);

    
    thres_flag = false;
    while ~thres_flag
   
        threshold = 0.35;
        Im = squeeze(I(:,:,i))>(threshold);
        figure
        imshow(Im)
      
%         imagesc(Im)
        
        % algorithm to check closed curves goes here%
        %
        [Inew,S,centroids] = check_closed_curves(Im);
        siz = size(centroids,1)
        %try to find maximum 3 centroids
        %by increasing the threshold value
        while ( size(centroids,1)>3 )
            threshold = threshold + 0.01;
            Im = squeeze(I(:,:,i))>(threshold);
%             imagesc(Im)
            [Inew,S,centroids] = check_closed_curves(Im);
            thres_flag = true;
            disp('first')

        end
        
        %try to find at least one centroid
        %by decreasing the threshold value

        while (isempty(centroids) && threshold > 0.15)
            threshold = threshold - 0.05;
            Im = squeeze(I(:,:,i))>(threshold);
%             imagesc(Im)
            [Inew,S,centroids] = check_closed_curves(Im);
            if (~isempty(centroids))
                thres_flag = true;
            end
            disp('second')
        end
        
        if (size(centroids,1)>0 && size(centroids,1)<4)
            thres_flag = true;
        end
        
        if isempty(centroids)
            dips('no closed surface for image %d',i)
        end
        
        figure
        imshow(Im)
        
%         imwrite(Im,'test_frame.jpg');

        if (~isempty(centroids))
            hold on
            scatter(centroids (:,1),centroids (:,2),20,'filled');
            centroids; 
        end
        pause;
        i
        
        
%          %%active contours
%         if i==35
%             m = zeros(size(Im,1),size(Im,2));
%             m(5:53,30:65)=1;
%             seg = chenvese(Im,m,200,0.1,'chan');
%             pause
%         end
% %         
%         basePath = 'C:\\Users\\Thanos\\Documents\\MATLAB\\MPI_Ultrasound\\Chan-Vese\\images2/image%d.jpg';
%         path = sprintf(basePath,i);
%         imwrite(seg, path);
%         
       
        
                
    %% Usage of active contours (aka snakes) %%
        
%         
% %         e.g. no closed_curv was found
% %         re adjust threshold value
%         threshold = threshold + 0.15;
%         
% %         use again algorithm for closed curves
% %         e.g. 1 closed_curv was found
%         closed_curv = 1;
% 
%         if closed_curv <= 2 && closed_curv > 0
% %             if anatomical conditions are true
%                 thres_flag = true;
%         end
    end
end
% 
% iterpolate data to reconstruct the model