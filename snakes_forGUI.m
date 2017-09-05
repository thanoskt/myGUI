
function [O,J]=snakes_forGUI(Image,show_evolution,UserMask,Options)

I = mat2gray(Image);
Mask = [UserMask(:,2) UserMask(:,1)];


Options.Verbose=show_evolution;

[O,J]=Snake2D(I,Mask,Options);
% % Show the result
% Irgb(:,:,1)=I;
% Irgb(:,:,2)=I;
% Irgb(:,:,3)=J;
% figure, imshow(Irgb,[],'InitialMagnification','fit'); 
% hold on; plot([O(:,2);O(1,2)],[O(:,1);O(1,1)]);
% 
%   
