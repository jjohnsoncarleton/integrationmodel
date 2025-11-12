
% Intial Intolerance = 50
filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Repulsion-Test-Intolerance-Right-Left-Total-table';
T = readtable(filename,...
   'Range','A7:V9808',...
   'ReadVariableNames',true,'PreserveVariableNames',false);

% Intial Intolerance = 75
filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Repulsion-Test-Intolerance-Right-Left-Total-75-table';
T1 = readtable(filename,...
   'Range','A7:V9808',...
   'ReadVariableNames',true,'PreserveVariableNames',false);

% Intial Intolerance = 25
filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Repulsion-Test-Intolerance-Right-Left-Total-25-table';
T2 = readtable(filename,...
   'Range','A7:V9808',...
   'ReadVariableNames',true,'PreserveVariableNames',false);




%%

% Initial Intolerace  = 50

% Lower Conformity Values
leftval = table2array(T(:,15));
% Unique Lower Conformity Values
leftunique = unique(leftval);
% Number of Unique Lower Conformity Values
leftlen = length(leftunique);

% Upper Conformity Values
rightval = table2array(T(:,16));
% Unique Upper Conformity Values
rightunique = unique(rightval);
% Number of Unique Upper Conformity Values
rightlen = length(rightunique);

% Average Intolerance Values
WantFinal = table2array(T(:,19));
% Average Intolerance Values Reshaped To Fit Data
WantFinal = reshape(WantFinal,leftlen,rightlen);

% Percent Similar Values
PerSim = table2array(T(:,22));
% Percent Similar Values Reshaped To Fit Data
PerSim = reshape(PerSim,leftlen,rightlen);



% Initial Intolerace  = 75

% Lower Conformity Values
leftval75 = table2array(T1(:,15));
% Unique Lower Conformity Values
leftunique75 = unique(leftval75);
% Number of Unique Lower Conformity Values
leftlen75 = length(leftunique75);

% Upper Conformity Values
rightval75 = table2array(T1(:,16));
% Unique Upper Conformity Values
rightunique75 = unique(rightval75);
% Number of Unique Upper Conformity Values
rightlen75 = length(rightunique75);

% Average Intolerance Values
WantFinal75 = table2array(T1(:,19));
% Average Intolerance Values Reshaped To Fit Data
WantFinal75 = reshape(WantFinal75,leftlen75,rightlen75);

% Percent Similar Values
PerSim75 = table2array(T1(:,22));
% Percent Similar Values Reshaped To Fit Data
PerSim75 = reshape(PerSim75,leftlen75,rightlen75);



% Initial Intolerace  = 25

% Lower Conformity Values
leftval25 = table2array(T2(:,15));
% Unique Lower Conformity Values
leftunique25 = unique(leftval25);
% Number of Unique Lower Conformity Values
leftlen25 = length(leftunique25);

% Upper Conformity Values
rightval25 = table2array(T2(:,16));
% Unique Upper Conformity Values
rightunique25 = unique(rightval25);
% Number of Unique Upper Conformity Values
rightlen25 = length(rightunique25);

% Average Intolerance Values
WantFinal25 = table2array(T2(:,19));
% Average Intolerance Values Reshaped To Fit Data
WantFinal25 = reshape(WantFinal25,leftlen25,rightlen25);

% Percent Similar Values
PerSim25 = table2array(T2(:,22));
% Percent Similar Values Reshaped To Fit Data
PerSim25 = reshape(PerSim25,leftlen25,rightlen25);


%%


% Initial Intolerace  = 50

figure(1)
clf
imagesc(leftunique,rightunique,PerSim)
ylabel('Upper Conformity $\lambda_U$','Interpreter','LaTeX')
xlabel('Lower Conformity $\lambda_L$','Interpreter','LaTeX')
title('Percent Similar')
clim([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, plasma)

% Initial Intolerace  = 75


figure(2)
clf
imagesc(leftunique75,rightunique75,PerSim75)
ylabel('Upper Conformity $\lambda_U$','Interpreter','LaTeX')
xlabel('Lower Conformity $\lambda_L$','Interpreter','LaTeX')
title('Percent Similar')
clim([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, plasma)


% Initial Intolerace  = 25


figure(3)
clf
imagesc(leftunique25,rightunique25,PerSim25)
ylabel('Upper Conformity $\lambda_U$','Interpreter','LaTeX')
xlabel('Lower Conformity $\lambda_L$','Interpreter','LaTeX')
title('Percent Similar')
clim([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, plasma)

