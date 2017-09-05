
function [O,J]=shrinking_snakes(I,show_evolution)

% % [O,J]=Snake2D(I,P,Options)
% %  
% % inputs,
% %   I : An Image of type double preferable ranged [0..1]
% %   P : List with coordinates descriping the rough contour N x 2
% %   Options : A struct with all snake options
% %   
% % outputs,
% %   O : List with coordinates of the final contour M x 2
% %   J : Binary image with the segmented region
% %
% % options (general),
% %  Option.Verbose : If true show important images, default false
% %  Options.nPoints : Number of contour points, default 100
% %  Options.Gamma : Time step, default 1
% %  Options.Iterations : Number of iterations, default 100
% %
% % options (Image Edge Energy / Image force))
% %  Options.Sigma1 : Sigma used to calculate image derivatives, default 10
% %  Options.Wline : Attraction to lines, if negative to black lines otherwise white
% %                    lines , default 0.04
% %  Options.Wedge : Attraction to edges, default 2.0
% %  Options.Wterm : Attraction to terminations of lines (end points) and
% %                    corners, default 0.01
% %  Options.Sigma2 : Sigma used to calculate the gradient of the edge energy
% %                    image (which gives the image force), default 20
% %
% % options (Gradient Vector Flow)
% %  Options.Mu : Trade of between real edge vectors, and noise vectors,
% %                default 0.2. (Warning setting this to high >0.5 gives
% %                an instable Vector Flow)
% %  Options.GIterations : Number of GVF iterations, default 0
% %  Options.Sigma3 : Sigma used to calculate the laplacian in GVF, default 1.0
% %
% % options (Snake)
% %  Options.Alpha : Membrame energy  (first order), default 0.2
% %  Options.Beta : Thin plate energy (second order), default 0.2
% %  Options.Delta : Baloon force, default 0.1
% %  Options.Kappa : Weight of external image force, default 2
% 
% close all
% clc
% clear
% 
% A = imread('frame_xy_Dataset02.jpg');


%try different types
% I = mat2gray(A);
%figure, imshow(I); [y,x] = getpts;

%%%%%%%%% outside %%%%%%%%%%

y = [26 26 26 27 46 47 66 68 70 70 60 48 34];
x = [5  22 37 54 54 54 54 38 25 11 3 1 1];

% Make an array with the clicked coordinates
P=[x(:) y(:)];
%  % Start Snake Process
Options=struct;




    %%%%%%%%%%%%%%%%%% GENERAL OPTIONS %%%%%%%%%%%%%%%%%%%
% % % %     % % %  Option.Verbose : If true show important images, default false
% % % %     Options.Verbose=show_evolution;
% % % %     % % %  Options.nPoints : Number of contour points, default 100
% % % %     Options.nPoints=100;
% % % %     % % %  Options.Iterations : Number of iterations, default 100
% % % %     Options.Iterations=200;
% % % % 
% % % % %      if (i<35)
% % % % %         Options.Iterations=200;
% % % % %     else
% % % % %         Options.Iterations=80;
% % % % %     end
% % % %     
% % % % 
% % % % 
% % % % %     %%%%%%%%%%%%%%%%%% IMAGE ENERGY %%%%%%%%%%%%%%%%
% % % % %     % % %  Options.Sigma1 : Sigma used to calculate image derivatives, default 10
% % % % %     Options.Sigma1=2;
% % % % %     % % %  Options.Wline : Attraction to lines, if negative to black lines otherwise white lines , default 0.04
% % % % %     Options.Wline=0.9; %1.9
% % % % %     %PREVIOUSLY 0.05
% % % % %     % % %  Options.Wedge : Attraction to edges, default 2.0
% % % % %     Options.Wedge=20.5; %10.5
% % % % %     %PREVIOUSLY 3
% % % % %     % % %  Options.Wterm : Attraction to terminations of lines (end points) and corners, default 0.01
% % % % %     Options.Wterm=3.1;
% % % % %     %PREVIOUSLY 3.1
% % % % %     % % %  Options.Sigma2 : Sigma used to calculate the gradient of the edge energy
% % % % %     % % %                    image (which gives the image force), default 20
% % % % %     Options.Sigma2=0.4; 
% % % % % 
% % % % %     % defaultoptions=struct('Verbose',false,'nPoints',100,'Wline',0.04,'Wedge',2,'Wterm',0.1,'Sigma1',0.8,'Sigma2',1,'Alpha',0.2,'Beta',0.2,'Delta',0.1,'Gamma',1,'Kappa',2,'Iterations',100,'GIterations',0,'Mu',0.2,'Sigma3',1);
% % % % % 
% % % % % 
% % % % %     %%%%%%%%%%%%%%%%%%%%%%% SNAKE %%%%%%%%%%%%%%%%%%%%
% % % % %     % % %  Options.Alpha : Membrame energy  (first order), default 0.2
% % % % %     Options.Alpha=1.4;
% % % % %     % % %  Options.Beta : Thin plate energy (second order), default 0.2
% % % % %     Options.Beta=0.4;
% % % % %     % % %  Options.Delta : Baloon force, default 0.1
% % % % %     Options.Delta=-0.08;
% % % % %     % % %  Options.Kappa : Weight of external image force, default 2
% % % % %     Options.Kappa=6.0;




   %%%%%%%%%%%%%%%%%% GENERAL OPTIONS %%%%%%%%%%%%%%%%%%%
        % % %  Option.Verbose : If true show important images, default false
        Options.Verbose=show_evolution;
        % % %  Options.nPoints : Number of contour points, default 100
%         Options.nPoints=100;
%         % %  Options.Iterations : Number of iterations, default 100
%         Options.Iterations=220;
% 
%          if (i<35)
%             Options.Iterations=220;
%         else
%             Options.Iterations=80;
%          end

%         Options.Iterations=200;

%         %%%%%%%%%%%%%%%%%% IMAGE ENERGY %%%%%%%%%%%%%%%%
%         % % %  Options.Sigma1 : Sigma used to calculate image derivatives, default 10
%         Options.Sigma1=1.9;
%         % % %  Options.Wline : Attraction to lines, if negative to black lines otherwise white lines , default 0.04
%         Options.Wline=2.6; %-1.6
%         %PREVIOUSLY 0.05
%         % % %  Options.Wedge : Attraction to edges, default 2.0
%         Options.Wedge=35.5; %35.5
%         %PREVIOUSLY 3
%         % % %  Options.Wterm : Attraction to terminations of lines (end points) and corners, default 0.01
%         Options.Wterm=17.1;
%         %PREVIOUSLY 3.1
%         % % %  Options.Sigma2 : Sigma used to calculate the gradient of the edge energy
%         % % %                    image (which gives the image force), default 20
%         Options.Sigma2=0.4; 
% 
%         % defaultoptions=struct('Verbose',false,'nPoints',100,'Wline',0.04,'Wedge',2,'Wterm',0.1,'Sigma1',0.8,'Sigma2',1,'Alpha',0.2,'Beta',0.2,'Delta',0.1,'Gamma',1,'Kappa',2,'Iterations',100,'GIterations',0,'Mu',0.2,'Sigma3',1);
% 
% 
%         %%%%%%%%%%%%%%%%%%%%%%% SNAKE %%%%%%%%%%%%%%%%%%%%
%         % % %  Options.Alpha : Membrame energy  (first order), default 0.2
%         Options.Alpha=0.2;
%         % % %  Options.Beta : Thin plate energy (second order), default 0.2
%         Options.Beta=0.5;
%         % % %  Options.Delta : Baloon force, default 0.1
%         Options.Delta=-0.08;
%         % % %  Options.Kappa : Weight of external image force, default 2
%         Options.Kappa=6.0;

[O,J]=Snake2D(I,P,Options);
% Show the result
Irgb(:,:,1)=I;
Irgb(:,:,2)=I;
Irgb(:,:,3)=J;
figure, imshow(Irgb,[],'InitialMagnification','fit'); 
hold on; plot([O(:,2);O(1,2)],[O(:,1);O(1,1)]);

  
