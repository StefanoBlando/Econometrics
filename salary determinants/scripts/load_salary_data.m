% load_salary_data.m
function data = load_salary_data(filepath)
    opts = detectImportOptions(filepath);
    opts = setvaropts(opts, opts.VariableNames, 'EmptyFieldRule', 'auto');
    data = readtable(filepath, opts);
end
