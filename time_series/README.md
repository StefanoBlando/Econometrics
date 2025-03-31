# Time Series Analysis

## Project Overview

This project applies time series analysis techniques to economic and financial data. The analysis is divided into two main parts:
1. EU area GDP growth modeling and forecasting
2. S&P 500 returns volatility modeling and forecasting

## Part 1: GDP Analysis

### Data
- Quarterly EU area 19 GDP data from 1995 Q1 to 2022 Q4
- Additional data for 2023 Q1 for validation

### Methodology
1. **Exploratory Analysis**
   - Time series plotting and visual inspection
   - ACF and PACF analysis
   - Rolling window variance analysis
   - Stationarity testing (ADF test)

2. **Transformations**
   - Logarithmic transformation
   - Linear and quadratic detrending
   - HP filter application
   - First differencing to calculate GDP growth rates

3. **Model Selection**
   - Estimation of various ARIMA models
   - Information criteria comparison (AIC, BIC)
   - Residual analysis

4. **Forecasting**
   - Out-of-sample forecasting
   - Forecast evaluation (RMSFE, MAPE, MAE)
   - Handling of structural breaks

### Key Findings
- The GDP series exhibits non-stationarity in levels
- GDP growth rates are more appropriate for modeling
- AR(1) model performs best for recent data
- Structural breaks (e.g., COVID-19) significantly impact forecasting performance

## Part 2: S&P 500 Volatility Analysis

### Data
- Daily S&P 500 price index from January 2010 to April 2023
- Calculation of daily returns and volatility proxies

### Methodology
1. **Exploratory Analysis**
   - Returns and squared returns analysis
   - ACF and PACF of returns and squared returns
   - QQ plots and normality assessment

2. **Volatility Modeling**
   - Rolling window estimation with various window sizes
   - Exponentially Weighted Moving Average (EWMA) with different decay factors
   - ARCH models of different orders
   - GARCH models with various specifications

3. **Forecasting**
   - 10-step ahead forecasting of volatility
   - Comparison of forecasting performance
   - Assessment of model stability across different periods

### Key Findings
- Volatility clustering is evident in the S&P 500 returns
- EWMA with λ = 0.7 performs well in the sample
- GARCH(1,2) provides the best out-of-sample forecasting
- Model performance depends heavily on the presence of structural breaks

## Implementation Details

### Required MATLAB Toolboxes
- Statistics and Machine Learning Toolbox
- Econometrics Toolbox

### External Functions
- `histvol` - Historical volatility calculation
- `ewma` - Exponentially Weighted Moving Average implementation
- `hpfilter` - Hodrick-Prescott filter
- `getMarketDataViaYahoo` - Data retrieval function

## Usage

1. Ensure all necessary MATLAB toolboxes are installed
2. Place the GDP and S&P 500 data files in the specified directories
3. Update file paths in the script as needed
4. Run the complete script or individual sections marked with `%%`

## Conclusions

- Time series models provide valuable forecasting capabilities but are sensitive to structural breaks
- For GDP, simpler models (AR) performed better for recent data with structural breaks
- For volatility, GARCH models outperformed simpler approaches, particularly in periods without major market disruptions
- Model selection should consider both in-sample fit and out-of-sample forecasting performance
