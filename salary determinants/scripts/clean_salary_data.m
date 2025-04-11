% clean_salary_data.m
function cleaned_data = clean_salary_data(data)
    salary = data.RETRIC;

    % Remove invalid salaries
    valid_idx = salary > 0 & ~isnan(salary);
    cleaned_data = data(valid_idx, :);
end
