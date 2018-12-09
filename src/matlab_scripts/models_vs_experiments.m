clear; clc; close all;

save_figs = false;
We_DLims = 250;
resolution = 1000;
We_D_analytical = linspace(0, max(We_DLims), resolution);
B_analytical  = linspace(0, 1 , resolution);
delta = 1;
[We_grid, B_grid] = meshgrid(We_D_analytical, B_analytical);

[C1_x, C2_x, C3_y] = get_model_curves(We_D_analytical, B_analytical, delta);
[estrade, poo, achuth, brazier, qian] = get_experimental_csv_data();

% %[outcome_matrix] = get_populated_outcome_mat(We_D_analytical, B_analytical, delta);
% 
% %%
% figure()
% contourf(We_grid, B_grid, outcome_matrix')
% colormap(parula(4));
% %c = colorbar;
% %c.Ticks = [1, 2, 3, 4];
% %c.TickLabels = {'Bounce','Coal.','Reflex.','Stretch'};
% text(150, 0.8, '\uparrow C_1','FontSize', 25)
% text(140, 0.3, '\downarrow C_2','FontSize', 25)
% text(30, 0.35, '\leftarrow C_3','FontSize', 25)
% xlabel('We_D')
% ylabel('B')
% if save_figs
%     saveas(gcf, '../../figures/regimes.png')
% end
%% Model Curves
figure()
hold on
an_1 = plot(C1_x, B_analytical, 'b', 'LineWidth', 2);
an_2 = plot(We_D_analytical, C3_y, 'b', 'LineWidth', 2);
an_3 = plot(C2_x, B_analytical, 'b', 'LineWidth', 2);

ach_1 = plot(achuth.bounce.x, achuth.bounce.y, 'k--', 'LineWidth', 3);
ach_2 = plot(achuth.stretching.x, achuth.stretching.y, 'k--', 'LineWidth', 3);
ach_3 = plot(achuth.reflexive.x, achuth.reflexive.y, 'k--', 'LineWidth', 3);

br_3 = plot(brazier.C3.x, brazier.C3.y, 'r--', 'LineWidth', 3);

est_1 = plot(estrade.delta1.C1.x, estrade.delta1.C1.y, 'k-', 'LineWidth', 3);
est_2 = plot(estrade.delta1.C2.x, estrade.delta1.C2.y, 'k-', 'LineWidth', 3);
est_3 = plot(estrade.delta1.C3.x, estrade.delta1.C3.y, 'k-', 'LineWidth', 3);

legend([an_1, ach_1, br_3, est_1], ...
    'Munnannur, Reitz model', 'Munnannur, Reitz Fig.6', 'Brazier et al.', 'Estrade et al.', ...
    'Location', 'East')

xlim([0 We_DLims])
ylim([0 1])
box on
grid on
xlabel('$We_D$', 'Interpreter', 'Latex')
ylabel('$B$', 'Interpreter', 'Latex')
title('$\Delta = 1$', 'Interpreter', 'Latex')
if save_figs
    saveas(gcf, '../../figures/model_compilation.png')
end
%%
close all; clc;
[error_struct] = get_errors_wrt_all_datasets(We_D_analytical, B_analytical);
outcome_names_qian    = [{'coalescence'},{'bounce'},{'separation'}];
outcome_names_estrade = [{'coalescence'},{'bouncing'},{'separationAll'}];
outcome_names_poo     = [{'coalescence'},{'stretching'},{'reflexive'}];
marker_prop = [{'o'},{'s'},{'d'}];


for i=1:3
    figure()
    hold on
    scatter(qian.all.(outcome_names_qian{i}).x,          qian.all.(outcome_names_qian{i}).y,          40, ['r', marker_prop{i}], 'filled')
    scatter(estrade.delta1.(outcome_names_estrade{i}).x, estrade.delta1.(outcome_names_estrade{i}).y, 40, ['g', marker_prop{i}], 'filled')
    if i==3
        scatter(poo.delta1.(outcome_names_poo{2}).x, poo.delta1.(outcome_names_poo{2}).y, 40, ['b', marker_prop{i}], 'filled')
        scatter(poo.delta1.(outcome_names_poo{3}).x, poo.delta1.(outcome_names_poo{3}).y, 40, ['b', marker_prop{i}], 'filled')
    end
    an_1 = plot(C1_x, B_analytical,     'k', 'LineWidth', 1);
    an_2 = plot(We_D_analytical, C3_y,  'k', 'LineWidth', 1);
    an_3 = plot(C2_x, B_analytical,     'k', 'LineWidth', 1);
    xlim([0 We_DLims])
    ylim([0 1])
end

%%
close all; clc;

figure()
hold on
marker_color = [{'g'},{'r'},{'b'}];
for i=1:3
    scatter(qian.all.(outcome_names_qian{i}).x,          qian.all.(outcome_names_qian{i}).y,          40, [ marker_color{i}], 'filled')
end
an_1 = plot(C1_x, B_analytical,     'k', 'LineWidth', 1);
an_2 = plot(We_D_analytical, C3_y,  'k', 'LineWidth', 1);
an_3 = plot(C2_x, B_analytical,     'k', 'LineWidth', 1);
xlim([0 We_DLims])
ylim([0 1])
box on
grid on
xlabel('$We_D$', 'Interpreter', 'Latex')
ylabel('$B$', 'Interpreter', 'Latex')
title('$\Delta = 1$', 'Interpreter', 'Latex')
legend(outcome_names_qian)
if save_figs
    saveas(gcf, '../../figures/qian_data.png')
end

figure()
hold on
marker_color = [{'g'},{'r'},{'b'}];
for i=1:3
    scatter(estrade.delta1.(outcome_names_estrade{i}).x, estrade.delta1.(outcome_names_estrade{i}).y, 40, [marker_color{i}], 'filled')
end
an_1 = plot(C1_x, B_analytical,     'k', 'LineWidth', 1);
an_2 = plot(We_D_analytical, C3_y,  'k', 'LineWidth', 1);
an_3 = plot(C2_x, B_analytical,     'k', 'LineWidth', 1);
xlim([0 We_DLims])
ylim([0 1])
box on
grid on
xlabel('$We_D$', 'Interpreter', 'Latex')
ylabel('$B$', 'Interpreter', 'Latex')
title('$\Delta = 1$', 'Interpreter', 'Latex')
legend(outcome_names_qian)
if save_figs
    saveas(gcf, '../../figures/estrade_data.png')
end

figure()
hold on
marker_color = [{'g'},{[0, 0.5, 1]},{[0.5, 0, 1]}];
for i=1:3
    scatter(poo.delta1.(outcome_names_poo{i}).x, poo.delta1.(outcome_names_poo{i}).y, 40, [ marker_color{i}], 'filled')
end
an_1 = plot(C1_x, B_analytical,     'k', 'LineWidth', 1);
an_2 = plot(We_D_analytical, C3_y,  'k', 'LineWidth', 1);
an_3 = plot(C2_x, B_analytical,     'k', 'LineWidth', 1);
xlim([0 We_DLims])
ylim([0 1])
box on
grid on
xlabel('$We_D$', 'Interpreter', 'Latex')
ylabel('$B$', 'Interpreter', 'Latex')
title('$\Delta = 1$', 'Interpreter', 'Latex')
legend(outcome_names_poo)
if save_figs
    saveas(gcf, '../../figures/poo_data.png')
end