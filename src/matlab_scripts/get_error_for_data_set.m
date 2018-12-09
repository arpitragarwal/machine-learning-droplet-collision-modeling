function [ error, total_count ] = get_error_for_data_set(We_D_analytical, B_analytical, delta, expt_x, expt_y, expt_outcome)
[C1_x, C2_x, C3_y] = get_model_curves(We_D_analytical, B_analytical, delta);

model_outcome = zeros(length(expt_x), 1);
err           = model_outcome;
total_count = length(expt_x);
for i=1:length(expt_x)
    We = expt_x(i);
    B  = expt_y(i);
    model_outcome(i) = get_collision_model_prediction(We, B, We_D_analytical, B_analytical, C1_x, C2_x, C3_y);
    if (length(expt_outcome)==1)
        err(i) = expt_outcome~=model_outcome(i);
    else
        err(i) = (expt_outcome(1)~=model_outcome(i)) & (expt_outcome(2)~=model_outcome(i));
    end
end
error = sum(err);

plot_data = 0;
if plot_data
    figure()
    hold on
    an_1 = plot(C1_x, B_analytical, 'b', 'LineWidth', 2);
    an_2 = plot(We_D_analytical, C3_y, 'b', 'LineWidth', 2);
    an_3 = plot(C2_x, B_analytical, 'b', 'LineWidth', 2);
    scatter(expt_x, expt_y)
    We_DLims = max(We_D_analytical);
    xlim([0 We_DLims])
    ylim([0 1])
end

end

