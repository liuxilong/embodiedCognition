function preparing(wptr,image)
%preparing.m
global practice3 ;
[ws,hs]=Screen('WindowSize',wptr);
text_rect=Screen('TextBounds',wptr,'�����׼�����ˣ�\n\n�밴�������ʼ����ʱ');
y_text= hs-2*text_rect(4)-70;
Screen('Putimage',wptr,image,[0,0,ws,hs]);
DrawFormattedText(wptr,double('�����׼�����ˣ�\n\n�밴�������ʼ����ʱ\n\n���ظ����˶���'),'center',y_text);
Screen('Flip',wptr);
KbWait;
WaitSecs(0.5);
i=0;
while i<=20
    WaitSecs(1);
    txt=['����ʱ'  num2str(20-i) 's\n\n���ظ����˶���'];
    text_rect=Screen('TextBounds',wptr,txt);
    y_text=hs-text_rect(4)-70;
    Screen('Putimage',wptr,image,[0,0,ws,hs]);
    DrawFormattedText(wptr,double(txt),'center',y_text);
    Screen('Flip',wptr);
    i=i+1;
end
beep;%�����������ֹͣ
Screen('PutImage',wptr,practice3,[0,0,ws,hs]);
Screen('Flip',wptr);
while 1
    [~,~,kc]=KbCheck;
    if kc(KbName('space'))
        Screen('Flip',wptr);
        break;
    end
end
%WaitSecs(time_interval);