function varargout = my_gui_multiple(varargin)
% MY_GUI_MULTIPLE MATLAB code for my_gui_multiple.fig
%      MY_GUI_MULTIPLE, by itself, creates a new MY_GUI_MULTIPLE or raises the existing
%      singleton*.
%
%      H = MY_GUI_MULTIPLE returns the handle to a new MY_GUI_MULTIPLE or the handle to
%      the existing singleton*.
%
%      MY_GUI_MULTIPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_GUI_MULTIPLE.M with the given input arguments.
%
%      MY_GUI_MULTIPLE('Property','Value',...) creates a new MY_GUI_MULTIPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before my_gui_multiple_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to my_gui_multiple_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help my_gui_multiple

% Last Modified by GUIDE v2.5 01-Sep-2017 16:07:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @my_gui_multiple_OpeningFcn, ...
                   'gui_OutputFcn',  @my_gui_multiple_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before my_gui_multiple is made visible.
function my_gui_multiple_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to my_gui_multiple (see VARARGIN)
clc
% Choose default command line output for my_gui_multiple
handles.output = hObject;

% Load the default options for the edit boxes (See end of the file)
default(hObject, handles);


% Use the correct names, for the objects, of course...
set(handles.pnlsnaketype, 'selectedobject', handles.Shrinking_radiobutton)
set(handles.gvf_opt, 'selectedobject', handles.GVF_off)
set(handles.pnlchanvese, 'Visible', 'off');
set(handles.slicegroup, 'Visible', 'off');

handles.segmentation_type = 'snakes';

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = my_gui_multiple_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


function close_Callback(hObject, eventdata, handles)
close all



            %% Load Image %% 
function pushbutton8_Callback(hObject, eventdata, handles)
% Retrieve GUI data (the handles structure)
handles = guidata(hObject);
global im2
display('Loading image..');

try
    [FileName,PathName] = uigetfile('*.*','Select the MATLAB code file')
    [pathstr,name,ext] = fileparts(FileName)
    try
        if strcmp(ext,'.mat')   

            Load = load(FileName);
            im = getfield(Load,char(fieldnames(Load)));                
            im2 = im;
            imshow(im) 
        else
            im = imread(FileName);
            im2 = im; %we will use it for restore
            imshow(im) 
        end
    catch
       msgbox('Wrong type of file')
       warning('Problem using function.  Assigning a value of 0.');
       im = 0;              
    end
catch
    warning('Image Loading - Canceled');
end
 handles.myImage = im;
 guidata(hObject,handles);

            %% Load Volume %%
function pushbutton9_Callback(hObject, eventdata, handles)
    global im2 no_slice 
    handles.originalVolume = 0;
    handles = guidata(hObject);
    display('Loading Volume..');
    try
        %use this to load the image from a volume
        [FileName,PathName] = uigetfile('*.*','Select the MATLAB code file');
        [pathstr,name,ext] = fileparts(FileName) ; 
            try
                if strcmp(ext,'.dat')
                    fid = fopen(fullfile(PathName,FileName),'r');
                    A = fread(fid,'single');
                    disp('going to the reshape point')
                    A = reshape(A,120,90,80);
                    %%%%
    %               For the previous data :
    %               A = reshape(A,54,89,80);
                    %%%%           
                    % mat2gray also works similarly to hist. eq.
                    original_volume = mat2gray(A);  
                    prompt = {'Enter number of slice:'};
                    dlg_title = 'Slice';
                    num_lines = 1;
                    defaultans = {'0'};
                    slicenumber = inputdlg(prompt,dlg_title,num_lines,defaultans);
                    no_slice = str2num(slicenumber{:});
                    im = squeeze(original_volume(:,:,no_slice));
                    im2 = im; %we will use it for restore
                    imshow(im,[])

                 elseif strcmp(ext,'.mat')   
                    prompt = {'Enter number of slice:'};
                    dlg_title = 'Slice';
                    num_lines = 1;
                    defaultans = {'0'};
                    slicenumber = inputdlg(prompt,dlg_title,num_lines,defaultans);
                    no_slice = str2num(slicenumber{:});
                    fullname = fullfile(PathName,FileName);
                    Load = load(fullname);
                    original_volume = getfield(Load,char(fieldnames(Load)));
                    im = squeeze(original_volume(:,:,no_slice));
                    im2 = im; 
                    imshow(im,[])

                elseif strcmp(ext,'.tif')
                    prompt = {'Enter number of slice:'};
                    dlg_title = 'Slice';
                    num_lines = 1;
                    defaultans = {'0'};
                    slicenumber = inputdlg(prompt,dlg_title,num_lines,defaultans);
                    no_slice = str2num(slicenumber{:});
                    im = mat2gray(imread(FileName,no_slice));
                    im2 = im;
                    imshow(im,[])
                   
                elseif strcmp(ext,'.nrrd')
                    prompt = {'Enter number of slice:'};
                    dlg_title = 'Slice';
                    num_lines = 1;
                    defaultans = {'0'};
                    slicenumber = inputdlg(prompt,dlg_title,num_lines,defaultans);
                    no_slice = str2num(slicenumber{:});
                    fullname = fullfile(PathName,FileName);
                    original_volume = nrrdread(fullname);
                    im = mat2gray(squeeze(original_volume(:,:,no_slice)));
                    im2 = im; 
                    imshow(im,[])
                end

                set(handles.slice_no_value, 'string', slicenumber{:} );

            catch
               msgbox('Wrong type of file')
               warning('Problem using function.  Assigning a value of 0.');
            end
            
             try         
                originalVolume = original_volume;
%                 size(original_volume)
                set(handles.slicegroup, 'Visible', 'on');
                handles.originalVolume = original_volume;
            catch
               msgbox('Error when setting slice number')
               warning('Error when setting slice number.  Assigning a value of 0.');
               no_slice = 0;
               
             end
            handles.myImage = im;
    catch
        warning('Volume Loading - Canceled');
    end
 guidata(hObject,handles);
    
% --- Convert RGB image into grayscale
function grayscale_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
im =  handles.myImage;
try
    imgray = (im(:,:,1)+im(:,:,2)+im(:,:,3))/3;
    imshow(imgray,[]); 
    im = imgray;
catch ME
    msg = ME.message
    msgbox('Works only for RGB images')
end
 handles.myImage = im;
 guidata(hObject,handles);

% --- Threshold slider
function threshold_slider_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
im =  handles.myImage;
thres_val = get(hObject,'Value');
assignin('base','thres_val',thres_val);
set(handles.thres_txt,'String',num2str(thres_val,3));
imthres = im>thres_val;
imshow(imthres)
 handles.myImage = imthres;
 guidata(hObject,handles);

% --- 1st Restore button
function pushbutton10_Callback(hObject, eventdata, handles)
global im2
handles = guidata(hObject);
handles.myImage = im2;
imshow(im2)
guidata(hObject,handles);


% --- Start (segmentation) button
function start_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
im = handles.myImage;
segmentation_type = handles.segmentation_type;

if strcmp(segmentation_type,'snakes')
    disp('performing segmentation using classic Snakes algorithm')
    typeofsnakeObj = get(handles.pnlsnaketype,'SelectedObject');
    choice = get(typeofsnakeObj,'String');
    %check if GVF option is enabled
    GVF_optObj = get(handles.gvf_opt,'SelectedObject');
    GVF_choice = get(GVF_optObj,'String');

    Options=struct;
    
    show_evolution = false;
    Options.Iterations = str2double(get(handles.iterat_num_val,'String'));
    Options.nPoints = str2double(get(handles.nPoints_val,'String'));

    switch choice
        case 'Shrinking'
            Options.Alpha = str2num(get(handles.SAlpha_val,'String'));
            Options.Beta  = str2num(get(handles.SBeta_val,'String'));
            Options.Delta = str2num(get(handles.SDelta_val,'String'));
            Options.Kappa = str2num(get(handles.SKappa_val,'String'));

            Options.Wedge = str2num(get(handles.SWedge_val,'String'));
            Options.Wline = str2num(get(handles.SWline_val,'String'));
            Options.Wterm = str2num(get(handles.SWterm_val,'String'));
            Options.Sigma1 = str2num(get(handles.SSigma1_val,'String'));
            Options.Sigma2= str2num(get(handles.SSigma2_val,'String'));

            switch GVF_choice
                case 'On'      
                    disp('GVF is enabled')
                    Options.GIterations = str2num(get(handles.gvf_iterat_val,'String'))
                    Options.Sigma3 = str2num(get(handles.sigma3_val,'String'))
                    Options.Mu = str2num(get(handles.mu_val,'String'))
                case 'Off'     
                    disp('GVF is not enabled')
            end

        case 'Expansion'
            Options.Alpha = str2num(get(handles.EAlpha_val,'String'));
            Options.Beta = str2num(get(handles.EBeta_val,'String'));
            Options.Delta = str2num(get(handles.EDelta_val,'String'));
            Options.Kappa = str2num(get(handles.EKappa_val,'String'));

            Options.Wedge = str2num(get(handles.EWedge_val,'String'));
            Options.Wline = str2num(get(handles.EWline_val,'String'));
            Options.Wterm = str2num(get(handles.EWterm_val,'String'));
            Options.Sigma1 = str2num(get(handles.ESigma1_val,'String'));
            Options.Sigma2= str2num(get(handles.ESigma2_val,'String'));

            switch GVF_choice
                    case 'On'      
                        disp('GVF is enabled')
                        Options.GIterations = str2num(get(handles.gvf_iterat_val,'String'))
                        Options.Sigma3 = str2num(get(handles.sigma3_val,'String'))
                        Options.Mu = str2num(get(handles.mu_val,'String'))
                    case 'Off'     
                        disp('GVF is not enabled')
            end       
    end

    if any(strcmp('position',fieldnames(handles)))
        switch choice
        case 'Shrinking'
            disp('Shrinking Snake')
            [Oshr,Jshr] = snakes_forGUI(im,show_evolution,handles.position,Options);
            
            if ndims(im)>2
                im = squeeze(im(:,:,1));
            end
            % fix that! error when segmented high res heart image
            % should check first the type of image and then multiply
            % accordingly..
            disp('class of Jhsr')
            class(Jshr)
            disp('class of im')
            class(im)
            
            segmented_im = Jshr.*mat2gray(im);
            segmented_image = segmented_im;
            axes(handles.axes1) 
            imshow(segmented_image,[])
            save('seg_curve.mat','Oshr');
            save('original_image.mat','im');
            
        case 'Expansion'        
            disp('Expansion Snake')
            [Oshr,Jexp] = snakes_forGUI(im,show_evolution,handles.position,Options);
            size(Jexp)
            size(im)
            if ndims(im)>2
                im = squeeze(im(:,:,1));
            end      
            segmented_im2 = (~Jexp).*im;
            segmented_image = segmented_im2;
            axes(handles.axes1) 
            imshow(segmented_image)        
        end      
    else
        msgbox('Please first define the ROI')
    end
    msgbox('Operation Completed');

elseif strcmp(segmentation_type,'chanvese')
    im = mat2gray(im);
    chan_mask = get(handles.chanvese_mask_val,'String');
%     pnlchanvese
    chan_iter = str2num(get(handles.chanvese_iterations_val,'String'));
    chan_mu = str2num(get(handles.chanvese_mu_val,'String'));
    chan_method = get(handles.chanvese_method_val,'String');
    
    usermask = handles.position;  % under construction (?)
    segmented_image = chenvese(im,chan_mask,chan_iter,chan_mu,chan_method,usermask);
    disp('performing segmentation using Chan and Vese algorithm')
end

%check this %
% handles.myImage = segmented_image;
handles.mySegmentedImage = segmented_image;
handles.myCurve = Oshr;
guidata(hObject, handles);



% --- Draw mask button
function drawmask_Callback(hObject, eventdata, handles)
handles=guidata(hObject);
im = handles.myImage;
fig_handle=figure;
imshow(im,[],'InitialMagnification',600);

hFreeHandVec=text(5,4,{'Use mouse to draw ROI and double click to finish'},...
   'FontSize',12,'Color','b');
axis equal;axis off;

markROIdlg='Not yet';

hFreeHandVec=[];
while ~strcmpi(markROIdlg,'Done')
   hFreeHand = imfreehand;
   wait(hFreeHand); % Wait till double click
   hFreeHandVec=[hFreeHandVec,hFreeHand];
   
   pos = getPosition(hFreeHand);
%    maskSum=maskSum | maskFreeHand;
   
   markROIdlg = questdlg({'Press ''Done'', if all ROI''s were marked.',...
      'Press ''Not yet'' if you wish to add additional ROI''s.'},...
      'Setting the initail mask for Active Contours.',...
      'Done','Not yet','Done');
end

delete(hFreeHandVec);
close(fig_handle);
% handles.UserMask=maskSum;
handles.position = pos;
set(hObject,'String','Re-define Mask');

guidata(hObject,handles);


% --------------------------------------------------------------------
function chanvese_tool_ClickedCallback(hObject, eventdata, handles)

handles = guidata(hObject);
set(handles.pnlsnaketype, 'Visible', 'off');
set(handles.gvf_opt, 'Visible', 'off');
set(handles.additionalopt, 'Visible', 'off');
set(handles.pnlchanvese, 'Visible', 'on');
disp('clicked the chanvese')

handles.segmentation_type = 'chanvese';
guidata(hObject, handles);


% --------------------------------------------------------------------
function snakes_tool_ClickedCallback(hObject, eventdata, handles)

handles = guidata(hObject);

set(handles.pnlsnaketype, 'Visible', 'on');
set(handles.gvf_opt, 'Visible', 'on');
set(handles.additionalopt, 'Visible', 'on');
set(handles.pnlchanvese, 'Visible', 'off');


handles.segmentation_type = 'snakes';
guidata(hObject, handles);


% --- Save the segmeented image
function save_segmented_Callback(hObject, eventdata, handles)
global no_slice
handles = guidata(hObject);

% axes(handles.axes1)
% newsegment = getframe();
% mynewseg = newsegment.cdata
% fix this 
mynewseg = handles.mySegmentedImage;
% % %for some reason it is x by y by 3 (fix that!)
% % % mynewseg = mynewseg(:,:,1);

 try
    prompt = {'Enter name for .mat file'};
    dlg_title = 'Input';
    num_lines = 1;
    
    segmname = sprintf('my_segment_%d',no_slice);
    defaultans = {segmname};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    name = answer{1};
    fname=sprintf('%s.mat',name);
    save(fname,'mynewseg');
 catch
    msgbox('Error while saving the segmented image')
   warning('Make sure the segmentation process is complete');
   volume = 0;
end

% --- Set the new slice
function slice_no_value_Callback(hObject, eventdata, handles)
    
global no_slice
original_volume = handles.originalVolume;
global im2
handles = guidata(hObject);
disp('slice no ' ) ;
no_slice = str2num(get(handles.slice_no_value,'String'))
im = squeeze(original_volume(:,:,no_slice));
handles.myImage = im;
im2 = im; 
imshow(im,[])
guidata(hObject, handles);

% --- 2nd Restore button
function pushbutton20_Callback(hObject, eventdata, handles)
global  im2
handles = guidata(hObject);
imshow(im2,[])
im = im2;
handles.myImage = im;
disp('restore image');
guidata(hObject, handles);


% --- Rescale the high resolution image
function pushbutton21_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
prompt = {'Enter scale:'};
                dlg_title = 'Scale';
                num_lines = 1;
                defaultans = {'200'};
                slicestr = inputdlg(prompt,dlg_title,num_lines,defaultans);
                s_val = str2num(slicestr{:});
%default value for s_val was 200
s = s_val./min(size(im,1),size(im,2)); % resize scale
if s<1
   im = imresize(im,s);
end
handles.myImage = im;
iguidata(hObject, handles);
mshow(im,[]);



%%--- Edit the Spline 
function pushbutton22_Callback(hObject, eventdata, handles)
global no_slice firsttime
% global im
handles = guidata(hObject);
im = handles.myImage;

Curve =  handles.myCurve;
if size(Curve,1) > 2
    Oshrt = Curve.';
    inCurve(1,:) = Oshrt(2,:);
    inCurve(2,:) = Oshrt(1,:);
else
    inCurve = Curve;
end

try
    %loading the masked_volume which contains the unfiltered image that
    %will be later used to save the segmented image 
    load masked_volume
    orim = masked_volume(:,:,no_slice);
catch
     warning('Failed to load the original volume. In case you are not working with 4D ultrasound data you can comment these lines.');
     orim = im;
end
% if length(new_curve) > 100
%     disp('not ?')
%     length(new_curve)
%     new_curve = my_bspline(4,new_curve,orim,handles.axes1);
% else
%     this is also a bit ugly .... fix this! 


    if (size(inCurve,2)>40)
        disp('first bspline')
        new_curve = my_bspline(4,inCurve,orim,hObject,handles);
        handles.myCurve = new_curve;
        guidata(hObject,handles);

    else
                disp('second bspline')

        new_curve = edit_new_bspline(4,inCurve,orim,hObject,handles);
        handles.myCurve = new_curve;
    end
    %mySegmentedImage
    guidata(hObject, handles);
%% end    


function load_curve_button_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
 try
    [FileName,PathName] = uigetfile('*.*','Select the MATLAB code file')
    [pathstr,name,ext] = fileparts(FileName)
    try
        if strcmp(ext,'.mat')   
            Load = load(FileName);
            my_curve = getfield(Load,char(fieldnames(Load)));
            handles.myCurve = my_curve; 
        else
            disp('Not supported type of file. Please choose a .mat file') 
        end
    catch
       msgbox('Wrong type of file')
       warning('Problem using function.  Assigning a value of 0.');
       my_curve = 0;
    end
catch
    warning('Curve Loading - Canceled');
 end
guidata(hObject, handles);


%-- Saving the Curve
function pushbutton25_Callback(hObject, eventdata, handles)
global no_slice 
handles = guidata(hObject);
Curve = handles.myCurve;
 try
    prompt = {'Enter name for .mat file'};
    dlg_title = 'Input';
    num_lines = 1;

    % save('myCurve.mat','myCurve');
    curvename = sprintf('new_curve%d',no_slice);
    defaultans = {curvename};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    name = answer{1};
    fname=sprintf('%s.mat',name)
    disp('Saving the new curve')
    save(fname,'Curve');
catch
    msgbox('Error while saving the segmented image')
   warning('Make sure the segmentation process is complete');
   volume = 0;
 end
guidata(hObject, handles);

%--- Default values for the Snakes Segmentation
function default(hObject, handles)
global no_slice

    
    set(handles.iterat_num_val, 'string', '350');
    set(handles.nPoints_val, 'string', '200');
    
    set(handles.SAlpha_val, 'string', '1');
    set(handles.SBeta_val, 'string', '0.4');
    set(handles.SDelta_val, 'string', '-0.08');
    set(handles.SKappa_val, 'string', '6.0');
    set(handles.SWedge_val, 'string', '60.5');
    set(handles.SWline_val, 'string', '1.6');
    set(handles.SWterm_val, 'string', '17.1');
    set(handles.SSigma1_val, 'string', '3');
    set(handles.SSigma2_val, 'string', '0.4');
    
%     if no_slice <= 6
%         set(handles.SAlpha_val, 'string', '0.5');
%         set(handles.SWedge_val, 'string', '70.5');
%         set(handles.SWline_val, 'string', '5');
%         set(handles.SSigma1_val, 'string', '3');
%     elseif no_slice >6 && no_slice<=13
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         
%     elseif no_slice >13 && no_slice<=13
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%     elseif no_slice >=15 && no_slice<10
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%     elseif no_slice > 20 && no_slice<10
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%     elseif no_slice > 27 && no_slice<10
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         
%     elseif no_slice > 27 && no_slice<10
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%         set(handles.SAlpha_val, 'string', '1');
%     end
    

    set(handles.EAlpha_val, 'string', '1.4');
    set(handles.EBeta_val, 'string', '0.1');
    set(handles.EDelta_val, 'string', '0.08');
    set(handles.EKappa_val, 'string', '4.0');
    set(handles.EWedge_val, 'string', '10.5');
    set(handles.EWline_val, 'string', '1.5');
    set(handles.EWterm_val, 'string', '3.1');
    set(handles.ESigma1_val, 'string', '2');
    set(handles.ESigma2_val, 'string', '0.4');
    
    set(handles.gvf_iterat_val, 'string', '100');
    set(handles.sigma3_val, 'string', '2.0');
    set(handles.mu_val, 'string', '0.2');


    guidata(hObject, handles);
    
    
 %% SMALL SCRIPT FOR SAVING 
% % % %     
% % % %     for i = 7:52
% % % %     try
% % % %         segmname = sprintf('my_segment_%d',i);
% % % %         fname=sprintf('%s.mat',segmname);
% % % %         load(fname);
% % % %         segmented_volume(:,:,i) = mynewseg;
% % % %     catch
% % % %         disp('no change for : ')
% % % %         i
% % % %     end
% % % % end


    
    
   %% BUTTONS ETC .. Better ignore them.. 
   function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function SWedge_val_Callback(hObject, eventdata, handles)
    
function SWedge_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton9_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Wline_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function threshold_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function EAlpha_val_Callback(hObject, eventdata, handles)

function EAlpha_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EBeta_val_Callback(hObject, eventdata, handles)
  
function EBeta_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EDelta_val_Callback(hObject, eventdata, handles)

function EDelta_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EKappa_val_Callback(hObject, eventdata, handles)

function EKappa_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


    
    
        
            

function SAlpha_val_Callback(hObject, eventdata, handles)
    
function SAlpha_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SBeta_val_Callback(hObject, eventdata, handles)

function SBeta_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SDelta_val_Callback(hObject, eventdata, handles)
    
function SDelta_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SKappa_val_Callback(hObject, eventdata, handles)
    
function SKappa_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

                        
                            
                                

function SSigma2_val_Callback(hObject, eventdata, handles)

function SSigma2_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SSigma1_val_Callback(hObject, eventdata, handles)
    
function SSigma1_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SWterm_val_Callback(hObject, eventdata, handles)
    
function SWterm_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SWline_val_Callback(hObject, eventdata, handles)
    
function SWline_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ESigma2_val_Callback(hObject, eventdata, handles)
    
function ESigma2_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ESigma1_val_Callback(hObject, eventdata, handles)

function ESigma1_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EWterm_val_Callback(hObject, eventdata, handles)

function EWterm_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EWline_val_Callback(hObject, eventdata, handles)

function EWline_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EWedge_val_Callback(hObject, eventdata, handles)

function EWedge_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function iterat_num_val_Callback(hObject, eventdata, handles)    

function iterat_num_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function gvf_iterat_val_Callback(hObject, eventdata, handles)

function gvf_iterat_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sigma3_val_Callback(hObject, eventdata, handles)

function sigma3_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function mu_val_Callback(hObject, eventdata, handles)

function mu_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nPoints_val_Callback(hObject, eventdata, handles)

function nPoints_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit52_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit53_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit54_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit55_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit56_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit57_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit58_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit59_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit60_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit83_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit84_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit85_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit86_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit87_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit79_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit80_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit81_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit82_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function chanvese_method_val_Callback(hObject, eventdata, handles)

function chanvese_method_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function chanvese_mu_val_Callback(hObject, eventdata, handles)

function chanvese_mu_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function chanvese_iterations_val_Callback(hObject, eventdata, handles)

function chanvese_iterations_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function  chanvese_mask_val_Callback(hObject, eventdata, handles)

function chanvese_mask_val_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function slice_no_value_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end 
    
    
% --- Executes during object creation, after setting all properties.
function pnlsnaketype_CreateFcn(hObject, eventdata, handles)

function pnlsnaketype_SelectionChangeFcn(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function thres_txt_CreateFcn(hObject, eventdata, handles)










        
        
