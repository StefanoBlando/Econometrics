% descriptive_statistics.m
function descriptive_statistics(data, results_path)
    salary = data.RETRIC;

    stats.mean = mean(salary, 'omitnan');
    stats.median = median(salary, 'omitnan');
    stats.std = std(salary, 'omitnan');
    stats.quantiles = quantile(salary,[0.05,0.25,0.5,0.75,0.95]);

    disp('Overall Salary Statistics:');
    disp(stats);

    % Stats by Education
    stats_edu = grpstats(data, 'TISTUD', {'mean','median','std','min','max'},'DataVars','RETRIC');
    writetable(stats_edu, fullfile(results_path,'salary_by_education.xlsx'));

    % Stats by Region
    stats_geo = grpstats(data, 'REG', {'mean','median','std','min','max'},'DataVars','RETRIC');
    writetable(stats_geo, fullfile(results_path,'salary_by_region.xlsx'));
end
