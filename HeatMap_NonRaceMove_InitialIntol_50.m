filename = 'Segregation_Contact_Hypothesis_v10_corrected_random Moving-Percent-ZOOM-Total-table.csv';
T = readtable(filename,...
    'Range','A7:S10107',...
    'ReadVariableNames',true,'PreserveVariableNames',false);

% filename = 'Segregation_Contact_Hypothesis_v10_corrected_random Moving-Percent-ZOOM-Total-table.csv';
% T = readtable(filename,...
%     'Range','A7:S9299',...
%     'ReadVariableNames',true,'PreserveVariableNames',false);

% filename = 'Segregation_Contact_Hypothesis_v10_corrected_random Moving-Percent-Total-table.csv';
% T = readtable(filename,...
%     'Range','A7:S238',...
%     'ReadVariableNames',true,'PreserveVariableNames',false);


%%

NonRaceMove = table2array(T(:,13));
RepDist = table2array(T(:,14));

WantFinal = table2array(T(:,16));
WantFinal = reshape(WantFinal,length(unique(NonRaceMove)),length(unique(RepDist)));

PerSim = table2array(T(:,19));
PerSim = reshape(PerSim,length(unique(NonRaceMove)),length(unique(RepDist)));

figure(1)
imagesc(unique(RepDist),unique(NonRaceMove),PerSim)
view(-90,90)
caxis([50 80])
colorbar
colormap(gca,  plasma)



figure(2)
imagesc(unique(RepDist),unique(NonRaceMove),WantFinal)
view(-90,90)
caxis([0 80])
colorbar
colormap(gca,  plasma)




figure(3)
pos1 = [0.079 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(RepDist),unique(NonRaceMove),PerSim)
xlabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[0.5 -15],'FontSize',40)
text(-0.2,46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar','Interpreter','LaTeX')

colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 80])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(unique(RepDist),unique(NonRaceMove),WantFinal)
text(-0.2,46,'(b)','FontSize',30,'Interpreter','LaTeX')

ylabel('Non Racial Move','Interpreter','LaTeX','Position',[-0.15 -12],'FontSize',40)
title('Final Average Intolerance','Interpreter','LaTeX')
caxis([0 65])
colorbar
colormap(ax(2), magma)
set(gca,'FontSize',30)
view(-90,90)



figure(4)
pos1 = [0.079 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(NonRaceMove),unique(RepDist),PerSim')
xlabel('Non Racial Move','Interpreter','LaTeX','Position',[50 -0.12],'FontSize',40)
text(-18,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar','Interpreter','LaTeX')

colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(unique(NonRaceMove),unique(RepDist),WantFinal')
text(-18,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-15 -0.22],'FontSize',40)
title('Final Average Intolerance','Interpreter','LaTeX')
caxis([0 100])
colorbar
colormap(ax(2), viridis)
set(gca,'FontSize',30)
view(-90,90)


filename = 'Segregation_Contact_Hypothesis_v10_corrected_random Moving-Percent-Total-25-table.csv';
T25 = readtable(filename,...
    'Range','A7:S238',...
    'ReadVariableNames',true,'PreserveVariableNames',false);



NonRaceMove25 = table2array(T25(:,13));
RepDist25 = table2array(T25(:,14));

WantFinal25 = table2array(T25(:,16));
WantFinal25 = reshape(WantFinal25,length(unique(NonRaceMove25)),length(unique(RepDist25)));

PerSim25 = table2array(T25(:,19));
PerSim25 = reshape(PerSim25,length(unique(NonRaceMove25)),length(unique(RepDist25)));


figure(5)
clf
pos1 = [0.1 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(NonRaceMove),unique(RepDist),PerSim')
xlabel('Non Racial Move','Interpreter','LaTeX','Position',[50 -0.15],'FontSize',40)
text(-18,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
title('Percent Similar $T_0 = 50$','Interpreter','LaTeX')

colorbar
colormap(ax(1),  plasma)
set(gca,'FontSize',30)
caxis([50 100])
view(-90,90)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(unique(NonRaceMove25),unique(RepDist25),PerSim25')
xticklabels('')
text(-18,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-15 -0.22],'FontSize',40)
title('Percent Similar $T_0 = 25$','Interpreter','LaTeX')
caxis([50 100])
colorbar
colormap(ax(2), viridis)
set(gca,'FontSize',30)
view(-90,90)





%%


figure(6)
clf
imagesc(unique(NonRaceMove),unique(RepDist),PerSim');
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-1 0],'FontSize',40)
xlabel('Non Racial Move','Interpreter','LaTeX','Position',[50 -0.15],'FontSize',40)
title('Percent Similar $T_0 = 50$','Interpreter','LaTeX')
caxis([50 100])
colorbar
colormap(gca,   plasma)
set(gca,'FontSize',30)
view(-90,90)

