function varargout = my_gui(varargin)
% MY_GUI MATLAB code for my_gui.fig
%      MY_GUI, by itself, creates a new MY_GUI or raises the existing
%      singleton*.
%
%      H = MY_GUI returns the handle to a new MY_GUI or the handle to
%      the existing singleton*.
%
%      MY_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_GUI.M with the given input arguments.
%
%      MY_GUI('Property','Value',...) creates a new MY_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before my_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to my_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help my_gui

% Last Modified by GUIDE v2.5 19-Jul-2017 14:58:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @my_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @my_gui_OutputFcn, ...
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


% --- Executes just before my_gui is made visible.
function my_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to my_gui (see VARARGIN)
clc

% Choose default command line output for my_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% Use the correct names, for the objects, of course...
set(handles.pnlsnaketype, 'selectedobject', handles.Shrinking_radiobutton)
set(handles.gvf_opt, 'selectedobject', handles.GVF_off)

% UIWAIT makes my_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = my_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




% --- Executes during object creation, after setting all properties.
function SWedge_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SWedge_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pushbutton9.
function load_volume_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pushbutton9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pushbutton9


% --- Executes during object creation, after setting all properties.
function pushbutton9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in pushbutton8.
function load_image_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pushbutton8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pushbutton8


% --- Executes during object creation, after setting all properties.
function pushbutton8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Wline_value_Callback(hObject, eventdata, handles)
% hObject    handle to Wline_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wline_value as text
%        str2double(get(hObject,'String')) returns contents of Wline_value as a double


% --- Executes during object creation, after setting all properties.
function Wline_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wline_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function type_of_file_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to type_of_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2
display('Loading image..');
%         global im im2
        %[path, user_canceled] = imgetfile();
        [FileName,PathName] = uigetfile('*.*','Select the MATLAB code file')
        [pathstr,name,ext] = fileparts(FileName)
%         if user_canceled
%             msgbox(sprintf('Error'),'Error','Error');
%             return
%         end
%         im = imread(path);
%         im = im2double(im); %converts to double
%         im2 = im; %we will use it for restore
%         imshow(im) 
        try
            if strcmp(ext,'.mat')   
                
                Load = load(FileName);
                im = getfield(Load,char(fieldnames(Load)));
                im2 = im;
                imshow(im) 
            else
                im = mat2gray(imread(FileName));
                im = im2double(im); %converts to double
                im2 = im; %we will use it for restore
                imshow(im) 
            end
            
        catch
            msgbox('Wrong type of file')
           warning('Problem using function.  Assigning a value of 0.');
           volume = 0;
        end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2
display('Loading Volume..');
%         global im im2
        %use this to load the image from a volume
        [FileName,PathName] = uigetfile('*.*','Select the MATLAB code file');
        [pathstr,name,ext] = fileparts(FileName)
         %% dat to matrix for visualization and processing 
         
%          try
%             fid = fopen(FileName,'r');
% 
%             A = fread(fid,'single');
%             A = reshape(A,54,89,80);
%             % mat2gray seems to work similarly to hist. eq.
%             volume = mat2gray(A);
%             volumesize = size(volume);
%             semgneted_volume = zeros(volumesize(1),volumesize(2),volumesize(3));
%            
%         catch ME
%             msg = ME.message            
%          end   
%         try
%             fid = fopen(FileName,'r');
%             A = fread(fid,'single');
%             A = reshape(A,54,89,80);
%             volume = uint8(255 * mat2gray(A));
%             prompt = {'Enter number of slice:'};
%             dlg_title = 'Slice';
%             num_lines = 1;
%             defaultans = {'0'};
%             slicestr = inputdlg(prompt,dlg_title,num_lines,defaultans);
%             slicenum = str2num(slicestr{:})
% 
% 
%             im = squeeze(volume(:,:,slicenum));
%             im2 = im; %we will use it for restore
% 
%     %          handles.ImageData = double(im);
%     %         axes(handles.axes1);
%             imshow(im)
%             correct_type = true;
%         catch
%            msgbox('Wrong type of file')
%            warning('Problem using function.  Assigning a value of 0.');
%            volume = 0;
%         end
        
        try
            if strcmp(ext,'.dat')

    %             load(FileName);
                fid = fopen(fullfile(PathName,FileName),'r');

                A = fread(fid,'single');
                A = reshape(A,54,89,80);
                % mat2gray seems to work similarly to hist. eq.
                % original_volume = uint8(255 * mat2gray(A));  %%%%
                original_volume = mat2gray(A);  

                prompt = {'Enter number of slice:'};
                dlg_title = 'Slice';
                num_lines = 1;
                defaultans = {'0'};
                slicestr = inputdlg(prompt,dlg_title,num_lines,defaultans);
                slicenum = str2num(slicestr{:});

                im = squeeze(original_volume(:,:,slicenum));
                im2 = im; %we will use it for restore
                imshow(im,[])
                              
             elseif strcmp(ext,'.mat')   
                prompt = {'Enter number of slice:'};
                dlg_title = 'Slice';
                num_lines = 1;
                defaultans = {'0'};
                slicestr = inputdlg(prompt,dlg_title,num_lines,defaultans);
                slicenum = str2num(slicestr{:});
                
                Load = load(FileName);
                my_image = getfield(Load,char(fieldnames(Load)));
               
                im = squeeze(my_image(:,:,slicenum));
                im2 = im; %we will use it for restore
                imshow(im,[])
               
            elseif strcmp(ext,'.tif')
                
                prompt = {'Enter number of slice:'};
                dlg_title = 'Slice';
                num_lines = 1;
                defaultans = {'0'};
                slicestr = inputdlg(prompt,dlg_title,num_lines,defaultans);
                slicenum = str2num(slicestr{:});
                
                [im] = mat2gray(imread(FileName,slicenum));
                imshow(im,[])

            
            elseif strcmp(ext,'.nrrd')
                prompt = {'Enter number of slice:'};
                dlg_title = 'Slice';
                num_lines = 1;
                defaultans = {'0'};
                slicestr = inputdlg(prompt,dlg_title,num_lines,defaultans);
                slicenum = str2num(slicestr{:});
     
                my_image = nrrdread(FileName);
                my_image = mat2gray(my_image);
        
                im = squeeze(my_image(:,:,slicenum));
                im2 = im; %we will use it for restore
                imshow(im,[])
            end
            
        catch
            msgbox('Wrong type of file')
           warning('Problem using function.  Assigning a value of 0.');
           volume = 0;
        end
        
       
% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%convert into grayscale image using r=g=b=(r+g+b)/3
global im
try
    imgray = (im(:,:,1)+im(:,:,2)+im(:,:,3))/3;
    imshow(imgray,[]); 
    im = imgray;
catch ME
    msg = ME.message
    msgbox('Works only for RGB images')
end

% --- Executes on slider movement.
function threshold_slider_Callback(hObject, eventdata, handles)
% hObject    handle to threshold_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global im
thres_val = get(hObject,'Value');
assignin('base','thres_val',thres_val);
set(handles.thres_txt,'String',num2str(thres_val,3));

imthres = im>thres_val;
imshow(imthres)


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


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im2
imshow(im2)



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)

% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
typeofsnakeObj = get(handles.pnlsnaketype,'SelectedObject');
choice = get(typeofsnakeObj,'String');

%check if GVF option is enabled
GVF_optObj = get(handles.gvf_opt,'SelectedObject');
GVF_choice = get(GVF_optObj,'String');

Options=struct;
Options.Iterations = 300;
Options.Iterations = str2double(get(handles.iterat_num_val,'String'));
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
    
    [Oshr,Jshr] = shrinking_snakes_forGUI(im,true,handles.position,Options);
    size(Jshr)
    size(im)
    if ndims(im)>2
        im = squeeze(im(:,:,1));
    end
    segmented_image = uint8(Jshr).*uint8(im);
%     figure
%     imshow(segmented_image,[]);
%     figure
%     imshow(Jshr,[]);
else
    msgbox('Please first define the ROI')
end

h = msgbox('Operation Completed');

% % % %     % % %  Options.Sigma1 : Sigma used to calculate image derivatives, default 10
% % % %     Options.Sigma1=2;
% % % %     % % %  Options.Wline : Attraction to lines, if negative to black lines otherwise white lines , default 0.04
% % % %     Options.Wline=0.9; %1.9
% % % %     %PREVIOUSLY 0.05
% % % %     % % %  Options.Wedge : Attraction to edges, default 2.0
% % % %     Options.Wedge=20.5; %10.5
% % % %     %PREVIOUSLY 3
% % % %     % % %  Options.Wterm : Attraction to terminations of lines (end points) and corners, default 0.01
% % % %     Options.Wterm=3.1;
% % % %     %PREVIOUSLY 3.1
% % % %     % % %  Options.Sigma2 : Sigma used to calculate the gradient of the edge energy
% % % %     % % %                    image (which gives the image force), default 20
% % % %     Options.Sigma2=0.4; 
% % % % 
% % % %     % defaultoptions=struct('Verbose',false,'nPoints',100,'Wline',0.04,'Wedge',2,'Wterm',0.1,'Sigma1',0.8,'Sigma2',1,'Alpha',0.2,'Beta',0.2,'Delta',0.1,'Gamma',1,'Kappa',2,'Iterations',100,'GIterations',0,'Mu',0.2,'Sigma3',1);
% % % % 
% % % % 
% % % %     %%%%%%%%%%%%%%%%%%%%%%% SNAKE %%%%%%%%%%%%%%%%%%%%
% % % %     % % %  Options.Alpha : Membrame energy  (first order), default 0.2
% % % %     Options.Alpha=1.4;
% % % %     % % %  Options.Beta : Thin plate energy (second order), default 0.2
% % % %     Options.Beta=0.4;
% % % %     % % %  Options.Delta : Baloon force, default 0.1
% % % %     Options.Delta=-0.08;
% % % %     % % %  Options.Kappa : Weight of external image force, default 2
% % % %     Options.Kappa=6.0;
















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
global im

handles=guidata(hObject);
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





% global snake_status;
% wdegeStr = get(handles.SWedge_val,'String');
% wdege = str2num(wdegeStr);
% 
% if snake_status == 0;
%     disp('shrkinking')
%     test = get(handles.SAlpha_val,'String');
%     testval = str2num(test)
% end
%  %% dat to matrix for visualization and processing 
% fid = fopen('Dataset02_Nx80Ny89Nz54.dat','r');
% 
% A = fread(fid,'single');
% A = reshape(A,54,89,80);
% % mat2gray seems to work similarly to hist. eq.
% original_volume = mat2gray(A);
% % saving into dicom format for Slicer or ITK-SNAP
% % dicom_write_volume(original_volume,'Dataset02',[54,89,80])
% 
% % save('Dataset02.mat','original_volume');
% 
% volumesize = size(original_volume);
% 
% %show curve evolution - default is zero
% show_evol = false;
% segmented_volume = volume_segmentation(original_volume,show_evol);


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
