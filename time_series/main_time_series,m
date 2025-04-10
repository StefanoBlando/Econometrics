% Main Script for Time Series Analysis
% Author: Stefano Blando
% Course: MQE

clear; clc; close all;

%% GDP Data Analysis
[growth, date_growth] = load_and_prepare_gdp('../data/GDP_EUarea19.csv');
[results_arima, summary_arima] = arima_model_selection(growth);

disp('ARIMA Model Selection Summary:');
disp(summary_arima);

%% S&P500 Volatility Analysis
[r_train, r_test, r2_test] = load_and_prepare_sp500('../data/sp500_data.mat');
summary_vol = volatility_forecasting(r_train, r_test, r2_test);

disp('Volatility Forecasting RMSFE Summary:');
disp(summary_vol);
