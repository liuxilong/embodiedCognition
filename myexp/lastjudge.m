function lastjudge(wptr)
% show_idiom_practice.m
global   lengthof147 results ;
[ws,hs]=Screen('WindowSize',wptr);
ScreenNum=max(Screen('Screens'));
[width,~]=Screen('DisplaySize',ScreenNum);
heightof147=hs-100-40;
Screen('Flip',wptr);
onepixel=ws/width;
last1=imread('last1.jpg');
last2=imread('last2.jpg');
for j=1:2
    imagename_pic=[results(j*3-2,1).actionid '_.jpg'];
    imagename=imread(imagename_pic);
    for k=1:2
        if k==1
            Screen('PutImage',wptr,last1,[0,0,ws,hs]);
        else
            Screen('PutImage',wptr,last2,[0,0,ws,hs]);
        end
        Screen('PutImage',wptr,imagename,[onepixel*30,hs/2-onepixel*70*2/3,onepixel*30+onepixel*70,hs/2+onepixel*70*2/3]);
        Screen('TextSize',wptr,28);%28
        DrawFormattedText(wptr,'1',ws/2-lengthof147/2-5,heightof147,0);
        DrawFormattedText(wptr,'4',ws/2-5,heightof147,0);
        DrawFormattedText(wptr,'7',ws/2+lengthof147/2-5,heightof147,0);
        Screen('DrawLine',wptr,0,ws/2-lengthof147/2,hs-100,ws/2+lengthof147/2,hs-100,5);
        Screen('Flip',wptr);
        while 1 
            [x,y,buttons]=GetMouse(wptr); 
            if buttons(1)
                while 1
                    if k==1
                        Screen('PutImage',wptr,last1,[0,0,ws,hs]);
                    else
                        Screen('PutImage',wptr,last2,[0,0,ws,hs]);
                    end
                    Screen('PutImage',wptr,imagename,[onepixel*30,hs/2-onepixel*70*2/3,onepixel*30+onepixel*70,hs/2+onepixel*70*2/3]);
                    Screen('TextSize',wptr,28);%28
                    DrawFormattedText(wptr,'1',ws/2-lengthof147/2-5,heightof147,0);
                    DrawFormattedText(wptr,'4',ws/2-5,heightof147,0);
                    DrawFormattedText(wptr,'7',ws/2+lengthof147/2-5,heightof147,0);
                    Screen('DrawLine',wptr,0,ws/2-lengthof147/2,hs-100,ws/2+lengthof147/2,hs-100,5);
                    Screen('FillOval',wptr,0,[x-5,y-5,x+5,y+5]);
                    Screen('TextSize',wptr,28);%28
                    DrawFormattedText(wptr,double('确认?  按空格键继续~按D键重新选择'),'center',hs-80,0);
                    Screen('Flip',wptr);
                    [kd,~,KC]=KbCheck;
                    if kd
                        if KC(KbName('escape'))
                            ListenChar(0);
                            sca;
                        elseif KC(KbName('D'))~=1&&KC(KbName('space'))~=1
                            if k==1
                                Screen('PutImage',wptr,last1,[0,0,ws,hs]);
                            else
                                Screen('PutImage',wptr,last2,[0,0,ws,hs]);
                            end
                            Screen('PutImage',wptr,imagename,[onepixel*30,hs/2-onepixel*70*2/3,onepixel*30+onepixel*70,hs/2+onepixel*70*2/3]);
                            Screen('TextSize',wptr,28);%28
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
                    if k==1
                        results(j*3-2,1).action_value=x-(ws/2-lengthof147/2);
                        results(j*3-1,1).action_value=x-(ws/2-lengthof147/2);
                        results(j*3,1).action_value=x-(ws/2-lengthof147/2);
                    else
                        results(j*3-2,1).sub_value=x-(ws/2-lengthof147/2);
                        results(j*3-1,1).sub_value=x-(ws/2-lengthof147/2);
                        results(j*3,1).sub_value=x-(ws/2-lengthof147/2);
                    end
                    break;
                else
                    if k==1
                        Screen('PutImage',wptr,last1,[0,0,ws,hs]);
                    else
                        Screen('PutImage',wptr,last2,[0,0,ws,hs]);
                    end
                    Screen('PutImage',wptr,imagename,[onepixel*30,hs/2-onepixel*70*2/3,onepixel*30+onepixel*70,hs/2+onepixel*70*2/3]);
                    Screen('TextSize',wptr,28);%28
                    DrawFormattedText(wptr,'1',ws/2-lengthof147/2-5,heightof147,0);
                    DrawFormattedText(wptr,'4',ws/2-5,heightof147,0);
                    DrawFormattedText(wptr,'7',ws/2+lengthof147/2-5,heightof147,0);
                    Screen('DrawLine',wptr,0,ws/2-lengthof147/2,hs-100,ws/2+lengthof147/2,hs-100,5);
                    Screen('Flip',wptr);
                end  
            end    
        end
    end
end
return