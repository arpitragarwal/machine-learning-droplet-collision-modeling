clear; clc; close all; format compact;

[estrade, poo, achuth, brazier, qian] = get_experimental_csv_data();
%%
%%%%% attribute names
% (1) Weber number
% (2) Impact parameter
% (3) Delta
% (4) Gas Pressure

label_names = [{'coalescence'}, {'stretching'}, {'reflexive'}];
label_values = [1, 3, 4];
delta_names = [{'delta1'}, {'delta0p75'}, {'delta0p5'}];
delta_values = [1, 0.75, 0.5];


inst_idx = 0;
%% POO
for k = 1:length(delta_names)
    for j = 1:length(label_values)
        for i = 1:length(poo.(delta_names{k}).(label_names{j}).x)
            inst_idx = inst_idx + 1;
            feature_vals(inst_idx, 1) = poo.(delta_names{k}).(label_names{j}).x(i);
            feature_vals(inst_idx, 2) = poo.(delta_names{k}).(label_names{j}).y(i);
            feature_vals(inst_idx, 3) = delta_values(k);
            label_vals(inst_idx, :)   = label_values(j);
        end
    end
end

%% QIAN & LAW
label_names = [{'coalescence'}, {'bounce'}, {'separation'}];
label_values = [1, 2, 3.5];
liquid_names = [{'water'}, {'tetradecane'}];
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
                label_vals(inst_idx, :)   = label_values(l);
                end
            end
        end
    end
end

