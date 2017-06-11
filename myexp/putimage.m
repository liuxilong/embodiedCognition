function putimage(wptr,image,text)
%putimage.m
[w,h]=Screen('WindowSize',wptr);
while 1
    Screen('PutImage',wptr,image,[0 0 w h]);
    Screen('Flip',wptr);
    while 1
        [~,~,kc]=KbCheck;
        if kc(KbName('space'))
            Screen('Flip',wptr);
            break;
        end
    end
    clear kc;
    DrawFormattedText(wptr,double([text '\n\n按"Y"键确定，按"N"键返回']),'center','center',0);
    Screen('Flip',wptr);
    while 1
        [~,~,kc]=KbCheck; 
        if kc(KbName('Y')) || kc(KbName('N')) 
            break;
        end
    end
    if kc(KbName('Y'))
        break;
    elseif kc(KbName('N')) 
        continue;
    end
    clear kc;
end
end