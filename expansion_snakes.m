
function [O,J]=expansion_snakes(I,center,show_evolution)
% % % [O,J]=Snake2D(I,P,Options)
% % %  
% % % inputs,
% % %   I : An Image of type double preferable ranged [0..1]
% % %   P : List with coordinates descriping the rough contour N x 2
% % %   Options : A struct with all snake options
% % %   
% % % outputs,
% % %   O : List with coordinates of the final contour M x 2
% % %   J : Binary image with the segmented region
% % %
% % % options (general),
% % %  Option.Verbose : If true show important images, default false
% % %  Options.nPoints : Number of contour points, default 100
% % %  Options.Gamma : Time step, default 1
% % %  Options.Iterations : Number of iterations, default 100
% % %
% % % options (Image Edge Energy / Image force))
% % %  Options.Sigma1 : Sigma used to calculate image derivatives, default 10
% % %  Options.Wline : Attraction to lines, if negative to black lines otherwise white
% % %                    lines , default 0.04
% % %  Options.Wedge : Attraction to edges, default 2.0
% % %  Options.Wterm : Attraction to terminations of lines (end points) and
% % %                    corners, default 0.01
% % %  Options.Sigma2 : Sigma used to calculate the gradient of the edge energy
% % %                    image (which gives the image force), default 20
% % %
% % % options (Gradient Vector Flow)
% % %  Options.Mu : Trade of between real edge vectors, and noise vectors,
% % %                default 0.2. (Warning setting this to high >0.5 gives
% % %                an instable Vector Flow)
% % %  Options.GIterations : Number of GVF iterations, default 0
% % %  Options.Sigma3 : Sigma used to calculate the laplacian in GVF, default 1.0
% % %
% % % options (Snake)
% % %  Options.Alpha : Membrame energy  (first order), default 0.2
% % %  Options.Beta : Thin plate energy (second order), default 0.2
% % %  Options.Delta : Baloon force, default 0.1
% % %  Options.Kappa : Weight of external image force, default 2
% % 


% %build a curve around the center
    x = center(1)
    y = center(2)

    Cx = [y-2, y-2, y-2, y, y+1, y+1, y+1, y];
    Cy = [x-1, x, x+2, x+2, x+2, x, x-1, x-1];

    % Make an array with the clicked coordinates
    P=[Cx(:) Cy(:)];

    %  % Start Snake Process
    Options=struct;




    %%%%%%%%%%%%%%%%%% GENERAL OPTIONS %%%%%%%%%%%%%%%%%%%
    % % %  Option.Verbose : If true show important images, default false
    Options.Verbose=show_evolution;
    % % %  Options.nPoints : Number of contour points, default 100
    Options.nPoints=200;
    % % %  Options.Iterations : Number of iterations, default 100
     if (i<35)
        Options.Iterations=200;
    else
        Options.Iterations=100;
    end
    

    %%%%%%%%%%%%%%%%%% IMAGE ENERGY %%%%%%%%%%%%%%%%
    % % %  Options.Sigma1 : Sigma used to calculate image derivatives, default 10
    Options.Sigma1=2;
    % % %  Options.Wline : Attraction to lines, if negative to black lines otherwise white lines , default 0.04
    Options.Wline=1.5; %1.5
    %PREVIOUSLY 0.05
    % % %  Options.Wedge : Attraction to edges, default 2.0
    Options.Wedge=10.5; %10.5
    %PREVIOUSLY 3
    % % %  Options.Wterm : Attraction to terminations of lines (end points) and corners, default 0.01
    Options.Wterm=3.1; 
    %PREVIOUSLY 3.1
    % % %  Options.Sigma2 : Sigma used to calculate the gradient of the edge energy
    % % %                    image (which gives the image force), default 20
    Options.Sigma2=0.4; 

    % defaultoptions=struct('Verbose',false,'nPoints',100,'Wline',0.04,'Wedge',2,'Wterm',0.1,'Sigma1',0.8,'Sigma2',1,'Alpha',0.2,'Beta',0.2,'Delta',0.1,'Gamma',1,'Kappa',2,'Iterations',100,'GIterations',0,'Mu',0.2,'Sigma3',1);


    %%  %%%%%%%%%%%%%%%%%%%%% SNAKE %%%%%%%%%%%%%%%%%%%%
    % % %  Options.Alpha : Membrame energy  (first order), default 0.2
    % Tension is the opposite of compression.%%
    %lower values may lead to leakage
    Options.Alpha=1.4; %1.4
    % % %  Options.Beta : Thin plate energy (second order), default 0.2
    %Stiffness is the rigidity of an object — the extent to which it resists deformation
    %lower values allow corners
    Options.Beta=0.1; %0.4
    % % %  Options.Delta : Baloon force, default 0.1
    Options.Delta=0.08; %0.08;
    % % %  Options.Kappa : Weight of external image force, default 2
    Options.Kappa=4.0;
    %remember : first term will have larger values if there is a large gap
    %between succesive points on the contour and minimizing it will minimize
    %the total length of the contour.
    %second term will be larger where the contour is bending and requires the
    %contour to be as smooth as possible


    [O,J]=Snake2D(I,P,Options);
    % Show the result
    Irgb(:,:,1)=I;
    Irgb(:,:,2)=I;
    Irgb(:,:,3)=J;
    figure, imshow(Irgb,[],'InitialMagnification','fit'); 
    hold on; plot([O(:,2);O(1,2)],[O(:,1);O(1,1)]);
     
end
