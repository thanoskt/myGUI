function reconstructed = surface_reconstruction(segmented, original, threshold)
%3d reconstruction

% close all

volumesize = size(segmented);
reconstructed = zeros(volumesize(1),volumesize(2),volumesize(3));

% threshold2 = 0.30;

for i=20:80
    Ithres = squeeze(segmented(:,:,i))>(threshold);
    
    
    original_Im = squeeze(original(:,:,i));
    Inew = Ithres.*original_Im;
    
    reconstructed(:,:,i) = Inew;
%     total_volume_new2 = permute(total_volume,[3,2,1]);
end



% sliceomatic(reconstructed);

smoothed = smooth3(reconstructed);

reconstructed2 = zeros(volumesize(1),volumesize(2),volumesize(3));

for i=1:volumesize(1)
    for j=1:volumesize(2)
%         res_interp = interp1(1:80,squeeze(total_volume_new2(i,j,:)),1:80,'PCHIP');
        
%         new_matrix(i,j,:)=res_interp;

filter_array = medfilt1(squeeze(smoothed(i,j,:)));
filter_array = medfilt1(squeeze(reconstructed(i,j,:)));
        
        reconstructed2(i,j,:)=filter_array;
    end
end

for i=46:80
    reconstructed2(:,:,i) = zeros(volumesize(1),volumesize(2));
end

figure
%The struct fv contains the faces and vertices of the isosurface, which you can pass directly to the patch command.
% [f v] = isosurface(new_matrix,.20);
p = patch(isosurface(reconstructed2,.1),'FaceColor','red','EdgeColor','none');

hcap = patch(isocaps(reconstructed2,.1),'FaceColor','interp','EdgeColor','none');
view(3)
axis tight
daspect([1 1 1])
colormap(gray(100))

camlight left
camlight
lighting gouraud
isonormals(reconstructed2,p)


