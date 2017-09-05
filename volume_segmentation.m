function semgneted_volume = volume_segmentation(I,show_evolution)
%size of a random slice
%using squeeze to remove the 3rd dimension
volumesize = size(I);
semgneted_volume = zeros(volumesize(1),volumesize(2),volumesize(3));

%%
%for loop for each slice
for i=21:62
    
    close all
    
    
    Ia = squeeze(I(:,:,i));
    Ioriginal = Ia;
%     figure
%     imshow(Ioriginal,'InitialMagnification','fit')
   

%     %anisotropic diffusion
%     num_iter = 2;
%     delta_t = 1/7;
%     kappa = 20;
%     option = 1;
%     Ifiltered = anisodiff2D(Ia,num_iter,delta_t,kappa,option);
%     Ioriginal = Ifiltered;
    
    i
    %threshold used for finding closed shapes
    thres_flag = false;
    while ~thres_flag
   
        threshold = 0.37;
        
        %apply a threshold on the image
        Im = squeeze(I(:,:,i))>(threshold);
        
%         imshow(Im,'InitialMagnification','fit')
%         % pause
        % algorithm to check closed curves %
        
        [Inew,S,centroids] = check_closed_curves(Im);
%         siz = size(centroids,1);
%         % pause;

        %try to find maximum 3 centroids
        %by increasing the threshold value
        while ( size(centroids,1)>3 )
            threshold = threshold + 0.01;
            Im = squeeze(I(:,:,i))>(threshold);
%             imagesc(Im)
            [Inew,S,centroids] = check_closed_curves(Im);
            thres_flag = true;
        end
        
        %try to find at least one centroid
        %by decreasing the threshold value
        while (isempty(centroids) && threshold > 0.13)
            threshold = threshold - 0.05;
            Im = squeeze(I(:,:,i))>(threshold);
%             imagesc(Im)
            [Inew,S,centroids] = check_closed_curves(Im);
            if (~isempty(centroids))
                thres_flag = true;
            end
        end
        
        if (size(centroids,1)>0 && size(centroids,1)<4)
            thres_flag = true;
        end
        
        if isempty(centroids)
            disp('no closed surface for image') 
            thres_flag = true;
        end
        
%         figure
%         imshow(Im,'InitialMagnification','fit')
        
        if (~isempty(centroids))
%             hold on
            %show the centroids
%             scatter(centroids (:,1),centroids (:,2),20,'filled');
%             centroids

            [m,n] = size(centroids);
            
            % pause;
            %%
    %%%%%%%%%%%%%%%%%%%%%% expansion snakes %%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%% starting from the centroids %%%%%%%%%%%

            Jexp = zeros(size(Im));
            for j=1:m            
                center = centroids(j,:);
                [O,J] = expansion_snakes(Ioriginal,center,show_evolution);
%                 % pause;
                %build the small shapes
                Jexp = Jexp+J;
            end
%             imshow(Jexp,'InitialMagnification','fit')
            
        end
        % pause;
        %%
      %%%%%%%%%%%%%%%%%%%%%% shrinking snake %%%%%%%%%%%
%         imshow(Ioriginal,'InitialMagnification','fit');
        [Oshr,Jshr] = shrinking_snakes(Ioriginal,show_evolution);
        
       
        %build the total segment    
        if (~isempty(centroids))
%             Jtot = ~Jshr + Jexp;
            Jseg1 = Jshr.*Ioriginal;
            Jseg = Jseg1.*(~Jexp);

        else
%             Jtot = ~Jshr;
            Jseg = Jshr.*Ioriginal;
        end
        semgneted_volume(:,:,i) = Jseg;
        
%         semgneted_volume(i,:,:) = Jseg;
%         semgneted_volume = permute(total_volume,[3,2,1]);
%         imshow(squeeze(total_volume(25,:,:)))


%         total_volume(:,:,i) = Jseg;
% %         imshow(squeeze(total_volume(:,:,25)))
        
        figure
        imshow(Jseg,'InitialMagnification','fit');
         % pause
  
        basePath = 'C:\\Users\\Thanos\\Documents\\MATLAB\\MPI_Ultrasound\\BasicSnake_experimenting2\\my_images/image%d.jpg';
        path = sprintf(basePath,i);
        imwrite(Jseg, path);

    end
    
end


% 
% % interpolate data to reconstruct the model
% figure
% imshow(squeeze(total_volume2(:,:,45)))
% mesh(squeeze(total_volume2(:,:,45)))
% figure
% contour(squeeze(total_volume2(:,:,45)))
% 
% x = [1:54];
% y = [1:89];
% [xx yy] = meshgrid(x, y);
% slice = squeeze(total_volume2(:,:,30));
% for i=1:80
%     slice = squeeze(total_volume2(:,:,i));
% end
