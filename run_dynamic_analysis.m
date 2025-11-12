% if you want to clear all variables uncomment and run this
clear all

% Upload Data
% Change the name/path if needed
filename = 'Segregation_Contact_Hypothesis_v10_corrected_random (1) (1) Repulsion-Test-Intolerance-Total-Timed (Reporting Data)-table';
T = readtable(filename,...
    'Range','A7:T600607',...
    'ReadVariableNames',true,'PreserveVariableNames',false);


%%


% Conformity Values
RepDist = table2array(T(:,14));
% Get Unique Conformity Values
RepDistUnique = unique(table2array(T(:,14)));
% Find the amount of unique conformity values
RepDistLength = length(unique(RepDist));




% Percent-Smilar Values
PerSim = table2array(T(:,20));
% Reshape the runs so that each row represents an individual run
% and each column respresents time
PerSimRuns = reshape(PerSim,[1001,600]);

% Calculuate The Standard Deviation of Percent-Similar
% (100 timesteps)
PerSimRunsstd  = zeros([901,600]);
for i =1:901
    PerSimRunsstd(i, :) = std(PerSimRuns(i:i+100, :));

end



% Set colors for each unique conformity value
cmap = colormap(jet(RepDistLength));

% Average Intolerance Values
WantFinal = table2array(T(:,17));
% Reshape the runs so that each row represents an individual run
% and each column respresents time
WantFinalRuns = reshape(WantFinal,[1001,600]);

% Calculuate The Standard Deviation of Average Intolerance
% (100 timesteps)
WantFinalRunsstd = zeros([901,600]);
for i =1:901
    WantFinalRunsstd(i, :) = std(WantFinalRuns(i:i+100, :));

end


% Get the timesteps for all runs
timestep = table2array(T(:,16));


% Get the index for beginning and end of each of the
% 600 simulations
runind = zeros([600,2]);
for i =1:600
    % T(:,1) gives the simulation run number. Thus,
    % we can find the index that corresponds to beginning and
    % end of each run

    % Index corresponding to beginning of run
    runind(i,1) = find(table2array(T(:,1))==i, 1, 'first');
    % Index corresponding to end of run
    runind(i,2) = find(table2array(T(:,1))==i, 1, 'last');
end


%%


% Average Intolerance Graphs
figure(1)
clf
hold on
% 1 to 200 gives the initial intolerance of 25
for i =1:200
    % Assign a color based on the unique conformity value
    % and assign a legend label based on conformity
    for j = 1:RepDistLength
        if RepDist(runind(i,2)) == RepDistUnique(j)
            colors = cmap(j,:);
            legendlabel = ['$\lambda =$ ',num2str(RepDistUnique(j))];
        end
    end

    % Use the run indicies to get the appropriate timestep and average
    % intolerance values

    % We plot every curve but only show a subset of conformity values to
    % the legend
    if mod(i,20) ==0
        plot(timestep(runind(i,1):runind(i,2)), WantFinal(runind(i,1):runind(i,2)),'-','Color',colors, 'DisplayName', legendlabel)
    else
        plot(timestep(runind(i,1):runind(i,2)), WantFinal(runind(i,1):runind(i,2)),'-','Color',colors,'HandleVisibility','off')

    end

end
% Line to indicate 100 timesteps

plot([100, 100],[0 100],'k:','LineWidth',3,'HandleVisibility','off')
xlabel('Time Step', 'Interpreter','latex')
ylabel('Average Intolerance', 'Interpreter','latex')
title('Average Intolerance - Initial Intolerance $I_0 = 25$', 'Interpreter','latex')

set(gca,'fontsize',30)
legend('Interpreter','latex')
hold off



figure(2)
clf
hold on
% 201 to 400 gives the initial intolerance of 50
for i =201:400
    % Assign a color based on the unique conformity value
    % and assign a legend label based on conformity
    for j = 1:RepDistLength
        if RepDist(runind(i,2)) == RepDistUnique(j)
            colors = cmap(j,:);
            legendlabel = ['$\lambda =$ ',num2str(RepDistUnique(j))];
        end
    end

    % Use the run indicies to get the appropriate timestep and average
    % intolerance values

    % We plot every curve but only show a subset of conformity values to
    % the legend
    if mod(i,20) ==0
        plot(timestep(runind(i,1):runind(i,2)), WantFinal(runind(i,1):runind(i,2)),'-','Color',colors, 'DisplayName', legendlabel)
    else
        plot(timestep(runind(i,1):runind(i,2)), WantFinal(runind(i,1):runind(i,2)),'-','Color',colors,'HandleVisibility','off')

    end
end

% Line to indicate 100 timesteps
plot([100, 100],[0 100],'k:','LineWidth',3,'HandleVisibility','off')
xlabel('Time Step', 'Interpreter','latex')
ylabel('Average Intolerance', 'Interpreter','latex')
title('Average Intolerance - Initial Intolerance $I_0 = 50$', 'Interpreter','latex')

set(gca,'fontsize',30)
legend('Interpreter','latex')

hold off

figure(3)
clf
hold on
% 401 to 600 gives the initial intolerance of 75
for i =401:600
    % Assign a color based on the unique conformity value
    % and assign a legend label based on conformity
    for j = 1:RepDistLength
        if RepDist(runind(i,2)) == RepDistUnique(j)
            colors = cmap(j,:);
            legendlabel = ['$\lambda =$ ',num2str(RepDistUnique(j))];
        end
    end

    % Use the run indicies to get the appropriate timestep and average
    % intolerance values

    % We plot every curve but only show a subset of conformity values to
    % the legend
    if mod(i,20) ==0
        plot(timestep(runind(i,1):runind(i,2)), WantFinal(runind(i,1):runind(i,2)),'-','Color',colors, 'DisplayName', legendlabel)
    else
        plot(timestep(runind(i,1):runind(i,2)), WantFinal(runind(i,1):runind(i,2)),'-','Color',colors,'HandleVisibility','off')

    end
end
% Line to indicate 100 timesteps
plot([100, 100],[0 100],'k:','LineWidth',3,'HandleVisibility','off')
xlabel('Time Step', 'Interpreter','latex')
ylabel('Average Intolerance', 'Interpreter','latex')
title('Average Intolerance - Initial Intolerance $I_0 = 75$', 'Interpreter','latex')

set(gca,'fontsize',30)
legend('Interpreter','latex')

hold off



% Percent Similar Graphs

figure(10)
clf
hold on
% 1 to 200 gives the initial intolerance of 25
for i =1:200
    % Assign a color based on the unique conformity value
    % and assign a legend label based on conformity
    for j = 1:RepDistLength
        if RepDist(runind(i,2)) == RepDistUnique(j)
            colors = cmap(j,:);
            legendlabel = ['$\lambda =$ ',num2str(RepDistUnique(j))];
        end
    end

    % Use the run indicies to get the appropriate timestep and average
    % intolerance values

    % We plot every curve but only show a subset of conformity values to
    % the legend
    if mod(i,20) ==0
        plot(timestep(runind(i,1):runind(i,2)), PerSim(runind(i,1):runind(i,2)),'-','Color',colors, 'DisplayName', legendlabel)
    else
        plot(timestep(runind(i,1):runind(i,2)), PerSim(runind(i,1):runind(i,2)),'-','Color',colors,'HandleVisibility','off')

    end

end
% Line to indicate 100 timesteps
plot([100, 100],[0 100],'k:','LineWidth',3,'HandleVisibility','off')
xlabel('Time Step', 'Interpreter','latex')
ylabel('Percent Similar', 'Interpreter','latex')
title('Percent Similar - Initial Intolerance $I_0 = 25$', 'Interpreter','latex')

set(gca,'fontsize',30)
legend('Interpreter','latex')
hold off




figure(11)
clf
hold on
% 201 to 400 gives the initial intolerance of 50
for i =201:400
    % Assign a color based on the unique conformity value
    % and assign a legend label based on conformity
    for j = 1:RepDistLength
        if RepDist(runind(i,2)) == RepDistUnique(j)
            colors = cmap(j,:);
            legendlabel = ['$\lambda =$ ',num2str(RepDistUnique(j))];
        end
    end

    % Use the run indicies to get the appropriate timestep and average
    % intolerance values

    % We plot every curve but only show a subset of conformity values to
    % the legend
    if mod(i,20) ==0
        plot(timestep(runind(i,1):runind(i,2)), PerSim(runind(i,1):runind(i,2)),'-','Color',colors, 'DisplayName', legendlabel)
    else
        plot(timestep(runind(i,1):runind(i,2)), PerSim(runind(i,1):runind(i,2)),'-','Color',colors,'HandleVisibility','off')

    end
end
% Line to indicate 100 timesteps
plot([100, 100],[0 100],'k:','LineWidth',3,'HandleVisibility','off')
xlabel('Time Step', 'Interpreter','latex')
ylabel('Percent Similar', 'Interpreter','latex')
title('Average Intolerance - Initial Intolerance $I_0 = 50$', 'Interpreter','latex')
title('Percent Similar - Initial Intolerance $I_0 = 50$', 'Interpreter','latex')

set(gca,'fontsize',30)
legend('Interpreter','latex')

hold off

figure(12)
clf
hold on
% 401 to 600 gives the initial intolerance of 75
for i =401:600
    for j = 1:RepDistLength
        if RepDist(runind(i,2)) == RepDistUnique(j)
            colors = cmap(j,:);
            legendlabel = ['$\lambda =$ ',num2str(RepDistUnique(j))];
        end
    end


    if mod(i,20) ==0
        plot(timestep(runind(i,1):runind(i,2)), PerSim(runind(i,1):runind(i,2)),'-','Color',colors, 'DisplayName', legendlabel)
    else
        plot(timestep(runind(i,1):runind(i,2)), PerSim(runind(i,1):runind(i,2)),'-','Color',colors,'HandleVisibility','off')

    end
end
plot([100, 100],[0 100],'k:','LineWidth',3,'HandleVisibility','off')
xlabel('Time Step', 'Interpreter','latex')
ylabel('Percent Similar', 'Interpreter','latex')
title('Average Intolerance - Initial Intolerance $I_0 = 75$', 'Interpreter','latex')
title('Percent Similar - Initial Intolerance $I_0 = 75$', 'Interpreter','latex')
set(gca,'fontsize',30)
legend('Interpreter','latex')

hold off



% Histogram of Percent-Similar Standard Deviations 
% (after 200 timesteps since we technically start at timestep 100)
% This is to get the "near equilibrium" distribution
figure(4)
clf
h = histogram(PerSimRunsstd(100:end,:),100);
hold on
plot([1 1],[0 max(h.Values)*1.1],'r:','LineWidth',3)
hold off
ylabel('Counts', 'Interpreter','latex')
xlabel('Percent Similar Standard Deviation', 'Interpreter','latex')
title('100 Time Step Standard Deviation')
ylim([0 max(h.Values)*1.1])
set(gca,'fontsize',30)


temp1 = nnz(PerSimRunsstd(100:end,:) < 1);
temp2  = size(PerSimRunsstd(100:end,:));
temp3 = temp2(1)*temp2(2);
perless = temp1/temp3;
fprintf("The percentage of standard deviation values less than 1 is %f \n", perless)


% Histogram of Average Intolerance Standard Deviations 
% (after 200 timesteps since we technically start at timestep 100)
% This is to get the "near equilibrium" distribution
figure(5)
clf
h2 = histogram(WantFinalRunsstd(100:end,:),100);
hold on
plot([0.5 0.5],[0 max(h2.Values)*1.1],'r:','LineWidth',3)
hold off
ylabel('Counts', 'Interpreter','latex')
xlabel('Average Intolerance Standard Deviation', 'Interpreter','latex')
title('100 Time Step Standard Deviation')
ylim([0 max(h2.Values)*1.1])
set(gca,'fontsize',30)

temp4 = nnz(WantFinalRunsstd(100:end,:) < 0.5);
temp5  = size(WantFinalRunsstd(100:end,:));
temp6 = temp5(1)*temp5(2);
wantless = temp4/temp6;
fprintf("The percentage of standard deviation values less than 0.5 is %f \n", perless)



% Evolution of Average Intolerance Standard Deviations (Zoomed In)
figure(6)
clf
plot(WantFinalRunsstd,'Color','b','LineStyle','--')
hold on
plot([100 100], [0 1],'r:','LineWidth',3)
hold off
xlabel('Time Step', 'Interpreter','latex')
ylabel('Standard Deviation', 'Interpreter','latex')
title('100 Step Standard Deviation Intolerance', 'Interpreter','latex')
set(gca,'fontsize',30)
ylim([0 0.5])
xlim([1 901])

% Evolution of Average Intolerance Standard Deviations 
figure(7)
clf
plot(WantFinalRunsstd,'Color','b','LineStyle','--')
hold on
plot([100 100], [0 max(max(WantFinalRunsstd))*1.1],'r:','LineWidth',3)
hold off
xlabel('Time Step', 'Interpreter','latex')
ylabel('Standard Deviation', 'Interpreter','latex')
title('100 Step Standard Deviation Intolerance', 'Interpreter','latex')
set(gca,'fontsize',30)
xlim([1 901])
ylim([0 max(max(WantFinalRunsstd))*1.1])



% Evolution of Percent-Similar Standard Deviations (Zoomed In)
figure(8)
clf
plot(PerSimRunsstd,'Color','b','LineStyle','--')
hold on
plot([100 100], [0 1.5],'r:','LineWidth',3)
hold off
xlabel('Time Steps After 100', 'Interpreter','latex')
ylabel('Standard Deviation', 'Interpreter','latex')
title('100 Step Standard Deviation Percent Similar', 'Interpreter','latex')
set(gca,'fontsize',30)
ylim([0 1.5])
xlim([1 901])

% Evolution of Percent-Similar Standard Deviations
figure(9)
clf
plot(PerSimRunsstd,'Color','b','LineStyle','--')
hold on
plot([100 100], [0 max(max(PerSimRunsstd))*1.1],'r:','LineWidth',3)
hold off
xlabel('Time Steps After 100', 'Interpreter','latex')
ylabel('Standard Deviation', 'Interpreter','latex')
title('100 Step Standard Deviation Percent Similar', 'Interpreter','latex')
set(gca,'fontsize',30)
xlim([1 901])
ylim([0 max(max(PerSimRunsstd))*1.1])




% Histogram of Average Intolerance Standard Deviations 
% (100 to 200 timesteps)
% This is to get the "pre equilibrium" distribution
figure(13)
clf
h3 = histogram(WantFinalRunsstd(1:100,:),100);
hold on
%h4 = histogram(WantFinalRunsstd(101:end,:),100);
plot([0.5 0.5],[0, max(h3.Values)*1.1],'r:','LineWidth',3)
hold off
ylabel('Counts', 'Interpreter','latex')
xlabel('Average Intolerance Standard Deviation', 'Interpreter','latex')
ylim([0 max(h3.Values)*1.1])
set(gca,'fontsize',30)


temp7 = nnz(WantFinalRunsstd(1:100,:) < 0.5);
temp8  = size(WantFinalRunsstd(1:100,:));
temp9 = temp8(1)*temp8(2);
wantless2 = temp7/temp9;
fprintf("The percentage of standard deviation values less than 0.5 is %f \n", wantless2)


% Histogram of Percent-Similar Standard Deviations 
% (100 to 200 timesteps)
% This is to get the "pre equilibrium" distribution
figure(14)
clf
h4 = histogram(PerSimRunsstd(1:100,:),100);
hold on
plot([1 1],[0 max(h4.Values)*1.1],'r:','LineWidth',3)
hold off
ylabel('Counts', 'Interpreter','latex')
xlabel('Percent Similar Standard Deviation', 'Interpreter','latex')
title('100 Time Step Standard Deviation')
ylim([0 max(h4.Values)*1.1])
set(gca,'fontsize',30)

temp10 = nnz(WantFinalRunsstd(1:100,:) < 0.5);
temp11  = size(WantFinalRunsstd(1:100,:));
temp12 = temp11(1)*temp11(2);
perless2 = temp10/temp12;
fprintf("The percentage of standard deviation values less than 1 is %f \n", perless2)


% first1 = zeros([600,1]);
% for i = 1:600
%     first1(i) = find(temp12(:,i),1,'first');
% 
% end
% 
% repdistplot = resize(repmat(RepDistUnique,30),[600,1]);
% 
% figure(15)
% clf
% histogram(first1,100)


