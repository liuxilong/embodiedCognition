function formal_exp(subinfo)
%formal_exp.m
clear results;
global results practice3 practice4 practice5 lengthof147 time_interval;
if isempty(subinfo)
    return;
end
Screen('Preference', 'SkipSyncTests', 1);
KbName('UnifyKeynames');
time_interval=0.8;  
[~, ~, b]=xlsread('order.xlsx');
try
    ScreenNum=max(Screen('Screens'));
    wptr=Screen('OpenWindow',ScreenNum,[192 192 192]);
    [ws,~]=Screen('WindowSize',wptr);
    [width,~]=Screen('DisplaySize',ScreenNum);
    lengthof147=ws/width*100*10/6.4;
    Screen('TextSize',wptr,28);
    Screen('TextFont',wptr,'����');
    Screen('Flip',wptr);
    WaitSecs(0.5);
    ListenChar(2);
    instruction=imread('1.jpg');
    practice3=imread('3.jpg');
    practice4=imread('4.jpg');
    practice5=imread('5.jpg');
    putimage(wptr,instruction,'ȷ����ʼ��ϰ��');
    Screen('Flip',wptr);
    WaitSecs(0.5);
    practice2=imread('2.jpg');
    preparing(wptr,practice2);
    %��һ����ϰ
    Copy_of_show_idiom_practice(wptr,{'���ض���','������Ц'});
    Screen('Flip',wptr);
    WaitSecs(0.5);
    %��������ʽʵ��Ķ���һ
    justSaySomething(wptr,'���濪ʼ��ʽʵ�飬\n\n������׼���������ո����ʼ',1);
    Screen('Flip',wptr);
    WaitSecs(0.5);
    idiom_id=b{(str2double(subinfo{1})-1)*6+1+1,8};
    trial_pic=imread([idiom_id '.jpg']);
    preparing(wptr,trial_pic);
    for i=1:3
        collecting_info(i,subinfo,b);
    end
        Copy_of_show_idiom_trial(wptr,{results(1,1).idiom,results(2,1).idiom,results(3,1).idiom},i);
        Screen('Flip',wptr);
   
    %��ʽʵ��ڶ�������
    idiom_id=b{(str2double(subinfo{1})-1)*6+4+1,8};
    trial_pic=imread([idiom_id '.jpg']);
    WaitSecs(1.5);
    preparing(wptr,trial_pic);
    for i=4:6
        collecting_info(i,subinfo,b);
    end
        WaitSecs(time_interval);
        Copy_of_show_idiom_trial(wptr,{results(4,1).idiom,results(5,1).idiom,results(6,1).idiom},i);
        Screen('Flip',wptr);
    for i=1:6
        results(i,1).length=lengthof147;
        results(i,1).subname=subinfo{4};
    end
    lastjudge(wptr);
    justSaySomething(wptr,double('���ڴ������ݣ����Ժ�'),0);
    %�ϲ����
    if isfield(results,'SubSex')
        results=rmfield(results,'SubSex');
    elseif isfield(results,'SubAge')   
        results=rmfield(results,'SubAge');
    end
    name=['results' subinfo{1}];
    save(name,'results');
    columnheader={'subname','id','sex','age','group','group_block','order',...
        'trialno','actionid','action','idiom_id','idiom','idiom_val',...
        'idiom_jud','rt','correct','value','length','action_value','sub_value'};
    results=orderfields(results,columnheader);
    ret=[columnheader;struct2cell(results)'];
    xlswrite([ subinfo{1} '_Sub_SRTP_experiment.xls'],ret);
    DrawFormattedText(wptr,double('ʵ�������ʮ�ָ�л���Ĳ��룡\n\n�밴������˳�'),'center','center',0);
    Screen('Flip',wptr);
    ListenChar(0);
    KbWait;
    sca;
catch%#ok<CTCH>
    psychrethrow(psychlasterror);
    ListenChar(0);
    %KbWait;
    sca;
end
return;
