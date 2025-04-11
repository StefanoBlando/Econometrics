function [r_train, r_test, r2_test] = load_and_prepare_sp500()
    sp500 = readtable('../data/sp500.csv');
    sp500 = rmmissing(sp500); % remove NaNs
    prices = sp500.AdjClose;
    returns = diff(log(prices));
    returns = returns(~isnan(returns));
    
    r2 = (returns - mean(returns)).^2;
    r_train = returns(1:end-10);
    r_test = returns(end-9:end);
    r2_test = r2(end-9:end);
end
