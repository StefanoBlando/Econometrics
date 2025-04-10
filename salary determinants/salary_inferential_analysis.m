% salary_inferential_analysis.m
function salary_inferential_analysis(data, results_path)
    salary = data.RETRIC;
    education = data.TISTUD;

    % Normality Tests
    [h_l, p_l] = lillietest(salary);
    [h_jb, p_jb] = jbtest(salary);
    fprintf('Normality Lilliefors p-value: %.4f\n',p_l);
    fprintf('Normality Jarque-Bera p-value: %.4f\n',p_jb);

    % T-test (Degree vs Non-degree holders)
    deg_group = ismember(education,[7 8 9 10]);
    [h_t, p_t] = ttest2(salary(deg_group),salary(~deg_group));
    if h_t
        disp('Significant salary difference (Degree vs Non-degree).');
    else
        disp('No significant salary difference.');
    end

    % ANOVA by Education
    figure;
    [~,~,stats] = anova1(salary, categorical(education), 'off');
    multcompare(stats);
    title('ANOVA Multiple Comparison: Salary by Education');
    saveas(gcf, fullfile(results_path,'anova_education.png'));
end
