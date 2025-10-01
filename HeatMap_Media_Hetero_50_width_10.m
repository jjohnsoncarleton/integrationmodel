filename = 'Segregation_Contact_Hypothesis_v7_repulsion Media-Hetero-50-width-25-table.csv';
T = readtable(filename,...
    'Range','A7:U128',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


RedMedia = table2array(T(:,9));
GreenMedia = table2array(T(:,10));
WantFinal = table2array(T(:,18));
WantFinal = reshape(WantFinal,11,11);
WantFinalRed = table2array(T(:,20));
WantFinalRed = reshape(WantFinalRed,11,11);
WantFinalGreen = table2array(T(:,19));
WantFinalGreen = reshape(WantFinalGreen,11,11);
PerSim = table2array(T(:,21));
PerSim = reshape(PerSim,11,11);



figure(1)
imagesc(unique(RedMedia),unique(GreenMedia),PerSim)
ylim([0.949 1.051])
xlim([0.949 1.051])
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
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(RedMedia),unique(GreenMedia),PerSim)
xlabel('Red Media $g_{R}(i)$','Interpreter','LaTeX','Position',[1 0.941],'FontSize',40)
title('Percent Similar')

ylim([0.949 1.051])
xlim([0.949 1.051])

colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 55])
view(-90,90)

pos2 = [0.55 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(unique(RedMedia),unique(GreenMedia),WantFinal)
ylim([0.949 1.051])
xlim([0.949 1.051])
xticklabels('')
ylabel('Green Media $g_{G}(i)$','Interpreter','LaTeX','Position',[0.937 0.937],'FontSize',40)
title('Final Average Intolerance')
caxis([0 0.000001])
colorbar
colormap(ax(2), magma)
set(gca,'FontSize',30)
view(-90,90)
