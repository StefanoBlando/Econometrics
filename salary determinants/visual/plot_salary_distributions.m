% plot_salary_distributions.m
function plot_salary_distributions(data, results_path)
    salary = data.RETRIC;
    education = categorical(data.TISTUD);
    geography = categorical(data.REG);

    % Histogram + KDE
    figure;
    histogram(salary,'Normalization','pdf','FaceAlpha',0.5);
    hold on;
    [f,xi] = ksdensity(salary);
    plot(xi,f,'LineWidth',2);
    xlabel('Salary (€)');
    ylabel('Density');
    title('Salary Distribution with KDE');
    grid on;
    legend('Histogram','KDE');
    saveas(gcf, fullfile(results_path, 'salary_distribution.png'));

    % Boxplot by Education
    figure;
    boxplot(salary, education);
    xlabel('Education');
    ylabel('Salary (€)');
    title('Salary by Education Level');
    grid on;
    saveas(gcf, fullfile(results_path, 'boxplot_education.png'));

    % Boxplot by Region
    figure;
    boxplot(salary, geography);
    xlabel('Region');
    ylabel('Salary (€)');
    title('Salary by Region');
    grid on;
    saveas(gcf, fullfile(results_path, 'boxplot_region.png'));
end
