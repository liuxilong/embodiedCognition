function preparing(wptr,image)
%preparing.m
global practice3 ;
[ws,hs]=Screen('WindowSize',wptr);
text_rect=Screen('TextBounds',wptr,'如果您准备好了，\n\n请按任意键开始倒计时');
y_text= hs-2*text_rect(4)-70;
Screen('Putimage',wptr,image,[0,0,ws,hs]);
DrawFormattedText(wptr,double('如果您准备好了，\n\n请按任意键开始倒计时\n\n请重复做此动作'),'center',y_text);
Screen('Flip',wptr);
KbWait;
WaitSecs(0.5);
i=0;
while i<=20
    WaitSecs(1);
    txt=['倒计时'  num2str(20-i) 's\n\n请重复做此动作'];
    text_rect=Screen('TextBounds',wptr,txt);
    y_text=hs-text_rect(4)-70;
    Screen('Putimage',wptr,image,[0,0,ws,hs]);
    DrawFormattedText(wptr,double(txt),'center',y_text);
    Screen('Flip',wptr);
    i=i+1;
end
beep;%听到声音便可停止
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