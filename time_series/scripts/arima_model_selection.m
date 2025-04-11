function [results_arima, summary_arima] = arima_model_selection(growth)
    % Split training and test data
    y_train = growth(1:end-4);
    y_test = growth(end-3:end);

    % Grid Search ARIMA(p,0,q)
    idx = 1; models = {}; logL = []; numParams = []; desc = {};
    for p = 0:4
        for q = 0:4
            if p == 0 && q == 0, continue; end
            try
                mdl = arima(p,0,q);
                [est,~,LL] = estimate(mdl, y_train, 'Display','off');
                models{idx} = est;
                logL(idx) = LL;
                s = summarize(est);
                numParams(idx) = s.NumEstimatedParameters;
                desc{idx} = sprintf('ARIMA(%d,0,%d)', p,q);
                idx = idx + 1;
            catch
                continue;
            end
        end
    end

    [aic, bic] = aicbic(logL', numParams', length(y_train));
    results_arima = table(desc', logL', aic, bic, numParams', ...
        'VariableNames', {'Model','LogL','AIC','BIC','NumParams'});

    % Select best models based on AIC and BIC
    [~, id_aic] = min(aic);
    [~, id_bic] = min(bic);

    best_aic_model = models{id_aic};
    best_bic_model = models{id_bic};

    % Forecast and RMSFE calculation
    yhat_aic = forecast(best_aic_model,4,'Y0',y_train);
    rmsfe_aic = sqrt(mean((y_test - yhat_aic).^2));

    yhat_bic = forecast(best_bic_model,4,'Y0',y_train);
    rmsfe_bic = sqrt(mean((y_test - yhat_bic).^2));

    summary_arima = table({desc{id_aic}; desc{id_bic}}, {'AIC'; 'BIC'}, [rmsfe_aic; rmsfe_bic], ...
        'VariableNames',{'Model','Criterion','RMSFE'});
end
