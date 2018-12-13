clear; clc; close all; format compact;

[estrade, poo, achuth, brazier, qian, kuschel] = get_experimental_csv_data();

%%%%% attribute names
% (1) Weber number
% (2) Impact parameter
% (3) Delta
% (4) Gas Pressure
% (5) Liquid viscosity
% (6) Gas viscosity
% (7) Surface tension coeff
b_thresh = 0.25;
inst_idx = 0;

%% ESTRADE
delta_names = [{'delta1'}, {'delta0p5'}];
delta_values = [1, 0.5];
label_names = [{'coalescence'}, {'bouncing'}, {'separationAll'}];
label_values = [1, 2, 3.5];
ethanol_visc = 0.001095;
for k = 1:length(delta_names)
    for j = 1:length(label_values)
        for i = 1:length(estrade.(delta_names{k}).(label_names{j}).x)
            inst_idx = inst_idx + 1;
            feature_vals(inst_idx, 1) = estrade.(delta_names{k}).(label_names{j}).x(i);
            feature_vals(inst_idx, 2) = estrade.(delta_names{k}).(label_names{j}).y(i);
            feature_vals(inst_idx, 3) = delta_values(k);
            feature_vals(inst_idx, 4) = 1;
            feature_vals(inst_idx, 5) = ethanol_visc;
            label_vals(inst_idx, :)   = label_values(j);
            if label_values(j) == 3.5
                if feature_vals(inst_idx, 2) > b_thresh
                    label_vals(inst_idx, :) = 3;
                else
                    label_vals(inst_idx, :) = 4;
                end
            end
        end
    end
end

%% POO

label_names = [{'coalescence'}, {'stretching'}, {'reflexive'}];
label_values = [1, 3, 4];
delta_names = [{'delta1'}, {'delta0p75'}, {'delta0p5'}];
delta_values = [1, 0.75, 0.5];

water_visc = 0.0008900;     % https://www.engineeringtoolbox.com/water-dynamic-kinematic-viscosity-d_596.html
for k = 1:length(delta_names)
    for j = 1:length(label_values)
        for i = 1:length(poo.(delta_names{k}).(label_names{j}).x)
            inst_idx = inst_idx + 1;
            feature_vals(inst_idx, 1) = poo.(delta_names{k}).(label_names{j}).x(i);
            feature_vals(inst_idx, 2) = poo.(delta_names{k}).(label_names{j}).y(i);
            feature_vals(inst_idx, 3) = delta_values(k);
            feature_vals(inst_idx, 4) = 1; % assuming that expt. was done in open chamber
            feature_vals(inst_idx, 5) = water_visc;
            %             feature_vals(inst_idx, 6) = -1;
            %             feature_vals(inst_idx, 7) = -1;
            label_vals(inst_idx, :)   = label_values(j);
        end
    end
end

%% QIAN & LAW
label_names = [{'coalescence'}, {'bounce'}, {'separation'}];
label_values = [1, 2, 3.5];
liquid_names = [{'water'}, {'tetradecane'}];
liquid_visc = [0.0008900,...     % https://www.engineeringtoolbox.com/water-dynamic-kinematic-viscosity-d_596.html
                2.13 * 10^(-3)]; % https://pubchem.ncbi.nlm.nih.gov/compound/Tetradecane#section=Viscosity
gas_names = [{'nitrogen'}, {'helium'}];
gas_pressure_names{1, 1} = [{'one_atm'}, {'two_p_seven_atm'}, {'eight_atm'}];
gas_pressure_names{1, 2} = [{'four_p_four_atm'}, {'seven_p_five_atm'}, {'eleven_p_seven_atm'}];
gas_pressure_names{2, 1} = [{'zero_p_six_atm'}, {'one_atm'}, {'two_p_four_atm'}];
gas_pressure_names{2, 2} = [{'zero_p_seven_atm'}, {'two_p_four_atm'}, {'four_p_four_atm'}];

gas_pressure(1, 1, :) = [1, 2.7, 8];
gas_pressure(1, 2, :) = [4.7, 7.5, 11.7];
gas_pressure(2, 1, :) = [11.7, 2.4, 4.4];
gas_pressure(2, 2, :) = [0.6, 1, 2.4];

for i = 1:length(liquid_names)
    for j = 1:length(gas_names)
        for k = 1:length(gas_pressure(i, j, :))
            for l = 1:length(label_names)
                for m = 1:length(qian.(liquid_names{i}).(gas_names{j}).(gas_pressure_names{i, j}{k}).(label_names{l}).x)
                    inst_idx = inst_idx + 1;
                    feature_vals(inst_idx, 1) = ...
                        qian.(liquid_names{i}).(gas_names{j}).(gas_pressure_names{i, j}{k}).(label_names{l}).x(m);
                    feature_vals(inst_idx, 2) = ...
                        qian.(liquid_names{i}).(gas_names{j}).(gas_pressure_names{i, j}{k}).(label_names{l}).y(m);
                    feature_vals(inst_idx, 3) = 1;
                    feature_vals(inst_idx, 4) = gas_pressure(i, j, k);
                    feature_vals(inst_idx, 5) = liquid_visc(i);
                    label_vals(inst_idx, :)   = label_values(l);
                    if label_values(l) == 3.5
                        if feature_vals(inst_idx, 2) > b_thresh
                            label_vals(inst_idx, :) = 3;
                        else
                            label_vals(inst_idx, :) = 4;
                        end
                    end
                end
            end
        end
    end
end

%%
label_names = [{'coalescence'}, {'bouncing'}, {'stretching'}, {'reflexive'}];
label_values = [1, 2, 3, 4];
liq_names = kuschel.liq_names;
liq_visc  = kuschel.liq_visc;

for k = 1:length(liq_names)
    for j = 1:length(label_values)
        for i = 1:length(kuschel.(liq_names{k}).(label_names{j}).y)
            inst_idx = inst_idx + 1;
            feature_vals(inst_idx, 1) = kuschel.(liq_names{k}).(label_names{j}).x(i);
            feature_vals(inst_idx, 2) = kuschel.(liq_names{k}).(label_names{j}).y(i);
            feature_vals(inst_idx, 3) = 1;
            feature_vals(inst_idx, 4) = 1; % assuming that expt. was done in open chamber
            feature_vals(inst_idx, 5) = liq_visc(k);
            %             feature_vals(inst_idx, 6) = -1;
            %             feature_vals(inst_idx, 7) = -1;
            label_vals(inst_idx, :)   = label_values(j);
        end
    end
end


%% 
feature_vals(feature_vals(:, 2) < 1e-6, 2) = 1e-6;
feature_vals(feature_vals(:, 1) < 1e-6, 1) = 1e-6;

data_for_csv = [feature_vals, label_vals];
csv_filename = '../../reference data/collision_data_compiled.csv';
csvwrite(csv_filename, data_for_csv)


%%
close all
kernel_val = 'on';
save_figs = true;

figure()
scatterhist(feature_vals(:,1), feature_vals(:,2), 'Group', label_vals, 'Kernel', kernel_val, 'Marker','.','MarkerSize',10)
legend('coalescence', 'bouncing', 'stretching', 'reflexive')
xlabel('We')
ylabel('B')
% xlim([0 250])
% ylim([0 1])
grid on
if save_figs
    saveas(gcf, '../../figures/data_scatterhist.png')
end

figure()
scatterhist(feature_vals(:,1), feature_vals(:,3), 'Group', label_vals, 'Kernel', kernel_val, 'Marker','.','MarkerSize',10)
legend('coalescence', 'bouncing', 'stretching', 'reflexive')
xlabel('We')
ylabel('\Delta')
% xlim([0 250])
% ylim([0 1])
grid on
if save_figs
    saveas(gcf, '../../figures/data_scatterhist1.png')
end

figure()
scatterhist(feature_vals(:,1), feature_vals(:,4), 'Group', label_vals, 'Kernel', kernel_val, 'Marker','.','MarkerSize',10)
legend('coalescence', 'bouncing', 'stretching', 'reflexive')
xlabel('We')
ylabel('P')
% xlim([0 250])
% ylim([0 1])
grid on
if save_figs
    saveas(gcf, '../../figures/data_scatterhist2.png')
end

figure()
scatterhist(feature_vals(:,1), feature_vals(:,5), 'Group', label_vals, 'Kernel', kernel_val, 'Marker','.','MarkerSize',10)
legend('coalescence', 'bouncing', 'stretching', 'reflexive')
xlabel('We')
ylabel('\mu')
% xlim([0 250])
% ylim([0 1])
grid on
if save_figs
    saveas(gcf, '../../figures/data_scatterhist3.png')
end

figure()
scatterhist(feature_vals(:,5), feature_vals(:,2), 'Group', label_vals, 'Kernel', kernel_val, 'Marker','.','MarkerSize',10)
legend('coalescence', 'bouncing', 'stretching', 'reflexive')
ylabel('B')
xlabel('\mu')
% xlim([0 250])
% ylim([0 1])
grid on
if save_figs
    saveas(gcf, '../../figures/data_scatterhist4.png')
end