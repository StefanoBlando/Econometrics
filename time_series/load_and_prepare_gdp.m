function [growth, date_growth] = load_and_prepare_gdp(filepath)
    % Load and preprocess GDP data
    gdpData = readtable(filepath);
    date = datetime(gdpData.date);
    gdp = gdpData.value;

    % Calculate GDP growth rates
    growth = diff(log(gdp));
    date_growth = date(2:end);
end
