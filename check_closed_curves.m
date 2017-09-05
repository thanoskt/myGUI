function [Im,S,centroids] = check_closed_curves(Im) 


    %Im = imclearborder(Im,4);

    %// Apply disk structuring element to morphologically close the image.
    %// Play around with the size to alter the output.
    se = strel('diamond',3);

    Im_closed = imclose(Im,se);
%     figure
%     imshow(Im_closed);
%     figure
%     imshow(~Im_closed);

    %// Find centroids of circle-ish shapes. You can also get the area to filter
    %// out those you don't want.
    S = regionprops(~Im_closed,'Centroid','Area');

    %// remove the outer border of the image (1st output of regioprops).
    S(1) = [];

    %// Make array with centroids and show them.
    centroids  = vertcat(S.Centroid);

    


end
