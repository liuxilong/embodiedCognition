function justSaySomething(wptr,something,waitornot,color)
%justSaySomething.m
global mode
if nargin<3
	waitornot=0;
    color=0;
end
if nargin<4
    color=0;
end
Screen('TextSize',wptr,26);
oldtxtcolor=Screen('TextColor',wptr);
DrawFormattedText(wptr,double(something),'center','center',color);
if mode 
    Screen('AddFrameToMovie',wptr,[ ],'backBuffer');
end
Screen('Flip',wptr);
Screen('TextColor',wptr,oldtxtcolor);
while KbCheck;end
if waitornot
    while 1
	[~,~,kc]=KbCheck;
    if kc(KbName('space'))
        break;
    end
    end
end
end