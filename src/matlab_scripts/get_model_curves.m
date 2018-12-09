function [C1_x, C2_x, C3_y] = get_model_curves(We_D_analytical, B_analytical, delta)

We_DLims = max(We_D_analytical);
gamma = 1/delta;

%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(B_analytical)
    tau = (1 - B_analytical(i))*(1 + delta);
    if B_analytical(i) < 0.5
        chi = 1 - 0.25*(2 - tau)^2*(1 + tau);
    else
        chi = 0.25*tau^2*(3 - tau);
    end
    C1_x(i) = (delta*(1+delta^2)*(4*3.351 - 12))/(chi*(cos(asin(B_analytical(i))))^2);
    
    e_coal = min(1, (2.4*(gamma^3 - 2.4*gamma^2 + 2.7*gamma))/(We_D_analytical(i)));
    C3_y(i) = 1*sqrt(e_coal);
    
    zeta = 0.5*B_analytical(i)*(1+delta);
    eta_1 = 2*(1-zeta)^2*(1-zeta^2)^0.5 - 1;
    eta_2 = 2*(delta - zeta)^2*(delta^2 - zeta^2)^0.5 - delta^3;
    C2_x(i) = (3*(7*(1+delta^3)^(2/3) - 4*(1+delta^2))*delta*(1+delta^3)^2) / (delta^6*eta_1 + eta_2);
    %this is a stopgap solution for unphysical solutions
    if C2_x(i)<0
        C2_x(i) = 2.2*max(We_DLims);
    end
end

get_estrade_curves = false;
if get_estrade_curves
    [estrade, ~, ~, ~, ~] = get_experimental_csv_data();

    if delta == 1
        delta_string = 'delta1';
    elseif delta == 0.5
        delta_string = 'delta0p5';
    elseif delta == 0.75
        delta_string = 'delta0p5';
        %delta_string = 'delta1';
    end

    [y, index] = unique(estrade.(delta_string).C1.y);
    x = estrade.(delta_string).C1.x(index);
    estrade_C1_x = interp1(y, x, B_analytical);
    nan_indices = find(isnan(estrade_C1_x));
    nan_indices_start = find(nan_indices < 0.5*length(B_analytical));
    nan_indices_start = nan_indices(nan_indices_start);
    nan_indices_end   = find(nan_indices > 0.5*length(B_analytical));
    nan_indices_end   = nan_indices(nan_indices_end);
    estrade_C1_x(nan_indices_start) = 0;%min(estrade_C1_x);
    estrade_C1_x(nan_indices_end)   = We_DLims*1.1;%max(estrade_C1_x);

    [y, index] = unique(estrade.(delta_string).C2.y);
    x = estrade.(delta_string).C2.x(index);
    estrade_C2_x = interp1(y, x, B_analytical);
    nan_indices = find(isnan(estrade_C2_x));
    nan_indices_start = find(nan_indices < 0.5*length(B_analytical));
    nan_indices_start = nan_indices(nan_indices_start);
    nan_indices_end   = find(nan_indices > 0.1*length(B_analytical));
    nan_indices_end   = nan_indices(nan_indices_end);
    estrade_C2_x(nan_indices_start) = linspace(0, min(estrade_C2_x), length(nan_indices_start));
    estrade_C2_x(nan_indices_end)   = We_DLims*1.1;

    [x, index] = unique(estrade.(delta_string).C3.x);
    y = estrade.(delta_string).C3.y(index);
    estrade_C3_y = interp1(x, y, We_D_analytical);
    nan_indices = find(isnan(estrade_C3_y));
    nan_indices_start = find(nan_indices < 0.5*length(We_D_analytical));
    nan_indices_start = nan_indices(nan_indices_start);
    nan_indices_end   = find(nan_indices > 0.1*length(We_D_analytical));
    nan_indices_end   = nan_indices(nan_indices_end);
    estrade_C3_y(nan_indices_start) = 1.1;%linspace(0, min(estrade_C3_y), length(nan_indices_start));
    estrade_C3_y(nan_indices_end)   = min(estrade_C3_y);

    C1_x = estrade_C1_x;
    C2_x = estrade_C2_x;
    C3_y = estrade_C3_y;
end
end

