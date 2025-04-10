% main_salary_analysis.m
% Author: Stefano Blando

clear; close all; clc;

%% Paths
data_path = '../data/lfs-2023-02-22-12-54-15.csv';
results_path = '../results/';

%% Load and clean data
data = load_salary_data(data_path);
data = clean_salary_data(data);

%% Descriptive statistics
descriptive_statistics(data, results_path);

%% Visualizations
plot_salary_distributions(data, results_path);

%% Inferential statistical analysis
salary_inferential_analysis(data, results_path);

%% Regression analysis
salary_regression_analysis(data, results_path);
