function collecting_info(i,subinfo,b)
% collecting_info.m
global results;
results(i,1).id=str2double(subinfo{1});
if strcmp(subinfo{2},'ÄÐ')
    results(i,1).sex='male';
else
    results(i,1).sex='female';
end
results(i,1).age=str2double(subinfo{3});
results(i,1).trialno=i;
results(i,1).group=b{(results(i,1).id-1)*6+results(i,1).trialno+1,4};
results(i,1).group_block=b{(results(i,1).id-1)*6+results(i,1).trialno+1,5};
results(i,1).order=b{(results(i,1).id-1)*6+results(i,1).trialno+1,6};
results(i,1).actionid=b{(results(i,1).id-1)*6+results(i,1).trialno+1,8};
results(i,1).action=b{(results(i,1).id-1)*6+results(i,1).trialno+1,9};
results(i,1).idiom_id=b{(results(i,1).id-1)*6+results(i,1).trialno+1,10};
results(i,1).idiom=b{(results(i,1).id-1)*6+results(i,1).trialno+1,11};
results(i,1).idiom_val=b{(results(i,1).id-1)*6+results(i,1).trialno+1,12};
end