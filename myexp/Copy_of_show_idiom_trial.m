function Copy_of_show_idiom_trial(wptr,idiom,i)
% show_idiom_practice.m
global   practice5 lengthof147 results time_interval;
[ws,hs]=Screen('WindowSize',wptr);
heightof147=hs-100-40;
Screen('Flip',wptr);
HideCursor
fix=fixation(wptr,'+');
wrect=Screen('Rect',wptr);
for j=1:length(idiom)
    showFix(wptr,wrect,fix,1+rand);
    Screen('Flip',wptr);
    Screen('TextSize',wptr,40);
    DrawFormattedText(wptr,double(idiom{j}),'center','center',0);  
    Screen('Flip',wptr);
    starttime=GetSecs;
    while 1
        [~,~,kc]=KbCheck;
        if kc(KbName('F')) || kc(KbName('J'))
            results(i-2,1).rt=GetSecs-starttime;
            if kc(KbName('F'))
                results(i-2,1).idiom_jud='消极';
            elseif kc(KbName('J'))
                results(i-2,1).idiom_jud='积极';
            end
            if strcmp(results(i-2,1).idiom_jud,results(i-2,1).idiom_val)
                results(i-2,1).correct=1;
            else
                results(i-2,1).correct=0;
            end
            i=i+1;
            break; 
        end
    end
    while KbCheck; end
    Screen('Flip',wptr);
    WaitSecs(time_interval);
end
i=i-3;
ShowCursor;
for j=1:length(idiom)
    Screen('PutImage',wptr,practice5,[0,0,ws,hs]);
    Screen('TextSize',wptr,40);
    idiom_rect=Screen('TextBounds',wptr,idiom{j}); 
    y_text= hs/4-idiom_rect(4)/2;
    DrawFormattedText(wptr,double(idiom{j}),'center',y_text,0);
    Screen('TextSize',wptr,28);
    DrawFormattedText(wptr,'1',ws/2-lengthof147/2-5,heightof147,0);
    DrawFormattedText(wptr,'4',ws/2-5,heightof147,0);
    DrawFormattedText(wptr,'7',ws/2+lengthof147/2-5,heightof147,0);
    Screen('DrawLine',wptr,0,ws/2-lengthof147/2,hs-100,ws/2+lengthof147/2,hs-100,5);
    Screen('Flip',wptr);
    while 1 
        [x,y,buttons]=GetMouse(wptr); 
        if buttons(1)
            while 1
                Screen('PutImage',wptr,practice5,[0,0,ws,hs]);
                Screen('TextSize',wptr,40);
                DrawFormattedText(wptr,double(idiom{j}),'center',y_text,0);
                Screen('TextSize',wptr,28);
                DrawFormattedText(wptr,'1',ws/2-lengthof147/2-5,heightof147,0);
                DrawFormattedText(wptr,'4',ws/2-5,heightof147,0);
                DrawFormattedText(wptr,'7',ws/2+lengthof147/2-5,heightof147,0);
                Screen('DrawLine',wptr,0,ws/2-lengthof147/2,hs-100,ws/2+lengthof147/2,hs-100,5);
                Screen('FillOval',wptr,0,[x-5,y-5,x+5,y+5]);
                Screen('TextSize',wptr,28);
                DrawFormattedText(wptr,double('确认?  按空格键继续~按D键重新选择'),'center',hs-80,0);
                Screen('Flip',wptr);
                [kd,~,KC]=KbCheck;
                if kd
                    if KC(KbName('escape'))
                        ListenChar(0);
                        sca;
                    elseif KC(KbName('D'))~=1&&KC(KbName('space'))~=1
                        Screen('PutImage',wptr,practice5,[0,0,ws,hs]);
                        Screen('TextSize',wptr,40);
                        DrawFormattedText(wptr,double(idiom{j}),'center',y_text,0);
                        Screen('TextSize',wptr,28);
                        DrawFormattedText(wptr,'1',ws/2-lengthof147/2-5,heightof147,0);
                        DrawFormattedText(wptr,'4',ws/2-5,heightof147,0);
                        DrawFormattedText(wptr,'7',ws/2+lengthof147/2-5,heightof147,0);
                        Screen('DrawLine',wptr,0,ws/2-lengthof147/2,hs-100,ws/2+lengthof147/2,hs-100,5);
                        DrawFormattedText(wptr,double('只有空格键和D键为有效按键~'),'center',hs-80,0);
                        Screen('Flip',wptr);
                       WaitSecs(1);
                    else
                        break;
                    end
                end
            end
            if KC(KbName('space'))
                results(i-2,1).value=x-(ws/2-lengthof147/2);
                i=i+1;
                break;
            else
                Screen('PutImage',wptr,practice5,[0,0,ws,hs]);
                Screen('TextSize',wptr,40);
                DrawFormattedText(wptr,double(idiom{j}),'center',y_text,0);
                Screen('TextSize',wptr,28);
                DrawFormattedText(wptr,'1',ws/2-lengthof147/2-5,heightof147,0);
                DrawFormattedText(wptr,'4',ws/2-5,heightof147,0);
                DrawFormattedText(wptr,'7',ws/2+lengthof147/2-5,heightof147,0);
                Screen('DrawLine',wptr,0,ws/2-lengthof147/2,hs-100,ws/2+lengthof147/2,hs-100,5);
                Screen('Flip',wptr);
            end  
        end    
    end
end
return