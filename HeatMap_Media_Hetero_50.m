filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Media-Hetero-50-width-25-Media-Range-05-table';
T = readtable(filename,...
    'Range','A7:W968',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


RedMedia = table2array(T(:,9));
GreenMedia = table2array(T(:,10));
WantFinal = table2array(T(:,20));
WantFinal = reshape(WantFinal,length(unique(RedMedia)),length(unique(RedMedia)));
WantFinalRed = table2array(T(:,22));
WantFinalRed = reshape(WantFinalRed,length(unique(RedMedia)),length(unique(RedMedia)));
WantFinalGreen = table2array(T(:,21));
WantFinalGreen = reshape(WantFinalGreen,length(unique(RedMedia)),length(unique(RedMedia)));
PerSim = table2array(T(:,23));
PerSim = reshape(PerSim,length(unique(RedMedia)),length(unique(RedMedia)));



figure(1)
imagesc(unique(RedMedia),unique(GreenMedia),PerSim)
ylim([0.949 1.201])
xlim([0.949 1.201])
ylabel('Green Media $g_{G}(i)$','Interpreter','LaTeX')
xlabel('Red Media $g_{R}(i)$','Interpreter','LaTeX')
title('Percent Similar')
caxis([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)



figure(2)
imagesc(unique(RedMedia),unique(GreenMedia),WantFinal)
ylim([0.949 1.051])
xlim([0.949 1.051])
ylabel('Green Media $g_{G}(i)$','Interpreter','LaTeX')
xlabel('Red Media $g_{R}(i)$','Interpreter','LaTeX')
title('Final Average Intolerance')
caxis([0 70])
colorbar
set(gca,'FontSize',30)
view(-90,90)

figure(3)
clf
imagesc(unique(RedMedia),unique(GreenMedia),WantFinalRed)
ylim([0.949 1.051])
xlim([0.949 1.051])
ylabel('Green Media $g_{G}(i)$','Interpreter','LaTeX')
xlabel('Red Media $g_{R}(i)$','Interpreter','LaTeX')
title('Final Average Intolerance Red')
caxis([0 70])
colorbar
set(gca,'FontSize',30)
view(-90,90)


figure(4)
clf
imagesc(unique(RedMedia),unique(GreenMedia),WantFinalGreen)
ylim([0.949 1.051])
xlim([0.949 1.051])
ylabel('Green Media $g_{G}(i)$','Interpreter','LaTeX')
xlabel('Red Media $g_{R}(i)$','Interpreter','LaTeX')
title('Final Average Intolerance Green')
caxis([0 70])
colorbar
set(gca,'FontSize',30)
view(-90,90)


figure(6)
pos1 = [0.1 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(1-unique(RedMedia),1-unique(GreenMedia),PerSim)
text(0.85,1.04,'(a)','FontSize',30,'Interpreter','LaTeX')

xlabel('Red Media $g_{R}(i)$','Interpreter','LaTeX','Position',[-.05 -.26],'FontSize',40)
title('Percent Similar','Interpreter','LaTeX')

%ylim([0.899 1.201])
%xlim([0.899 1.201])

colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(1-unique(RedMedia),1-unique(GreenMedia),WantFinal)
text(0.85,1.04,'(b)','FontSize',30,'Interpreter','LaTeX')

%ylim([0.899 1.201])
%xlim([0.899 1.201])
xticklabels('')
ylabel('Green Media $g_{G}(i)$','Interpreter','LaTeX','Position',[-.24 -.25],'FontSize',40)
title('Final Average Intolerance','Interpreter','LaTeX')
caxis([0 100])
colorbar
colormap(ax(2), magma)
set(gca,'FontSize',30)
view(-90,90)
