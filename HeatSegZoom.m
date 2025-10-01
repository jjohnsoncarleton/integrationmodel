
filename = 'Segregation_Contact_Hypothesis_v10_corrected_random Repulsion-Test-Intolerance-ZOOM-Total-table.csv';
T = readtable(filename,...
    'Range','A7:S10007',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


WantFinal = table2array(T(:,16));
WantFinal = reshape(WantFinal,100,100);
PerSim = table2array(T(:,19));
PerSim = reshape(PerSim,100,100);

PerSimWantInt = table2array(T(:,3));
RepDist = table2array(T(:,14));

% 
% filename = 'Segregation_Contact_Hypothesis_v8_corrected_division Repulsion-Test-Intolerance-Checkerboard-Move-table.csv';
% T = readtable(filename,...
%     'Range','A7:t194',...
%     'ReadVariableNames',true,'PreserveVariableNames',false);
% 
% 
% WantFinal = table2array(T(:,17));
% WantFinal = reshape(WantFinal,11,17);
% PerSim = table2array(T(:,20));
% % PerSim = reshape(PerSim,11,17);
% 
% PerSimWantInt = table2array(T(:,3));
% RepDist = table2array(T(:,14));



figure(1)
clf
imagesc(unique(PerSimWantInt),unique(RepDist),PerSim)
ylim([0 1.01])
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
xlabel('Initial Tolerance $T_0$','Interpreter','LaTeX')
title('Percent Similar')
caxis([50 90])
colorbar
set(gca,'FontSize',30)
view(-90,90)


figure(2)
clf
imagesc(unique(PerSimWantInt),unique(RepDist),WantFinal)
xlabel('Initial Intolerance $T_0$','Interpreter','LaTeX')
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
title('Final Average Intolerance','Interpreter','LaTeX')
ylim([0 1.01])
colorbar
set(gca,'FontSize',30)
caxis([0 100])
view(-90,90)

figure(3)
clf
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(unique(PerSimWantInt),unique(RepDist),PerSim)
text(-14,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
colormap(ax(1),  plasma)
xlabel('Initial Intolerance $T_0$','Interpreter','LaTeX','Position',[50 -0.1],'FontSize',40)
title('Percent Similar','Interpreter','LaTeX','FontSize',40)
colorbar
caxis([50 100])
view(-90,90)
set(gca,'FontSize',30)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(unique(PerSimWantInt),unique(RepDist),WantFinal)
text(-14,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-10 -0.1],'FontSize',40)
title('Final Average Intolerance','Interpreter','LaTeX','FontSize',40)
ylim([0 1.01])
colorbar
caxis([0 100])
colormap(ax(2), viridis)

ylim([0 1.01])
view(-90,90)
set(gca,'FontSize',30)




%%

[X,Y] = meshgrid(unique(PerSimWantInt),unique(RepDist));
figure(4)
surf(X,Y,WantFinal)