% salary_regression_analysis.m
function salary_regression_analysis(data, results_path)
    salary = data.RETRIC;
    age = data.ETAM;
    duration = data.DURATT;

    edu_dummy = ismember(data.TISTUD,[7 8 9 10]);
    gender_dummy = data.SG11 == 1;
    contract_dummy = data.DETIND == 2;
    time_dummy = data.PIEPAR == 1;
    citizen_dummy = data.CITTAD == 1;

    % Simple regression: Salary ~ Age
    lm1 = fitlm(age, salary);
    figure; plot(lm1); title('Regression: Salary ~ Age');
    saveas(gcf,fullfile(results_path,'regression_salary_age.png'));

    % Multivariate regression
    X_multi = [age, duration, edu_dummy, gender_dummy, contract_dummy, time_dummy, citizen_dummy];
    lm_multi = fitlm(X_multi, salary, 'VarNames',{'Age','Duration','Edu','Gender','Contract','PartTime','Citizen','Salary'});
    figure; plotResiduals(lm_multi,'probability');
    title('Multivariate Regression Residuals');
    saveas(gcf,fullfile(results_path,'multivariate_regression_residuals.png'));

    % Robust regression
    lm_robust = fitlm(X_multi, salary, 'RobustOpts','on');
    disp('Robust Regression Results:');
    disp(lm_robust);
end
