function [estrade, poo, achuth, brazier, qian ] = get_experimental_csv_data()
directory_path = '../reference data/';

%%
filename = 'estrade_et_al_1999_IJHFF_fig4.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A estrade_delta1_C3_x
A = A_tmp(2:end,:);

tmp = A(:,1);
estrade.delta1.C3.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,2);
estrade.delta1.C3.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,3);
estrade.delta1.C2.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,4);
estrade.delta1.C2.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,5);
estrade.delta1.coalescence.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,6);
estrade.delta1.coalescence.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,7);
estrade.delta1.bouncing.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,8);
estrade.delta1.bouncing.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 9);
estrade.delta1.separation0.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 10);
estrade.delta1.separation0.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 11);
estrade.delta1.separation1.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 12);
estrade.delta1.separation1.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 13);
estrade.delta1.separation2.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 14);
estrade.delta1.separation2.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 15);
estrade.delta1.separation3.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 16);
estrade.delta1.separation3.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 17);
estrade.delta1.separation4.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 18);
estrade.delta1.separation4.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 19);
estrade.delta1.separation5.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 20);
estrade.delta1.separation5.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 21);
estrade.delta1.separation6.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 22);
estrade.delta1.separation6.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 23);
estrade.delta1.separation7.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 24);
estrade.delta1.separation7.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 25);
estrade.delta1.separation8.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 26);
estrade.delta1.separation8.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 27);
estrade.delta1.separation9.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 28);
estrade.delta1.separation9.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 29);
estrade.delta1.C1.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 30);
estrade.delta1.C1.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));

estrade.delta1.separationAll.x = [estrade.delta1.separation0.x', estrade.delta1.separation1.x', ...
    estrade.delta1.separation2.x', estrade.delta1.separation3.x', ...
    estrade.delta1.separation4.x', estrade.delta1.separation5.x', ...
    estrade.delta1.separation6.x', estrade.delta1.separation7.x', ...
    estrade.delta1.separation8.x', estrade.delta1.separation9.x' ...
    ];
estrade.delta1.separationAll.y = [estrade.delta1.separation0.y', estrade.delta1.separation1.y', ...
    estrade.delta1.separation2.y', estrade.delta1.separation3.y', ...
    estrade.delta1.separation4.y', estrade.delta1.separation5.y', ...
    estrade.delta1.separation6.y', estrade.delta1.separation7.y', ...
    estrade.delta1.separation8.y', estrade.delta1.separation9.y' ...
    ];



% Estrade Fig 5
%ref_path = 'C:\Users\aagarwal\intern-work\reference data\estrade_et_al_1999_IJHFF_fig5.csv';
filename = 'estrade_et_al_1999_IJHFF_fig5.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A estrade_delta1_C3_x
A = A_tmp(2:end,:);

tmp = A(:, 15);
estrade.delta0p5.C3.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 16);
estrade.delta0p5.C3.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 17);
estrade.delta0p5.C2.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 18);
estrade.delta0p5.C2.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,1);
estrade.delta0p5.coalescence.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,2);
estrade.delta0p5.coalescence.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,3);
estrade.delta0p5.bouncing.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:,4);
estrade.delta0p5.bouncing.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
estrade.delta0p5.separation0.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
estrade.delta0p5.separation0.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 7);
estrade.delta0p5.separation1.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 8);
estrade.delta0p5.separation1.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 9);
estrade.delta0p5.separation2.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 10);
estrade.delta0p5.separation2.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 11);
estrade.delta0p5.separation3.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 12);
estrade.delta0p5.separation3.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 13);
estrade.delta0p5.separation4.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 14);
estrade.delta0p5.separation4.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 19);
estrade.delta0p5.C1.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 20);
estrade.delta0p5.C1.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));

estrade.delta0p5.separationAll.x = [estrade.delta1.separation0.x', estrade.delta1.separation1.x', ...
    estrade.delta1.separation2.x', estrade.delta1.separation3.x', ...
    estrade.delta1.separation4.x',...
    ];
estrade.delta0p5.separationAll.y = [estrade.delta1.separation0.y', estrade.delta1.separation1.y', ...
    estrade.delta1.separation2.y', estrade.delta1.separation3.y', ...
    estrade.delta1.separation4.y',...
    ];

%%
% Ashgriz Poo 1990 Figure2
filename = 'azhgriz_poo_1990_JFM_fig2.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);

tmp = A(:, 7);
poo.delta1.C3.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 8);
poo.delta1.C3.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 9);
poo.delta1.C2.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 10);
poo.delta1.C2.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 1);
poo.delta1.coalescence.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
poo.delta1.coalescence.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
poo.delta1.stretching.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
poo.delta1.stretching.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
poo.delta1.reflexive.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
poo.delta1.reflexive.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));


% Ashgriz Poo 1990 Figure18
filename = 'azhgriz_poo_1990_JFM_fig18.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);

tmp = A(:, 7);
poo.delta0p75.C3.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 8);
poo.delta0p75.C3.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 9);
poo.delta0p75.C2.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 10);
poo.delta0p75.C2.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 1);
poo.delta0p75.coalescence.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
poo.delta0p75.coalescence.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
poo.delta0p75.stretching.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
poo.delta0p75.stretching.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
poo.delta0p75.reflexive.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
poo.delta0p75.reflexive.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));



% Ashgriz Poo 1990 Figure19
filename = 'azhgriz_poo_1990_JFM_fig19.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);

tmp = A(:, 7);
poo.delta0p5.C3.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 8);
poo.delta0p5.C3.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 9);
poo.delta0p5.C2.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 10);
poo.delta0p5.C2.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 1);
poo.delta0p5.coalescence.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
poo.delta0p5.coalescence.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
poo.delta0p5.stretching.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
poo.delta0p5.stretching.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
poo.delta0p5.reflexive.x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
poo.delta0p5.reflexive.y = cellfun(@str2num, tmp(~strcmp(tmp, '')));



%%
% Reference curve from Achuth, Reitz, IJMF 2007
filename = 'achuth2007_IJMF_fig6b.csv';
ref_path = [directory_path, filename];
fid = fopen(ref_path);
A = textscan(fid,'%f, %f, %f, %f, %f, %f', 'headerlines', 2);
fclose(fid);

achuth.bounce.x     = A{:, 1};
achuth.bounce.y     = A{:, 2};
achuth.stretching.x = A{:, 3};
achuth.stretching.y = A{:, 4};
achuth.reflexive.x  = A{:, 5};
achuth.reflexive.y  = A{:, 6};

filename = 'achuth2007_IJMF_fig10.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
achuth.delta1.sat1_x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
achuth.delta1.sat1_y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
achuth.delta1.sat3_x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
achuth.delta1.sat3_y = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
achuth.delta1.sat5_x = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
achuth.delta1.sat5_y = cellfun(@str2num, tmp(~strcmp(tmp, '')));

%%
filename = 'brazier-smith_1972_PRSL_fig7.csv';
ref_path = [directory_path, filename];
fid = fopen(ref_path);
A = textscan(fid,'%f, %f', 'headerlines', 2);
fclose(fid);
brazier.C3.x     = A{:, 1};
brazier.C3.y     = A{:, 2};
brazier.C3.y     = brazier.C3.y.^0.5;




%%
%%%% QIAN LAW DATA BEGINS HERE
outcome_names = [{'coalescence'},{'bounce'},{'separation'}];

filename = '1997_qian_law_fig6a.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.water.nitrogen.one_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.water.nitrogen.one_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.water.nitrogen.one_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.water.nitrogen.one_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.water.nitrogen.one_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.water.nitrogen.one_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig6b.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.water.nitrogen.two_p_seven_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.water.nitrogen.two_p_seven_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.water.nitrogen.two_p_seven_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.water.nitrogen.two_p_seven_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.water.nitrogen.two_p_seven_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.water.nitrogen.two_p_seven_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig6c.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.water.nitrogen.eight_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.water.nitrogen.eight_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.water.nitrogen.eight_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.water.nitrogen.eight_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.water.nitrogen.eight_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.water.nitrogen.eight_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

for i=1:length(outcome_names)
    qian.water.nitrogen.all.(outcome_names{i}).x = [...,
        qian.water.nitrogen.one_atm.(outcome_names{i}).x',...
        qian.water.nitrogen.two_p_seven_atm.(outcome_names{i}).x',...
        qian.water.nitrogen.eight_atm.(outcome_names{i}).x', ...
        ];
    qian.water.nitrogen.all.(outcome_names{i}).y = [...,
        qian.water.nitrogen.one_atm.(outcome_names{i}).y',...
        qian.water.nitrogen.two_p_seven_atm.(outcome_names{i}).y',...
        qian.water.nitrogen.eight_atm.(outcome_names{i}).y', ...
        ];
end

filename = '1997_qian_law_fig7a.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.tetradecane.nitrogen.zero_p_six_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.tetradecane.nitrogen.zero_p_six_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.tetradecane.nitrogen.zero_p_six_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.tetradecane.nitrogen.zero_p_six_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.tetradecane.nitrogen.zero_p_six_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.tetradecane.nitrogen.zero_p_six_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig7b.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.tetradecane.nitrogen.one_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.tetradecane.nitrogen.one_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.tetradecane.nitrogen.one_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.tetradecane.nitrogen.one_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.tetradecane.nitrogen.one_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.tetradecane.nitrogen.one_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig7c.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.tetradecane.nitrogen.two_p_four_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.tetradecane.nitrogen.two_p_four_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.tetradecane.nitrogen.two_p_four_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.tetradecane.nitrogen.two_p_four_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.tetradecane.nitrogen.two_p_four_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.tetradecane.nitrogen.two_p_four_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

for i=1:length(outcome_names)
    qian.tetradecane.nitrogen.all.(outcome_names{i}).x = [...,
        qian.tetradecane.nitrogen.zero_p_six_atm.(outcome_names{i}).x',...
        qian.tetradecane.nitrogen.one_atm.(outcome_names{i}).x',...
        qian.tetradecane.nitrogen.two_p_four_atm.(outcome_names{i}).x', ...
        ];
    qian.tetradecane.nitrogen.all.(outcome_names{i}).y = [...,
        qian.tetradecane.nitrogen.zero_p_six_atm.(outcome_names{i}).y',...
        qian.tetradecane.nitrogen.one_atm.(outcome_names{i}).y',...
        qian.tetradecane.nitrogen.two_p_four_atm.(outcome_names{i}).y', ...
        ];
end

filename = '1997_qian_law_fig8a.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.water.helium.four_p_four_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.water.helium.four_p_four_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.water.helium.four_p_four_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.water.helium.four_p_four_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.water.helium.four_p_four_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.water.helium.four_p_four_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig8b.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.water.helium.seven_p_five_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.water.helium.seven_p_five_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.water.helium.seven_p_five_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.water.helium.seven_p_five_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.water.helium.seven_p_five_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.water.helium.seven_p_five_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig8c.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.water.helium.eleven_p_seven_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.water.helium.eleven_p_seven_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.water.helium.eleven_p_seven_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.water.helium.eleven_p_seven_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.water.helium.eleven_p_seven_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.water.helium.eleven_p_seven_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

for i=1:length(outcome_names)
    qian.water.helium.all.(outcome_names{i}).x = [...,
        qian.water.helium.four_p_four_atm.(outcome_names{i}).x',...
        qian.water.helium.seven_p_five_atm.(outcome_names{i}).x',...
        qian.water.helium.eleven_p_seven_atm.(outcome_names{i}).x', ...
        ];
    
    qian.water.helium.all.(outcome_names{i}).y = [...,
        qian.water.helium.four_p_four_atm.(outcome_names{i}).y',...
        qian.water.helium.seven_p_five_atm.(outcome_names{i}).y',...
        qian.water.helium.eleven_p_seven_atm.(outcome_names{i}).y', ...
        ];
end


filename = '1997_qian_law_fig9a.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.tetradecane.helium.zero_p_seven_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.tetradecane.helium.zero_p_seven_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.tetradecane.helium.zero_p_seven_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.tetradecane.helium.zero_p_seven_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.tetradecane.helium.zero_p_seven_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.tetradecane.helium.zero_p_seven_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig9b.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.tetradecane.helium.two_p_four_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.tetradecane.helium.two_p_four_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.tetradecane.helium.two_p_four_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.tetradecane.helium.two_p_four_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.tetradecane.helium.two_p_four_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.tetradecane.helium.two_p_four_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

filename = '1997_qian_law_fig9c.csv';
ref_path = [directory_path, filename];
T = readtable(ref_path);
A_tmp = table2cell(T);
clearvars A
A = A_tmp(2:end,:);
tmp = A(:, 1);
qian.tetradecane.helium.four_p_four_atm.coalescence.x   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 2);
qian.tetradecane.helium.four_p_four_atm.coalescence.y   = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 3);
qian.tetradecane.helium.four_p_four_atm.bounce.x        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 4);
qian.tetradecane.helium.four_p_four_atm.bounce.y        = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 5);
qian.tetradecane.helium.four_p_four_atm.separation.x    = cellfun(@str2num, tmp(~strcmp(tmp, '')));
tmp = A(:, 6);
qian.tetradecane.helium.four_p_four_atm.separation.y    = cellfun(@str2num, tmp(~strcmp(tmp, '')));

for i=1:length(outcome_names)
    qian.tetradecane.helium.all.(outcome_names{i}).x = [...,
        qian.tetradecane.helium.zero_p_seven_atm.(outcome_names{i}).x',...
        qian.tetradecane.helium.two_p_four_atm.(outcome_names{i}).x',...
        qian.tetradecane.helium.four_p_four_atm.(outcome_names{i}).x', ...
        ];
    
    qian.tetradecane.helium.all.(outcome_names{i}).y = [...,
        qian.tetradecane.helium.zero_p_seven_atm.(outcome_names{i}).y',...
        qian.tetradecane.helium.two_p_four_atm.(outcome_names{i}).y',...
        qian.tetradecane.helium.four_p_four_atm.(outcome_names{i}).y', ...
        ];
end

for i=1:length(outcome_names)
    qian.tetradecane.all.(outcome_names{i}).x  = [qian.tetradecane.nitrogen.all.(outcome_names{i}).x, qian.tetradecane.helium.all.(outcome_names{i}).x];
    qian.tetradecane.all.(outcome_names{i}).y  = [qian.tetradecane.nitrogen.all.(outcome_names{i}).y, qian.tetradecane.helium.all.(outcome_names{i}).y];
    qian.water.all.(outcome_names{i}).x        = [qian.water.nitrogen.all.(outcome_names{i}).x,       qian.water.helium.all.(outcome_names{i}).x];
    qian.water.all.(outcome_names{i}).y        = [qian.water.nitrogen.all.(outcome_names{i}).y,       qian.water.helium.all.(outcome_names{i}).y];

    qian.all.(outcome_names{i}).x   = [qian.tetradecane.all.(outcome_names{i}).x, qian.water.all.(outcome_names{i}).x];
    qian.all.(outcome_names{i}).y   = [qian.tetradecane.all.(outcome_names{i}).y, qian.water.all.(outcome_names{i}).y];
end

end

