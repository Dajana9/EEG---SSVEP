function varargout = CCA_TRANSFORMACIJA(varargin)
% CCA_TRANSFORMACIJA MATLAB code for CCA_TRANSFORMACIJA.fig
%      CCA_TRANSFORMACIJA, by itself, creates a new CCA_TRANSFORMACIJA or raises the existing
%      singleton*.
%
%      H = CCA_TRANSFORMACIJA returns the handle to a new CCA_TRANSFORMACIJA or the handle to
%      the existing singleton*.
%
%      CCA_TRANSFORMACIJA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CCA_TRANSFORMACIJA.M with the given input arguments.
%
%      CCA_TRANSFORMACIJA('Property','Value',...) creates a new CCA_TRANSFORMACIJA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CCA_TRANSFORMACIJA_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CCA_TRANSFORMACIJA_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CCA_TRANSFORMACIJA

% Last Modified by GUIDE v2.5 03-Mar-2015 22:10:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CCA_TRANSFORMACIJA_OpeningFcn, ...
                   'gui_OutputFcn',  @CCA_TRANSFORMACIJA_OutputFcn, ...
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


% --- Executes just before CCA_TRANSFORMACIJA is made visible.
function CCA_TRANSFORMACIJA_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CCA_TRANSFORMACIJA (see VARARGIN)

% Choose default command line output for CCA_TRANSFORMACIJA
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CCA_TRANSFORMACIJA wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CCA_TRANSFORMACIJA_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LoadData.
function LoadData_Callback(hObject, eventdata, handles)
% hObject    handle to LoadData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fileName=uigetfile('*.xlsx')
handles.fileName=fileName
guidata(hObject,handles)
setPopupmenuString(handles.elektroda1,eventdata,handles)
setPopupmenuString(handles.elektroda2,eventdata,handles)
set(handles.elektroda1,'callback','CCA_TRANSFORMACIJA(''updateAxes'',gcbo,[],guidata(gcbo))')
set(handles.elektroda2,'callback','CCA_TRANSFORMACIJA(''updateAxes'',gcbo,[],guidata(gcbo))')




% --- Executes on selection change in elektroda1.
function elektroda1_Callback(hObject, eventdata, handles)
% hObject    handle to elektroda1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns elektroda1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from elektroda1


% --- Executes during object creation, after setting all properties.
function elektroda1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elektroda1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in elektroda2.
function elektroda2_Callback(hObject, eventdata, handles)
% hObject    handle to elektroda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns elektroda2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from elektroda2


% --- Executes during object creation, after setting all properties.
function elektroda2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to elektroda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function setPopupmenuString(hObject,eventdata,handles)
fileName=handles.fileName;
[numbers,colNames] = xlsread(fileName);
set(hObject,'string',colNames);

function [x, y]=readExcelColumns(fileName,xColNum,yColNum)

a=xlsread(fileName);

x=a(:,xColNum);
y=a(:,yColNum);


function updateAxes(hObject,eventdata,handles)
pozicija=[216 170;252 169;195 189;235 189;273 190;130 209;173 212;216 213;253 212;297 212;341 211;150 232;193 232;234 232;276 232;320 230;129 257;172 254;213 254;255 254;296 254;340 257;136 369;235 358;333 367;210 343;257 342;182 390;234 400;286 391;203 418;267 419]
xColNum=get(handles.elektroda1,'value');
yColNum=get(handles.elektroda2,'value');
fileName=handles.fileName;
[x, y]=readExcelColumns(fileName,xColNum,yColNum);
RGB=imread('kapa_elektroda.jpg');
imshow('kapa_elektroda.jpg', 'Parent', handles.axes1);%slika elektroda na glavi
Fs=128;  %1sekunda          % [Hz]
fftwindow=2*Fs;             % data length [samples]
fftshift=round(0.5*Fs);
eventFreq=[4.5:0.5:20.5];
prvi_podatak = x;
drugi_podatak = y;
rezultat = prvi_podatak-drugi_podatak;
broj_frekv=length(eventFreq);
% get startingpoints of fft frame analysis
startpoints=1:fftshift:size(prvi_podatak,1)-fftwindow;
% reshape data and filter
dataframed=zeros(fftwindow,1,length(startpoints));
if prvi_podatak ~= drugi_podatak
for n=1:3
    if n==1
        rezultat = prvi_podatak;
    else if n==2
            rezultat = drugi_podatak;
        else
            rezultat = prvi_podatak-drugi_podatak;
        end
    end
    for n2=1:length(startpoints)
        
        dataframed(:,:,n2)=rezultat(startpoints(n2)+(0:fftwindow-1),:);
        
    end
    
    % get time vector
    t=(0:1/Fs:fftwindow/Fs-1/Fs)';
    
    % compute cca
    maxcca=zeros(length(startpoints),length(eventFreq));
    
    for n_f = 1:length(eventFreq)   % poigrat se da bude korak 0.01 kako si radila
        %compute sine and cosine of reference frequencies
        ref_sin=sin(t*eventFreq(n_f)*2*pi);
        ref_cos=cos(t*eventFreq(n_f)*2*pi);
        %get reference signal SinCos
        SinCosRef=[ref_sin ref_cos];
        
        for n2=1:length(startpoints)
            % copy EEG data to variable
            EEGcomplete=dataframed(:,:,n2);
            
            %X=EEGcomplete   Y=SinCosRef
            % number of channels for EEG and Reference(=2!)
            Mx=size(EEGcomplete,2);
            My=size(SinCosRef,2);
            
            %compute covariance matrices [Bortz]
            R=corr([EEGcomplete SinCosRef]);
            Rxx=R(1:Mx,1:Mx);
            Rxy=R(1:Mx,Mx+1:end);
            Ryx=R(Mx+1:end,1:Mx);
            Ryy=R(Mx+1:end,Mx+1:end);
            
            %compute left side of eigenvalue equation for x  and y [Borga(4)]
            % EVEx=(Rxx\Rxy)*(Ryy\Ryx);   % not necessary, can be removed
            EVEy=(Ryy\Ryx)*(Rxx\Rxy);
            
            %find solution of eigenvalue problem ()
            % [Vx,Dx] = eig(EVEx);        % not necessary, can be removed
            [Vy,Dy] = eig(EVEy);
            
            % get canonical correlation values
            maxcca(n2,n_f)=max(sqrt(abs(diag(Dy))));
            
        end
        
    end
    
    elek2=mean(maxcca);
    if n==1
        plot(handles.axes2,eventFreq,elek2)
        grid(handles.axes2, 'on')
    else if n==2
            plot(handles.axes3,eventFreq,elek2)
            grid(handles.axes3, 'on')
        else
            plot(handles.axes4,eventFreq,elek2)
            grid(handles.axes4, 'on')
        end
        
    end
    RGB = insertShape(RGB, 'FilledCircle',[ pozicija(xColNum,:) 10], 'Color', 'red', 'Opacity', 1);
    RGB = insertShape(RGB, 'FilledCircle',[ pozicija(yColNum,:) 10], 'Color', 'blue', 'Opacity', 1);
    imshow(RGB,'Parent', handles.axes1);
end
end
