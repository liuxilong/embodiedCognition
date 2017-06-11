function varargout = experiment(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @experiment_OpeningFcn, ...
                   'gui_OutputFcn',  @experiment_OutputFcn, ...
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

function experiment_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
a=dir('*.xls');
if isempty(a);
    c='0';
else
    c=strtok(a(end).name,'_');
end
set(handles.id,'Value',str2double(c)+2);
guidata(hObject, handles);

function varargout = experiment_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function run_Callback(hObject, eventdata, handles)
index=get(handles.id,'Value');
String=get(handles.id,'String');
id=String(index);

index=get(handles.sex,'Value');
String=get(handles.sex,'String');
sex=String(index);
if index==1
    beep;
    warndlg('请选择性别！','提示','modal');
    return
end

index=get(handles.age,'Value');
String=get(handles.age,'String');
age=String(index);
if index==1
    beep;
    warndlg('请设置年龄！','提示','modal');
    return
end
name=get(handles.name,'String');
if isempty(name)
    beep;
    warndlg('请输入姓名！','提示','modal');
    return
end
subinfo={id{1},sex{1},age{1},name};
clear  index String
if exist(['results' subinfo{1} '.mat'],'file') || exist([subinfo{1} '_Sub_SRTP_experiment.xls'],'file')
        resp=questdlg({['The file ' '"results' subinfo{1} '.mat" or "' subinfo{1} ...
            '_Sub_SRTP_experiment.xls" already exists']; 'do you want to overwrite it?'},...
            'duplicate warning','Cancel','Ok','Ok');
        if ~strcmp(resp,'Ok')
            close experiment force
            clc;
            disp('Experiment aborted!')
            return
        end
end
formal_exp(subinfo);
ShowCursor;
%save subinfo
close experiment force
function id_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sex_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function age_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function name_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
