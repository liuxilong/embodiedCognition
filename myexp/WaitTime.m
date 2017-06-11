function WaitTime(wptr,minutes,color,length,text1,text2) 
%WaitTime.m
global mode
wrect=Screen('Rect',wptr);
Screen('TextSize',wptr,28);
i=1;
while i<length
    WaitSecs(60*minutes/length);
    Screen('FillRect',wptr,color,[wrect(3)/2-length/2,wrect(4)/2-10,wrect(3)/2-length/2+i,wrect(4)/2+10]);
    txt=[text1  num2str(round(i/length*100)) '%'];
    DrawFormattedText(wptr,double(txt),'center',wrect(4)/2+40,0);
    if mode 
        Screen('AddFrameToMovie',wptr,[ ],'backBuffer');
    end
    Screen('Flip',wptr);
    i=i+1;
end
    Screen('FillRect',wptr,color,[wrect(3)/2-length/2,wrect(4)/2-10,wrect(3)/2-length/2+i,wrect(4)/2+10]);
    txt=[text2 '\n\n请按任意键继续！'];
    DrawFormattedText(wptr,double(txt),'center',wrect(4)/2+40,0);
    if mode 
        Screen('AddFrameToMovie',wptr,[ ],'backBuffer');
    end
    Screen('Flip',wptr);
    clear i wrect;
    KbWait;
end