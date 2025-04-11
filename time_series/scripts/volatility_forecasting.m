function summary_vol = volatility_forecasting(r_train, r_test, r2_test)
    %% ARCH(1-10) models
    arch_rmse = zeros(10,1);
    for q = 1:10
        try
            mdl = garch(0,q);
            est = estimate(mdl, r_train,'Display','off');
            [~,var_forecast] = forecast(est,10,'Y0',r_train);
            arch_rmse(q) = sqrt(mean((r2_test - var_forecast).^2));
        catch
            arch_rmse(q) = NaN;
        end
    end

    %% GARCH models (combinations: [1,1], [2,1], [1,2], [2,2])
    configs = [1 1; 2 1; 1 2; 2 2];
    garch_rmse = zeros(size(configs,1),1);
    for i = 1:size(configs,1)
        try
            mdl = garch(configs(i,1),configs(i,2));
            est = estimate(mdl,r_train,'Display','off');
            [~,var_forecast] = forecast(est,10,'Y0',r_train);
            garch_rmse(i) = sqrt(mean((r2_test - var_forecast).^2));
        catch
            garch_rmse(i) = NaN;
        end
    end

    % Results Table
    arch_names = arrayfun(@(q) sprintf('ARCH(%d)',q),1:10,'UniformOutput',false)';
    garch_names = {'GARCH(1,1)';'GARCH(2,1)';'GARCH(1,2)';'GARCH(2,2)'};
    model_names = [arch_names; garch_names];
    rmse_all = [arch_rmse; garch_rmse];

    summary_vol = table(model_names, rmse_all,'VariableNames',{'Model','RMSFE'});
end
