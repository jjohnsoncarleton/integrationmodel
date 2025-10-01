filename = 'Segregation_Contact_Hypothesis_v10_corrected_random Repulsion-Test-Intolerance-Red-Per-Vary-Sim-Want-50-Total-table-combined.csv';
T = readtable(filename,...
    'Range','A7:U9907',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


RedPer = table2array(T(:,10));
WantFinal = table2array(T(:,18));
WantFinalG = table2array(T(:,19));
WantFinalR = table2array(T(:,20));
WantFinal = reshape(WantFinal,100,99);
WantFinalG = reshape(WantFinalG,100,99);
WantFinalR = reshape(WantFinalR,100,99);
PerSim = table2array(T(:,21));
PerSim = reshape(PerSim,100,99);
RepDist = table2array(T(:,14));


%%


figure(1)
imagesc(unique(RedPer),unique(RepDist),PerSim)
ylim([0.01 1.01])
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
xlabel('Initial Tolerance $T_0$','Interpreter','LaTeX')
title('Percent Similar')
caxis([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)


figure(2)
imagesc(unique(RedPer),unique(RepDist),WantFinal)
xlabel('Red Percent','Interpreter','LaTeX')
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
title('Final Average Intolerance','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)

figure(3)
clf
imagesc(unique(RedPer),unique(RepDist),PerSim - mean(PerSim))
ylim([0 1.01])
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
xlabel('Red Percent','Interpreter','LaTeX')
title('Percent Similar','Interpreter','LaTeX')
caxis([-20 20])
colorbar
set(gca,'FontSize',30)
view(-90,90)



figure(4)
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(RedPer),unique(RepDist),PerSim)
xlabel('Red Percent','Interpreter','LaTeX','Position',[50 -0.1],'FontSize',40)
text(-7.5,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(unique(RedPer),unique(RepDist),PerSim - mean(PerSim))
text(-7.5,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
ylim([0 1.01])
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-3 -0.1],'FontSize',40)
title('Percent Similar Minus Mean','Interpreter','LaTeX')
caxis([-20 20])
colorbar
colormap(ax(2), viridis)
set(gca,'FontSize',30)
view(-90,90)





figure(6)
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(RedPer),unique(RepDist),WantFinal)
xlabel('Red Percent','Interpreter','LaTeX','Position',[50 -0.1],'FontSize',40)
text(-7.5,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Final Average Intolerance','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(unique(RedPer),unique(RepDist),WantFinal - mean(WantFinal))
text(-7.5,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
ylim([0 1.01])
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-3 -0.1],'FontSize',40)
title('Final Average Intolerance Minus Mean','Interpreter','LaTeX')
caxis([-30 30])
colorbar
colormap(ax(2), viridis)
set(gca,'FontSize',30)
view(-90,90)





figure(7)
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(RedPer),unique(RepDist),PerSim)
xlabel('Red Percent','Interpreter','LaTeX','Position',[50 -0.1],'FontSize',40)
text(-7.5,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2)= subplot('Position',pos2);
imagesc(unique(RedPer),unique(RepDist),WantFinal)
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-3 -0.1],'FontSize',40)
text(-7.5,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
title('Final Average Intolerance','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(2),  viridis)
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)



filename = 'Segregation_Contact_Hypothesis_v10_corrected_random Repulsion-Test-Intolerance-Red-Per-Vary-Sim-Want-25-Total-table.csv';
T25 = readtable(filename,...
    'Range','A7:U9907',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


RedPer25 = table2array(T25(:,10));
WantFinal25 = table2array(T25(:,18));
WantFinal25G = table2array(T25(:,19));
WantFinal25R = table2array(T25(:,20));
WantFinal25 = reshape(WantFinal25,100,99);
WantFinal25G = reshape(WantFinal25G,100,99);
WantFinal25R = reshape(WantFinal25R,100,99);
PerSim25 = table2array(T25(:,21));
PerSim25 = reshape(PerSim25,100,99);
RepDist25 = table2array(T25(:,14));


%%



figure(10)
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(RedPer25),unique(RepDist25),PerSim25)
xlabel('Red Percent','Interpreter','LaTeX','Position',[50 -0.1],'FontSize',40)
text(-7.5,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2)= subplot('Position',pos2);
imagesc(unique(RedPer25),unique(RepDist25),WantFinal25)
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-3 -0.1],'FontSize',40)
text(-7.5,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
title('Final Average Intolerance','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(2),  viridis)
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)





%%
figure(8)
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(RedPer),unique(RepDist),PerSim)
xlabel('Red Percent','Interpreter','LaTeX','Position',[50 -0.1],'FontSize',40)
text(-15,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar $T_0 = 50$','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2)= subplot('Position',pos2);
imagesc(unique(RedPer25),unique(RepDist25),PerSim25)
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-10 -0.15],'FontSize',40)
text(-15,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar $T_0 = 25$','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(2),  viridis)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)


%%
%%%%%%%%%%%%%%%%


figure(9)
clf
pos1 = [0.12 0.6 0.31 0.31];
ax(1)= subplot('Position',pos1);
imagesc(unique(RedPer),unique(RepDist),WantFinalR)
xlabel('Red Percent','Interpreter','LaTeX','Position',[-12.5 -0.3],'FontSize',40)
text(-7.5,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Final Avg Intolerance $T_0 = 50$','Interpreter','LaTeX')
yticklabels('')
ylim([0 1.01])
colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)

pos2 = [0.57 0.6 0.31 0.31];
ax(2)= subplot('Position',pos2);
imagesc(unique(RedPer25),unique(RepDist),WantFinal25R)
text(-7.5,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
yticklabels('')
title('Final Avg Intolerance  $T_0 = 25$','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(2),  viridis)
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)



pos3 = [0.12 0.15 0.31 0.31];
ax(3)= subplot('Position',pos3);
imagesc(unique(RedPer),unique(RepDist),WantFinalG)
xlabel('Red','Interpreter','LaTeX','Position',[180 -0.15],'FontSize',40)

text(-30,0.46,'(c)','FontSize',30,'Interpreter','LaTeX')
%title('Percent Similar $T_0 = 50$','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(3),  plasma)
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)

pos4 = [0.57 0.15 0.3 0.3];
ax(4)= subplot('Position',pos4);
imagesc(unique(RedPer25),unique(RepDist),WantFinal25G)
xlabel('Green','Interpreter','LaTeX','Position',[50 -2.01],'FontSize',40)

ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-15 -0.35],'FontSize',40)
text(-30,0.46,'(d)','FontSize',30,'Interpreter','LaTeX')
%title('Percent Similar $T_0 = 25$','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
colormap(ax(4),  viridis)
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)