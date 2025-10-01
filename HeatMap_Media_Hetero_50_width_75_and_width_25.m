filename = 'Segregation_Contact_Hypothesis_v8_corrected_division Media-Hetero-50-width-25-table';
T = readtable(filename,...
    'Range','A7:U968',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


RedMedia10 = table2array(T(:,9));
GreenMedia10 = table2array(T(:,10));
WantFinal10 = table2array(T(:,18));
WantFinal10 = reshape(WantFinal10,length(unique(RedMedia10)),length(unique(RedMedia10)));
WantFinalRed10 = table2array(T(:,20));
WantFinalRed10 = reshape(WantFinalRed10,length(unique(RedMedia10)),length(unique(RedMedia10)));
WantFinalGreen10 = table2array(T(:,19));
WantFinalGreen10 = reshape(WantFinalGreen10,length(unique(RedMedia10)),length(unique(RedMedia10)));
PerSim10 = table2array(T(:,21));
PerSim10 = reshape(PerSim10,length(unique(RedMedia10)),length(unique(RedMedia10)));


filename = 'Segregation_Contact_Hypothesis_v8_corrected_division Media-Hetero-50-width-75-table';
T = readtable(filename,...
    'Range','A7:U968',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


RedMedia90 = table2array(T(:,9));
GreenMedia90 = table2array(T(:,10));
WantFinal90 = table2array(T(:,18));
WantFinal90 = reshape(WantFinal90,length(unique(RedMedia90)),length(unique(RedMedia90)));
WantFinalRed90 = table2array(T(:,20));
WantFinalRed90 = reshape(WantFinalRed90,length(unique(RedMedia90)),length(unique(RedMedia90)));
WantFinalGreen90 = table2array(T(:,19));
WantFinalGreen90 = reshape(WantFinalGreen90,length(unique(RedMedia90)),length(unique(RedMedia90)));
PerSim90 = table2array(T(:,21));
PerSim90 = reshape(PerSim90,length(unique(RedMedia90)),length(unique(RedMedia90)));



figure(6)
clf
pos1 = [0.1 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(1-unique(RedMedia90),1-unique(GreenMedia90),PerSim90)
xlabel('Red Media $g_{R}(i)$','Interpreter','LaTeX','Position',[-.05 -.26],'FontSize',40)
title('Percent Similar $\lambda = 0.75$','Interpreter','LaTeX')


str = '(a)';
text(0.85,1.04,str,'FontSize',30,'Interpreter','LaTeX')

%ylim([0.899 1.201])
%xlim([0.899 1.201])

colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.55 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(1-unique(RedMedia10),1-unique(GreenMedia10),PerSim10)
%ylim([0.899 1.201])
%xlim([0.899 1.201])
str = '(b)';
text(0.85,1.04,str,'FontSize',30,'Interpreter','LaTeX')

xticklabels('')
ylabel('Green Media $g_{G}(i)$','Interpreter','LaTeX','Position',[-.24 -.25],'FontSize',40)
title('Percent Similar $\lambda = 0.25$','Interpreter','LaTeX')
caxis([50 100])
colorbar
colormap(ax(2), plasma)
set(gca,'FontSize',30)
view(-90,90)