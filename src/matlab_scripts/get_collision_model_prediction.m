function [outcome] = get_collision_model_prediction(We, B, We_analytical, B_analytical, C1_x, C2_x, C3_y)

[~, we_idx] = min(abs(We - We_analytical));
We_to_use = We_analytical(we_idx);
C3_y_value = C3_y(we_idx);

[~, b_idx] = min(abs(B - B_analytical));
B_to_use = B_analytical(b_idx);
C1_x_value = C1_x(b_idx);
C2_x_value = C2_x(b_idx);


if(We_to_use <= C1_x_value)
    % Bouncing Collision
    outcome = 1;
elseif(0)%Ereflex < Estr)
    if(B_to_use >= C3_y_value)
        %off center separation
        outcome = 4;
    else
        % coalescence
        outcome = 2;
    end
%elseif(C2_x_value < 0)    
elseif(We_to_use <= C2_x_value)
    if(B_to_use >= C3_y_value)
        %off center separation
        outcome = 4;
    else
        % coalescence
        outcome = 2;
    end
else
    % Near Head on separation
    outcome = 3;
end

end

