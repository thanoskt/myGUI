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

%       handles = guidata(hObject);
%     handles.myCurve = new_curve;
%     handles.mySegmImage = new_segmented_image;
%     guidata(aa hObject, handles);
% global segmentation_type 
% segmentation_type = 'snakes';

% --- Outputs from this function are returned to the command line.
function varargout = my_gui_multiple_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
close all

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function SWedge_val_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton8_CreateFcn(hObject, eventdata, handles)

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% % --- Executes on selection change in popupmenu3.
% function popupmenu3_Callback(hObject, eventdata, handles)
% 
% % Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
% %        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% 
% function Wline_value_Callback(hObject, eventdata, handles)
% 
% % Hints: get(hObject,'String') returns contents of Wline_value as text
% %        str2double(get(hObject,'String')) returns contents of Wline_value as a double
% 

% --- Executes during object creation, after setting all properties.
function Wline_value_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

            %% Load Image %% 
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% Retrieve GUI data (the handles structure)
handles = guidata(hObject);

% global im im2
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
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global im2 no_slice
    
    handles = guidata(hObject);
    display('Loading Volume..');
    try
        %use this to load the image from a volume
        [FileName,PathName] = uigetfile('*.*','Select the MATLAB code file');
        [pathstr,name,ext] = fileparts(FileName) ; 
            try
                if strcmp(ext,'.dat')

        %             load(FileName);
                    fid = fopen(fullfile(PathName,FileName),'r');

                    A = fread(fid,'single');

                    disp('going to the reshape point')
                    A = reshape(A,120,90,80);
    %                 A = reshape(A,54,89,80);

                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    OLD   A = reshape(A,54,89,80);
                    % mat2gray works similarly to hist. eq.
                    % original_volume = uint8(255 * mat2gray(A));  %%%%
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
                    im2 = im; %we will use it for restore
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
    % %                 Load = load(fullname);

                    original_volume = nrrdread(fullname);
    %                 original_volume = mat2gray(my_image);

                    im = mat2gray(squeeze(original_volume(:,:,no_slice)));
                    im2 = im; %we will use it for restore
                    imshow(im,[])
                end
%                 disp('1');
%                 slicenumber
%                 disp('2');
%                 slicenumber{:}
%                 disp('3');
%                 numstr = num2str(no_slice)
%                 pause;
                set(handles.slice_no_value, 'string', slicenumber{:} );

            catch
               msgbox('Wrong type of file')
               warning('Problem using function.  Assigning a value of 0.');
               volume = 0;
            end
             try
                global gvolume
                gvolume = original_volume;
                size(gvolume)
                 disp('test')
                set(handles.slicegroup, 'Visible', 'on');

            catch
               msgbox('Error when setting slice number')
               warning('Error when setting slice number.  Assigning a value of 0.');
               no_slice = 0;
               gvolume = 0;
             end
            handles.myImage = im;
    catch
        warning('Volume Loading - Canceled');
    end

 guidata(hObject,handles);
    
  %%  
    
% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(hObject);
im =  handles.myImage;
%convert into grayscale image using r=g=b=(r+g+b)/3
% global im2
try
%     im2 = im;
    imgray = (im(:,:,1)+im(:,:,2)+im(:,:,3))/3;
    imshow(imgray,[]); 
    im = imgray;
    
catch ME
    msg = ME.message
    msgbox('Works only for RGB images')
end
 handles.myImage = im;
 guidata(hObject,handles);

% --- Executes on slider movement.
function threshold_slider_Callback(hObject, eventdata, handles)
% hObject    handle to threshold_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% global im
handles = guidata(hObject);
im =  handles.myImage;

thres_val = get(hObject,'Value');
assignin('base','thres_val',thres_val);
set(handles.thres_txt,'String',num2str(thres_val,3));

imthres = im>thres_val;
imshow(imthres)

%check this
 handles.myImage = imthres;
 guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function threshold_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshold_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function thres_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thres_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in Expansion_radiobutton.
function Expansion_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to Expansion_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Expansion_radiobutton


% --- Executes on button press in Shrinking_radiobutton.
function Shrinking_radiobutton_Callback(hObject, eventdata, handles)
% hObject    handle to Shrinking_radiobutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Shrinking_radiobutton



function EAlpha_val_Callback(hObject, eventdata, handles)
% hObject    handle to EAlpha_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EAlpha_val as text
%        str2double(get(hObject,'String')) returns contents of EAlpha_val as a double


% --- Executes during object creation, after setting all properties.
function EAlpha_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EAlpha_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EBeta_val_Callback(hObject, eventdata, handles)
% hObject    handle to EBeta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EBeta_val as text
%        str2double(get(hObject,'String')) returns contents of EBeta_val as a double


% --- Executes during object creation, after setting all properties.
function EBeta_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EBeta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EDelta_val_Callback(hObject, eventdata, handles)
% hObject    handle to EDelta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EDelta_val as text
%        str2double(get(hObject,'String')) returns contents of EDelta_val as a double


% --- Executes during object creation, after setting all properties.
function EDelta_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EDelta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EKappa_val_Callback(hObject, eventdata, handles)
% hObject    handle to EKappa_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EKappa_val as text
%        str2double(get(hObject,'String')) returns contents of EKappa_val as a double


% --- Executes during object creation, after setting all properties.
function EKappa_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EKappa_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SAlpha_val_Callback(hObject, eventdata, handles)
% hObject    handle to SAlpha_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SAlpha_val as text
%        str2double(get(hObject,'String')) returns contents of SAlpha_val as a double


% --- Executes during object creation, after setting all properties.
function SAlpha_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SAlpha_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SBeta_val_Callback(hObject, eventdata, handles)
% hObject    handle to SBeta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SBeta_val as text
%        str2double(get(hObject,'String')) returns contents of SBeta_val as a double


% --- Executes during object creation, after setting all properties.
function SBeta_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SBeta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SDelta_val_Callback(hObject, eventdata, handles)
% hObject    handle to SDelta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SDelta_val as text
%        str2double(get(hObject,'String')) returns contents of SDelta_val as a double


% --- Executes during object creation, after setting all properties.
function SDelta_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SDelta_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SKappa_val_Callback(hObject, eventdata, handles)
% hObject    handle to SKappa_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SKappa_val as text
%        str2double(get(hObject,'String')) returns contents of SKappa_val as a double


% --- Executes during object creation, after setting all properties.
function SKappa_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SKappa_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SSigma2_val_Callback(hObject, eventdata, handles)
% hObject    handle to SSigma2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SSigma2_val as text
%        str2double(get(hObject,'String')) returns contents of SSigma2_val as a double


% --- Executes during object creation, after setting all properties.
function SSigma2_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SSigma2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SSigma1_val_Callback(hObject, eventdata, handles)
% hObject    handle to SSigma1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SSigma1_val as text
%        str2double(get(hObject,'String')) returns contents of SSigma1_val as a double


% --- Executes during object creation, after setting all properties.
function SSigma1_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SSigma1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SWterm_val_Callback(hObject, eventdata, handles)
% hObject    handle to SWterm_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SWterm_val as text
%        str2double(get(hObject,'String')) returns contents of SWterm_val as a double


% --- Executes during object creation, after setting all properties.
function SWterm_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SWterm_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SWline_val_Callback(hObject, eventdata, handles)
% hObject    handle to SWline_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SWline_val as text
%        str2double(get(hObject,'String')) returns contents of SWline_val as a double


% --- Executes during object creation, after setting all properties.
function SWline_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SWline_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ESigma2_val_Callback(hObject, eventdata, handles)
% hObject    handle to ESigma2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ESigma2_val as text
%        str2double(get(hObject,'String')) returns contents of ESigma2_val as a double


% --- Executes during object creation, after setting all properties.
function ESigma2_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ESigma2_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ESigma1_val_Callback(hObject, eventdata, handles)
% hObject    handle to ESigma1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ESigma1_val as text
%        str2double(get(hObject,'String')) returns contents of ESigma1_val as a double


% --- Executes during object creation, after setting all properties.
function ESigma1_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ESigma1_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EWterm_val_Callback(hObject, eventdata, handles)
% hObject    handle to EWterm_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EWterm_val as text
%        str2double(get(hObject,'String')) returns contents of EWterm_val as a double


% --- Executes during object creation, after setting all properties.
function EWterm_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EWterm_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EWline_val_Callback(hObject, eventdata, handles)
% hObject    handle to EWline_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EWline_val as text
%        str2double(get(hObject,'String')) returns contents of EWline_val as a double


% --- Executes during object creation, after setting all properties.
function EWline_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EWline_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EWedge_val_Callback(hObject, eventdata, handles)
% hObject    handle to EWedge_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EWedge_val as text
%        str2double(get(hObject,'String')) returns contents of EWedge_val as a double


% --- Executes during object creation, after setting all properties.
function EWedge_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EWedge_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes when selected object is changed in pnlsnaketype.
function pnlsnaketype_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in pnlsnaketype 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% switch get(get(handles.pnlsnaketype,'SelectedObject'),'Tag')
%     case 'Shrinking_radiobutton'
%         disp('shrinking button')
%         snake_status = 0;
%     case 'Expansion_radiobutton'
%         disp('expansion button')
% 
% end

% restore ? %
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2
handles = guidata(hObject);

handles.myImage = im2;
 
imshow(im2)

guidata(hObject,handles);



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)

% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global im
% global segmentation_type 
% global segmented_image
% global Oshr

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
    Options.Iterations = 300;
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
            [Oshr,Jshr] = snakes_forGUI(im,true,handles.position,Options);
            
            if ndims(im)>2
                im = squeeze(im(:,:,1));
            end
            % fix that! error when segmented high res heart image
            % should check first the type of image and then multiply
            % accordingly..
            class(Jshr)
            class(im)
            
            segmented_im = Jshr.*im;
            segmented_image = segmented_im;
            axes(handles.axes1) 
            imshow(segmented_image,[])
            save('seg_curve.mat','Oshr');
            save('original_image.mat','im');
            
        case 'Expansion'        
            disp('Expansion Snake')
            [Oexp,Jexp] = snakes_forGUI(im,true,handles.position,Options);
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

    h = msgbox('Operation Completed');

elseif strcmp(segmentation_type,'chanvese')
    im = mat2gray(im);
%     disp('image size'); size(im)
    chan_mask = get(handles.chanvese_mask_val,'String');
%     pnlchanvese
    chan_iter = str2num(get(handles.chanvese_iterations_val,'String'));
    chan_mu = str2num(get(handles.chanvese_mu_val,'String'));
    chan_method = get(handles.chanvese_method_val,'String');
    
    usermask = handles.position;  % under construction (?)
    seg = chenvese(im,chan_mask,chan_iter,chan_mu,chan_method,usermask);
    disp('performing segmentation using Chan and Vese algorithm')
end

%check this %
% handles.myImage = segmented_image;
handles.myCurve = Oshr;
guidata(hObject, handles);




% --- Executes on button press in drawmask.
function drawmask_Callback(hObject, eventdata, handles)
% hObject    handle to drawmask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% surf(handles.current_data);
% function UserDefineMaskButton_Callback(hObject, eventdata, handles)
% % hObject    handle to UserDefineMaskButton (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global im

handles=guidata(hObject);
im = handles.myImage;
fig_handle=figure;
imshow(im,[],'InitialMagnification',600);

hFreeHandVec=text(5,4,{'Use mouse to draw ROI and double click to finish'},...
   'FontSize',12,'Color','b');
axis equal;axis off;

% maskSum=false(size(im,1),size(im,2));

markROIdlg='Not yet';
hFreeHandVec=[];
while ~strcmpi(markROIdlg,'Done')
   hFreeHand = imfreehand;
   wait(hFreeHand); % Wait till double click
   hFreeHandVec=[hFreeHandVec,hFreeHand];
   
%    maskFreeHand = createMask(hFreeHand);
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


% --- Executes during object creation, after setting all properties.
function pnlsnaketype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnlsnaketype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% set(handles.pnlsnaketype,'



function SWedge_val_Callback(hObject, eventdata, handles)
% hObject    handle to SWedge_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SWedge_val as text
%        str2double(get(hObject,'String')) returns contents of SWedge_val as a double



function iterat_num_val_Callback(hObject, eventdata, handles)
% hObject    handle to iterat_num_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterat_num_val as text
%        str2double(get(hObject,'String')) returns contents of iterat_num_val as a double


% --- Executes during object creation, after setting all properties.
function iterat_num_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterat_num_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gvf_iterat_val_Callback(hObject, eventdata, handles)
% hObject    handle to gvf_iterat_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gvf_iterat_val as text
%        str2double(get(hObject,'String')) returns contents of gvf_iterat_val as a double


% --- Executes during object creation, after setting all properties.
function gvf_iterat_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gvf_iterat_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigma3_val_Callback(hObject, eventdata, handles)
% hObject    handle to sigma3_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma3_val as text
%        str2double(get(hObject,'String')) returns contents of sigma3_val as a double


% --- Executes during object creation, after setting all properties.
function sigma3_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma3_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mu_val_Callback(hObject, eventdata, handles)
% hObject    handle to mu_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mu_val as text
%        str2double(get(hObject,'String')) returns contents of mu_val as a double


% --- Executes during object creation, after setting all properties.
function mu_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mu_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nPoints_val_Callback(hObject, eventdata, handles)
% hObject    handle to nPoints_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nPoints_val as text
%        str2double(get(hObject,'String')) returns contents of nPoints_val as a double


% --- Executes during object creation, after setting all properties.
function nPoints_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nPoints_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit54_Callback(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit54 as text
%        str2double(get(hObject,'String')) returns contents of edit54 as a double


% --- Executes during object creation, after setting all properties.
function edit54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit55_Callback(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit55 as text
%        str2double(get(hObject,'String')) returns contents of edit55 as a double


% --- Executes during object creation, after setting all properties.
function edit55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit56_Callback(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit56 as text
%        str2double(get(hObject,'String')) returns contents of edit56 as a double


% --- Executes during object creation, after setting all properties.
function edit56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit58_Callback(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit58 as text
%        str2double(get(hObject,'String')) returns contents of edit58 as a double


% --- Executes during object creation, after setting all properties.
function edit58_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit59_Callback(hObject, eventdata, handles)
% hObject    handle to edit59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit59 as text
%        str2double(get(hObject,'String')) returns contents of edit59 as a double


% --- Executes during object creation, after setting all properties.
function edit59_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit60_Callback(hObject, eventdata, handles)
% hObject    handle to edit60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit60 as text
%        str2double(get(hObject,'String')) returns contents of edit60 as a double


% --- Executes during object creation, after setting all properties.
function edit60_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function chanvese_tool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to chanvese_tool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
set(handles.pnlsnaketype, 'Visible', 'off');
set(handles.gvf_opt, 'Visible', 'off');
set(handles.additionalopt, 'Visible', 'off');
set(handles.pnlchanvese, 'Visible', 'on');
disp('clicked the chanvese')



handles.segmentation_type = 'chanvese';
guidata(hObject, handles);


% global segmentation_type 
% segmentation_type = 'chanvese';



function edit83_Callback(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit83 as text
%        str2double(get(hObject,'String')) returns contents of edit83 as a double


% --- Executes during object creation, after setting all properties.
function edit83_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit84_Callback(hObject, eventdata, handles)
% hObject    handle to edit84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit84 as text
%        str2double(get(hObject,'String')) returns contents of edit84 as a double


% --- Executes during object creation, after setting all properties.
function edit84_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit85_Callback(hObject, eventdata, handles)
% hObject    handle to edit85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit85 as text
%        str2double(get(hObject,'String')) returns contents of edit85 as a double


% --- Executes during object creation, after setting all properties.
function edit85_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit86_Callback(hObject, eventdata, handles)
% hObject    handle to edit86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit86 as text
%        str2double(get(hObject,'String')) returns contents of edit86 as a double


% --- Executes during object creation, after setting all properties.
function edit86_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit87_Callback(hObject, eventdata, handles)
% hObject    handle to edit87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit87 as text
%        str2double(get(hObject,'String')) returns contents of edit87 as a double


% --- Executes during object creation, after setting all properties.
function edit87_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit79_Callback(hObject, eventdata, handles)
% hObject    handle to edit79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit79 as text
%        str2double(get(hObject,'String')) returns contents of edit79 as a double


% --- Executes during object creation, after setting all properties.
function edit79_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit80_Callback(hObject, eventdata, handles)
% hObject    handle to edit80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit80 as text
%        str2double(get(hObject,'String')) returns contents of edit80 as a double


% --- Executes during object creation, after setting all properties.
function edit80_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit81_Callback(hObject, eventdata, handles)
% hObject    handle to edit81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit81 as text
%        str2double(get(hObject,'String')) returns contents of edit81 as a double


% --- Executes during object creation, after setting all properties.
function edit81_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit82_Callback(hObject, eventdata, handles)
% hObject    handle to edit82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit82 as text
%        str2double(get(hObject,'String')) returns contents of edit82 as a double


% --- Executes during object creation, after setting all properties.
function edit82_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
% hObject    handle to snakes_tool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function snakes_tool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to snakes_tool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles = guidata(hObject);

set(handles.pnlsnaketype, 'Visible', 'on');
set(handles.gvf_opt, 'Visible', 'on');
set(handles.additionalopt, 'Visible', 'on');
set(handles.pnlchanvese, 'Visible', 'off');


handles.segmentation_type = 'snakes';
guidata(hObject, handles);



function chanvese_iterations_val_Callback(hObject, eventdata, handles)
% hObject    handle to chanvese_iterations_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chanvese_iterations_val as text
%        str2double(get(hObject,'String')) returns contents of chanvese_iterations_val as a double


% --- Executes during object creation, after setting all properties.
function chanvese_iterations_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chanvese_iterations_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chanvese_method_val_Callback(hObject, eventdata, handles)
% hObject    handle to chanvese_method_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chanvese_method_val as text
%        str2double(get(hObject,'String')) returns contents of chanvese_method_val as a double


% --- Executes during object creation, after setting all properties.
function chanvese_method_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chanvese_method_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chanvese_mu_val_Callback(hObject, eventdata, handles)
% hObject    handle to chanvese_mu_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chanvese_mu_val as text
%        str2double(get(hObject,'String')) returns contents of chanvese_mu_val as a double


% --- Executes during object creation, after setting all properties.
function chanvese_mu_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chanvese_mu_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function chanvese_mask_val_Callback(hObject, eventdata, handles)
% hObject    handle to chanvese_mask_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of chanvese_mask_val as text
%        str2double(get(hObject,'String')) returns contents of chanvese_mask_val as a double


% --- Executes during object creation, after setting all properties.
function chanvese_mask_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chanvese_mask_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_segmented.
function save_segmented_Callback(hObject, eventdata, handles)
global no_slice
handles = guidata(hObject);

% global segmented_image no_slice
% mysegment = segmented_image;

% axes(handles.axes1)
% newsegment = getframe();
% mynewseg = newsegment.cdata
% fix this 
mynewseg = handles.mySegmentedImage;
% % %for some reason it is x by y by 3 (fix that!)
% % % mynewseg = mynewseg(:,:,1);

% figure;
% imshow(mynewseg);
% pause;

 try
    prompt = {'Enter name for .mat file'};
    dlg_title = 'Input';
    num_lines = 1;
    
    segmname = sprintf('my_segment_%d',no_slice);
    defaultans = {segmname};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    name = answer{1};
    fname=sprintf('%s.mat',name)
    save(fname,'mynewseg');
%     save('my_segmented_image.mat','segmenttosave')
    
 
 catch
    msgbox('Error while saving the segmented image')
   warning('Make sure the segmentation process is complete');
   volume = 0;
end


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % for i = 7:52
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %     try
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %         segmname = sprintf('my_segment_%d',i);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %         fname=sprintf('%s.mat',segmname);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %         load(fname);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %         segmented_volume(:,:,i) = mynewseg;
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %     catch
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %         disp('no change for : ')
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %         i
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %     end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % end



function slice_no_value_Callback(hObject, eventdata, handles)

% hObject    handle to slice_no_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of slice_no_value as text
%        str2double(get(hObject,'String')) returns contents of slice_no_value as a double
global gvolume no_slice
% global im
global im2
handles = guidata(hObject);

disp('slice no ' ) ;
no_slice = str2num(get(handles.slice_no_value,'String'))


im = squeeze(gvolume(:,:,no_slice));
handles.myImage = im;

im2 = im; %we will use it for restore
imshow(im,[])
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function slice_no_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slice_no_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  im2
handles = guidata(hObject);

imshow(im2,[])
im = im2;
handles.myImage = im;
disp('restore image');
guidata(hObject, handles);


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global im
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


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global Oshr 
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

    handles.mySegmentedImage = handles.myImage;
    if (size(inCurve,2)>80)
        new_curve = my_bspline(4,inCurve,orim,hObject,handles);
        handles.myCurve = new_curve;
        guidata(hObject,handles);

    else
        new_curve = edit_new_bspline(4,inCurve,orim,handles.axes1);
        handles.myCurve = new_curve;
    end

%     handles.myImage = new_segmented_image;
    
    guidata(hObject, handles);
% end    


% --- Executes on button press in load_curve_button.
function load_curve_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_curve_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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
    warning('Image Loading - Canceled');
 end
    guidata(hObject, handles);


%       Saving the Curve
% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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

    
