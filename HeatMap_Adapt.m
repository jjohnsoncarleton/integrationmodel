% if you want to clear all variables uncomment and run this
clear all

% Upload Data
% Change the name/path if needed
filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Repulsion-Test-Intolerance-Adapt-Total-50-table';
T = readtable(filename,...
   'Range','A7:V2007',...
   'ReadVariableNames',true,'PreserveVariableNames',false);



% Adaptability Values
Adapt = table2array(T(:,5));
% Unique Adaptability Values
AdaptUnique = unique(Adapt);
% Length of Adaptability Values
AdaptUniqueLength = length(AdaptUnique);

% Conformity Values
RepDist = table2array(T(:,14));
% Get Unique Conformity Values
RepDistUnique = unique(RepDist);
% Find the amount of unique conformity values
RepDistLength = length(RepDistUnique);

% Average Intolerance Values
WantFinal = table2array(T(:,19));
% Reshape Data to Be Able Plot Heat Map
WantFinal = reshape(WantFinal,RepDistLength,AdaptUniqueLength);

% Simulation Time
FinalTime = table2array(T(:,18));
% Reshape Data to Be Able Plot Heat Map
FinalTime = reshape(FinalTime,RepDistLength,AdaptUniqueLength);

% Percent Similar Values
PerSim = table2array(T(:,22));
% Reshape Data to Be Able Plot Heat Map
PerSim = reshape(PerSim,RepDistLength,AdaptUniqueLength);


% Heatmap for Percent Similar and Timesteps
figure(1)
clf
pos1 = [0.075 0.175 0.4 0.73];
ax(1)= subplot('Position',pos1);
imagesc(AdaptUnique,RepDistUnique,PerSim)
text(-2.5,0.46,'(a)','FontSize',30,'Interpreter','LaTeX')
xlabel('Adaptability','Interpreter','LaTeX','Position',[10 -0.1],'FontSize',40)
title('Percent Similar')
clim([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, plasma)

pos2 = [0.5575 0.175 0.4 0.73];
ax(2) = subplot('Position',pos2);
imagesc(AdaptUnique,RepDistUnique,FinalTime)
text(-2.5,0.46,'(b)','FontSize',30,'Interpreter','LaTeX')
ylabel('Conformity $\lambda$','Interpreter','LaTeX','Position',[-1.5 -0.1],'FontSize',40)
title('Time Step')
clim([100 1200])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, viridis)
