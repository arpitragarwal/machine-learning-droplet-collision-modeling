function [error_struct] = get_errors_wrt_all_datasets(We_D_analytical, B_analytical)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[estrade, poo, ~, ~, qian, kuschel] = get_experimental_csv_data();

check_error_estrade = 1;
if (check_error_estrade)
    delta = 1;
    expt_x = estrade.delta1.bouncing.x;
    expt_y = estrade.delta1.bouncing.y;
    expt_outcome = 1;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.estrade.delta1.bouncing.error = error;
    error_struct.estrade.delta1.bouncing.num   = num;
    
    expt_x = estrade.delta1.coalescence.x;
    expt_y = estrade.delta1.coalescence.y;
    expt_outcome = 2;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.estrade.delta1.coalescence.error = error;
    error_struct.estrade.delta1.coalescence.num   = num;
    
    expt_x = estrade.delta1.separationAll.x;
    expt_y = estrade.delta1.separationAll.y;
    expt_outcome = [3, 4];
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.estrade.delta1.separationAll.error = error;
    error_struct.estrade.delta1.separationAll.num   = num;
    
    outcome_names = [{'coalescence'},{'bouncing'},{'separationAll'}];
    error_struct.estrade.delta1.all.error = 0;
    error_struct.estrade.delta1.all.num   = 0;
    for i = 1:length(outcome_names)
        error_struct.estrade.delta1.all.error = error_struct.estrade.delta1.all.error + ...
            error_struct.estrade.delta1.(outcome_names{i}).error;
        error_struct.estrade.delta1.all.num = error_struct.estrade.delta1.all.num + ...
            error_struct.estrade.delta1.(outcome_names{i}).num;
    end
    
    delta = 0.5;
    expt_x = estrade.delta0p5.bouncing.x;
    expt_y = estrade.delta0p5.bouncing.y;
    expt_outcome = 1;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.estrade.delta0p5.bouncing.error = error;
    error_struct.estrade.delta0p5.bouncing.num = num;
    
    expt_x = estrade.delta0p5.coalescence.x;
    expt_y = estrade.delta0p5.coalescence.y;
    expt_outcome = 2;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.estrade.delta0p5.coalescence.error = error;
    error_struct.estrade.delta0p5.coalescence.num   = num;
    
    expt_x = estrade.delta0p5.separationAll.x;
    expt_y = estrade.delta0p5.separationAll.y;
    expt_outcome = [3, 4];
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.estrade.delta0p5.separationAll.error = error;
    error_struct.estrade.delta0p5.separationAll.num   = num;
    
    error_struct.estrade.delta0p5.all.error = 0;
    error_struct.estrade.delta0p5.all.num   = 0;
    for i = 1:length(outcome_names)
        error_struct.estrade.delta0p5.all.error = error_struct.estrade.delta0p5.all.error + ...
            error_struct.estrade.delta0p5.(outcome_names{i}).error;
        error_struct.estrade.delta0p5.all.num = error_struct.estrade.delta0p5.all.num + ...
            error_struct.estrade.delta0p5.(outcome_names{i}).num;

        error_struct.estrade.all.(outcome_names{i}).error = error_struct.estrade.delta1.(outcome_names{i}).error + ...
            error_struct.estrade.delta0p5.(outcome_names{i}).error;
        error_struct.estrade.all.(outcome_names{i}).num = error_struct.estrade.delta1.(outcome_names{i}).num + ...
            error_struct.estrade.delta0p5.(outcome_names{i}).num;
    end

    error_struct.estrade.all.error = error_struct.estrade.delta0p5.all.error + ...
        error_struct.estrade.delta1.all.error;
    error_struct.estrade.all.num = error_struct.estrade.delta0p5.all.num + ...
        error_struct.estrade.delta1.all.num;
end

check_error_poo = 1;
if (check_error_poo)
    delta = 1;
    expt_x = poo.delta1.coalescence.x;
    expt_y = poo.delta1.coalescence.y;
    expt_outcome = 2;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta1.coalescence.error = error;
    error_struct.poo.delta1.coalescence.num   = num;
    
    expt_x = poo.delta1.reflexive.x;
    expt_y = poo.delta1.reflexive.y;
    expt_outcome = 3;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta1.reflexive.error = error;
    error_struct.poo.delta1.reflexive.num   = num;
    
    expt_x = poo.delta1.stretching.x;
    expt_y = poo.delta1.stretching.y;
    expt_outcome = 4;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta1.stretching.error = error;
    error_struct.poo.delta1.stretching.num   = num;
    
    delta = 0.75;
    expt_x = poo.delta0p75.coalescence.x;
    expt_y = poo.delta0p75.coalescence.y;
    expt_outcome = 2;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta0p75.coalescence.error = error;
    error_struct.poo.delta0p75.coalescence.num   = num;
    
    expt_x = poo.delta0p75.reflexive.x;
    expt_y = poo.delta0p75.reflexive.y;
    expt_outcome = 3;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta0p75.reflexive.error = error;
    error_struct.poo.delta0p75.reflexive.num   = num;
    
    expt_x = poo.delta0p75.stretching.x;
    expt_y = poo.delta0p75.stretching.y;
    expt_outcome = 4;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta0p75.stretching.error = error;
    error_struct.poo.delta0p75.stretching.num   = num;
    
    delta = 0.5;
    expt_x = poo.delta0p5.coalescence.x;
    expt_y = poo.delta0p5.coalescence.y;
    expt_outcome = 2;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta0p5.coalescence.error = error;
    error_struct.poo.delta0p5.coalescence.num   = num;
    
    expt_x = poo.delta0p5.reflexive.x;
    expt_y = poo.delta0p5.reflexive.y;
    expt_outcome = 3;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta0p5.reflexive.error = error;
    error_struct.poo.delta0p5.reflexive.num   = num;
    
    expt_x = poo.delta0p5.stretching.x;
    expt_y = poo.delta0p5.stretching.y;
    expt_outcome = 4;
    [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.poo.delta0p5.stretching.error = error;
    error_struct.poo.delta0p5.stretching.num   = num;
    
    outcome_names = [{'coalescence'},{'reflexive'},{'stretching'}];
    delta_names = [{'delta0p5'},{'delta0p75'},{'delta1'}];
    %delta_names = [{'delta0p5'},{'delta1'}];
    for j = 1:length(delta_names)
        error_struct.poo.(delta_names{j}).all.error = 0;
        error_struct.poo.(delta_names{j}).all.num   = 0;
    end

    for i = 1:length(outcome_names)
        error_struct.poo.all.(outcome_names{i}).error = 0;
        error_struct.poo.all.(outcome_names{i}).num = 0;
        for j = 1:length(delta_names)
            error_struct.poo.(delta_names{j}).all.error = error_struct.poo.(delta_names{j}).all.error + ...
                error_struct.poo.(delta_names{j}).(outcome_names{i}).error;
            error_struct.poo.(delta_names{j}).all.num = error_struct.poo.(delta_names{j}).all.num + ...
                error_struct.poo.(delta_names{j}).(outcome_names{i}).num;

            error_struct.poo.all.(outcome_names{i}).error = error_struct.poo.all.(outcome_names{i}).error + ...
                error_struct.poo.(delta_names{j}).(outcome_names{i}).error;
            error_struct.poo.all.(outcome_names{i}).num = error_struct.poo.all.(outcome_names{i}).error + ...
                error_struct.poo.(delta_names{j}).(outcome_names{i}).num;
        end
    end
    
    error_struct.poo.all.error = 0;
    error_struct.poo.all.num   = 0;
    for j = 1:length(delta_names)
        error_struct.poo.all.error = error_struct.poo.all.error + error_struct.poo.(delta_names{j}).all.error;
        error_struct.poo.all.num   = error_struct.poo.all.num   + error_struct.poo.(delta_names{j}).all.num;
    end
end

check_error_qian = 1;
if (check_error_qian)
    delta = 1;
    % Fig 6
    expt_x = qian.water.nitrogen.one_atm.coalescence.x;
    expt_y = qian.water.nitrogen.one_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.one_atm.coalescence.error = error;
    error_struct.qian.water.nitrogen.one_atm.coalescence.num   = num;
    
    expt_x = qian.water.nitrogen.one_atm.bounce.x;
    expt_y = qian.water.nitrogen.one_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.one_atm.bounce.error = error;
    error_struct.qian.water.nitrogen.one_atm.bounce.num = num;
    
    expt_x = qian.water.nitrogen.one_atm.separation.x;
    expt_y = qian.water.nitrogen.one_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.one_atm.separation.error = error;
    error_struct.qian.water.nitrogen.one_atm.separation.num   = num;
    
    expt_x = qian.water.nitrogen.two_p_seven_atm.coalescence.x;
    expt_y = qian.water.nitrogen.two_p_seven_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.two_p_seven_atm.coalescence.error = error;
    error_struct.qian.water.nitrogen.two_p_seven_atm.coalescence.num   = num;
    
    expt_x = qian.water.nitrogen.two_p_seven_atm.bounce.x;
    expt_y = qian.water.nitrogen.two_p_seven_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.two_p_seven_atm.bounce.error = error;
    error_struct.qian.water.nitrogen.two_p_seven_atm.bounce.num = num;
    
    expt_x = qian.water.nitrogen.two_p_seven_atm.separation.x;
    expt_y = qian.water.nitrogen.two_p_seven_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.two_p_seven_atm.separation.error = error;
    error_struct.qian.water.nitrogen.two_p_seven_atm.separation.num   = num;
    
    expt_x = qian.water.nitrogen.eight_atm.coalescence.x;
    expt_y = qian.water.nitrogen.eight_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.eight_atm.coalescence.error = error;
    error_struct.qian.water.nitrogen.eight_atm.coalescence.num   = num;
    
    expt_x = qian.water.nitrogen.eight_atm.bounce.x;
    expt_y = qian.water.nitrogen.eight_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.eight_atm.bounce.error = error;
    error_struct.qian.water.nitrogen.eight_atm.bounce.num = num;
    
    expt_x = qian.water.nitrogen.eight_atm.separation.x;
    expt_y = qian.water.nitrogen.eight_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.nitrogen.eight_atm.separation.error = error;
    error_struct.qian.water.nitrogen.eight_atm.separation.num   = num;
    
    % Fig 7
    expt_x = qian.tetradecane.nitrogen.zero_p_six_atm.coalescence.x;
    expt_y = qian.tetradecane.nitrogen.zero_p_six_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.zero_p_six_atm.coalescence.error = error;
    error_struct.qian.tetradecane.nitrogen.zero_p_six_atm.coalescence.num   = num;
    
    expt_x = qian.tetradecane.nitrogen.zero_p_six_atm.bounce.x;
    expt_y = qian.tetradecane.nitrogen.zero_p_six_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.zero_p_six_atm.bounce.error = error;
    error_struct.qian.tetradecane.nitrogen.zero_p_six_atm.bounce.num = num;
    
    expt_x = qian.tetradecane.nitrogen.zero_p_six_atm.separation.x;
    expt_y = qian.tetradecane.nitrogen.zero_p_six_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.zero_p_six_atm.separation.error = error;
    error_struct.qian.tetradecane.nitrogen.zero_p_six_atm.separation.num   = num;
    
    expt_x = qian.tetradecane.nitrogen.one_atm.coalescence.x;
    expt_y = qian.tetradecane.nitrogen.one_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.one_atm.coalescence.error = error;
    error_struct.qian.tetradecane.nitrogen.one_atm.coalescence.num   = num;
    
    expt_x = qian.tetradecane.nitrogen.one_atm.bounce.x;
    expt_y = qian.tetradecane.nitrogen.one_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.one_atm.bounce.error = error;
    error_struct.qian.tetradecane.nitrogen.one_atm.bounce.num = num;
    
    expt_x = qian.tetradecane.nitrogen.one_atm.separation.x;
    expt_y = qian.tetradecane.nitrogen.one_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.one_atm.separation.error = error;
    error_struct.qian.tetradecane.nitrogen.one_atm.separation.num   = num;
    
    expt_x = qian.tetradecane.nitrogen.two_p_four_atm.coalescence.x;
    expt_y = qian.tetradecane.nitrogen.two_p_four_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.two_p_four_atm.coalescence.error = error;
    error_struct.qian.tetradecane.nitrogen.two_p_four_atm.coalescence.num   = num;
    
    expt_x = qian.tetradecane.nitrogen.two_p_four_atm.bounce.x;
    expt_y = qian.tetradecane.nitrogen.two_p_four_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.two_p_four_atm.bounce.error = error;
    error_struct.qian.tetradecane.nitrogen.two_p_four_atm.bounce.num = num;
    
    expt_x = qian.tetradecane.nitrogen.two_p_four_atm.separation.x;
    expt_y = qian.tetradecane.nitrogen.two_p_four_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.nitrogen.two_p_four_atm.separation.error = error;
    error_struct.qian.tetradecane.nitrogen.two_p_four_atm.separation.num   = num;
    
    % Fig 8
    expt_x = qian.water.helium.four_p_four_atm.coalescence.x;
    expt_y = qian.water.helium.four_p_four_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.four_p_four_atm.coalescence.error = error;
    error_struct.qian.water.helium.four_p_four_atm.coalescence.num   = num;
    
    expt_x = qian.water.helium.four_p_four_atm.bounce.x;
    expt_y = qian.water.helium.four_p_four_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.four_p_four_atm.bounce.error = error;
    error_struct.qian.water.helium.four_p_four_atm.bounce.num = num;
    
    expt_x = qian.water.helium.four_p_four_atm.separation.x;
    expt_y = qian.water.helium.four_p_four_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.four_p_four_atm.separation.error = error;
    error_struct.qian.water.helium.four_p_four_atm.separation.num   = num;
    
    expt_x = qian.water.helium.seven_p_five_atm.coalescence.x;
    expt_y = qian.water.helium.seven_p_five_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.seven_p_five_atm.coalescence.error = error;
    error_struct.qian.water.helium.seven_p_five_atm.coalescence.num   = num;
    
    expt_x = qian.water.helium.seven_p_five_atm.bounce.x;
    expt_y = qian.water.helium.seven_p_five_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.seven_p_five_atm.bounce.error = error;
    error_struct.qian.water.helium.seven_p_five_atm.bounce.num = num;
    
    expt_x = qian.water.helium.seven_p_five_atm.separation.x;
    expt_y = qian.water.helium.seven_p_five_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.seven_p_five_atm.separation.error = error;
    error_struct.qian.water.helium.seven_p_five_atm.separation.num   = num;
    
    expt_x = qian.water.helium.eleven_p_seven_atm.coalescence.x;
    expt_y = qian.water.helium.eleven_p_seven_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.eleven_p_seven_atm.coalescence.error = error;
    error_struct.qian.water.helium.eleven_p_seven_atm.coalescence.num   = num;
    
    expt_x = qian.water.helium.eleven_p_seven_atm.bounce.x;
    expt_y = qian.water.helium.eleven_p_seven_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.eleven_p_seven_atm.bounce.error = error;
    error_struct.qian.water.helium.eleven_p_seven_atm.bounce.num = num;
    
    expt_x = qian.water.helium.eleven_p_seven_atm.separation.x;
    expt_y = qian.water.helium.eleven_p_seven_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.water.helium.eleven_p_seven_atm.separation.error = error;
    error_struct.qian.water.helium.eleven_p_seven_atm.separation.num   = num;
    
    % Fig 9
    expt_x = qian.tetradecane.helium.zero_p_seven_atm.coalescence.x;
    expt_y = qian.tetradecane.helium.zero_p_seven_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.zero_p_seven_atm.coalescence.error = error;
    error_struct.qian.tetradecane.helium.zero_p_seven_atm.coalescence.num   = num;
    
    expt_x = qian.tetradecane.helium.zero_p_seven_atm.bounce.x;
    expt_y = qian.tetradecane.helium.zero_p_seven_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.zero_p_seven_atm.bounce.error = error;
    error_struct.qian.tetradecane.helium.zero_p_seven_atm.bounce.num = num;
    
    expt_x = qian.tetradecane.helium.zero_p_seven_atm.separation.x;
    expt_y = qian.tetradecane.helium.zero_p_seven_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.zero_p_seven_atm.separation.error = error;
    error_struct.qian.tetradecane.helium.zero_p_seven_atm.separation.num   = num;
    
    expt_x = qian.tetradecane.helium.two_p_four_atm.coalescence.x;
    expt_y = qian.tetradecane.helium.two_p_four_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.two_p_four_atm.coalescence.error = error;
    error_struct.qian.tetradecane.helium.two_p_four_atm.coalescence.num   = num;
    
    expt_x = qian.tetradecane.helium.two_p_four_atm.bounce.x;
    expt_y = qian.tetradecane.helium.two_p_four_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.two_p_four_atm.bounce.error = error;
    error_struct.qian.tetradecane.helium.two_p_four_atm.bounce.num = num;
    
    expt_x = qian.tetradecane.helium.two_p_four_atm.separation.x;
    expt_y = qian.tetradecane.helium.two_p_four_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.two_p_four_atm.separation.error = error;
    error_struct.qian.tetradecane.helium.two_p_four_atm.separation.num   = num;
    
    expt_x = qian.tetradecane.helium.four_p_four_atm.coalescence.x;
    expt_y = qian.tetradecane.helium.four_p_four_atm.coalescence.y;
    expt_outcome = 2;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.four_p_four_atm.coalescence.error = error;
    error_struct.qian.tetradecane.helium.four_p_four_atm.coalescence.num   = num;
    
    expt_x = qian.tetradecane.helium.four_p_four_atm.bounce.x;
    expt_y = qian.tetradecane.helium.four_p_four_atm.bounce.y;
    expt_outcome = 1;
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.four_p_four_atm.bounce.error = error;
    error_struct.qian.tetradecane.helium.four_p_four_atm.bounce.num = num;
    
    expt_x = qian.tetradecane.helium.four_p_four_atm.separation.x;
    expt_y = qian.tetradecane.helium.four_p_four_atm.separation.y;
    expt_outcome = [3, 4];
    [error, num] = ...
        get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
    error_struct.qian.tetradecane.helium.four_p_four_atm.separation.error = error;
    error_struct.qian.tetradecane.helium.four_p_four_atm.separation.num   = num;
    
    outcome_names = [{'coalescence'},{'bounce'},{'separation'}];
    error_struct.qian.all.all.error = 0;
    error_struct.qian.all.all.num   = 0;
    for i=1:length(outcome_names)
        expt_x = qian.all.(outcome_names{i}).x;
        expt_y = qian.all.(outcome_names{i}).y;
        if i==1
            expt_outcome = 2;
        elseif i==2
            expt_outcome = 1;
        elseif i==3
            expt_outcome = [3, 4];
        end
        [error, num] = ...
            get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome);
        error_struct.qian.all.(outcome_names{i}).error = error;
        error_struct.qian.all.(outcome_names{i}).num   = num;
        
        error_struct.qian.all.all.error = error_struct.qian.all.all.error + error_struct.qian.all.(outcome_names{i}).error;
        error_struct.qian.all.all.num   = error_struct.qian.all.all.num   + error_struct.qian.all.(outcome_names{i}).num;
    end
end

error_struct.all.error = error_struct.estrade.all.error + error_struct.poo.all.error + error_struct.qian.all.all.error;
error_struct.all.num   = error_struct.estrade.all.num   + error_struct.poo.all.num   + error_struct.qian.all.all.num;


check_error_kuschel = 1;
if (check_error_kuschel)
    outcome_names = [{'coalescence'},{'bouncing'},{'stretching'},{'reflexive'}];
    expt_outcome = [2, 1, 3, 4];
    error_struct.kuschel.all.error = 0;
    error_struct.kuschel.all.num   = 0;
    for i = 1:length(outcome_names)
        expt_x = kuschel.all.(outcome_names{i}).x;
        expt_y = kuschel.all.(outcome_names{i}).y;
        [error, num] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome(i));
        error_struct.kuschel.(outcome_names{i}).error = error;
        error_struct.kuschel.(outcome_names{i}).num   = num;
        error_struct.kuschel.all.error = error_struct.kuschel.all.error + error;
        error_struct.kuschel.all.num   = error_struct.kuschel.all.num   + num;
    end
    error_struct.all.error = error_struct.all.error + error_struct.kuschel.all.error;
    error_struct.all.num   = error_struct.all.num   + error_struct.kuschel.all.num;

end
end

