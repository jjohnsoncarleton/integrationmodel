% if you want to clear all variables uncomment and run this
clear all

% Upload Data
% Change the name/path if needed
filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Density-Test-Intolerance-50-Total-table';
T1 = readtable(filename,...
   'Range','A7:Y4957',...
   'ReadVariableNames',true,'PreserveVariableNames',false);

filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Density-Test-Intolerance-75-Total-table';
T2 = readtable(filename,...
   'Range','A7:Y4957',...
   'ReadVariableNames',true,'PreserveVariableNames',false);


filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Density-Test-Intolerance-25-Total-table';
T3 = readtable(filename,...
   'Range','A7:Y4957',...
   'ReadVariableNames',true,'PreserveVariableNames',false);




%%

% Density Values
Density = table2array(T1(:,2));
% Unique Density Values
DensityUnique = unique(Density);
% Number of Unique Density Values
DensityUniqueLength = length(unique(Density));

% Conformity Values
RepDist = table2array(T1(:,11));
% Unique Conformity Values
RepDistUnique = unique(RepDist);
% Number of Unique Density Values
RepDistUniqueLength = length(unique(RepDist));


% Percent Similar for Initial Intolerance = 50
PerSim50 = table2array(T1(:,25));
PerSim50 = reshape(PerSim50,RepDistUniqueLength,DensityUniqueLength);

% Percent Similar for Initial Intolerance = 75
PerSim75 = table2array(T2(:,25));
PerSim75 = reshape(PerSim75,RepDistUniqueLength,DensityUniqueLength);

% Percent Similar for Initial Intolerance = 25
PerSim25 = table2array(T3(:,25));
PerSim25 = reshape(PerSim25,RepDistUniqueLength,DensityUniqueLength);



% Percent Similar for Initial Intolerance = 50
figure(1)
clf
imagesc(unique(Density),unique(RepDist),PerSim50)
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
xlabel('Density','Interpreter','LaTeX')
title('Percent Similar')
caxis([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, plasma)

% Percent Similar for Initial Intolerance = 75

figure(2)
clf
imagesc(unique(Density),unique(RepDist),PerSim75)
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
xlabel('Density','Interpreter','LaTeX')
title('Percent Similar')
caxis([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, plasma)


% Percent Similar for Initial Intolerance = 25

figure(3)
clf
imagesc(unique(Density),unique(RepDist),PerSim25)
ylabel('Conformity $\lambda$','Interpreter','LaTeX')
xlabel('Density','Interpreter','LaTeX')
title('Percent Similar')
caxis([50 100])
colorbar
set(gca,'FontSize',30)
view(-90,90)
colormap(gca, plasma)
