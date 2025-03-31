# Salary Determinants Analysis

## Project Overview

This project analyzes the determinants of salary in the Italian labor market using data from the Labor Force Survey (LFS). The analysis explores relationships between salary and various demographic, educational, and geographic factors through statistical methods and regression models.

## Methodology

The analysis employs several statistical and econometric approaches:

1. **Descriptive Statistics**
   - Basic statistics for salary (mean, median, standard deviation, min, max, percentiles)
   - Salary distributions by education level and geographic region
   - Frequency distributions of key variables

2. **Statistical Tests**
   - Tests for distribution normality (Lilliefors test)
   - ANOVA to test for statistically significant differences between groups
   - T-tests comparing salary means between education level groups

3. **Correlation Analysis**
   - Correlation between salary and education level
   - Correlation between salary and geographic region
   - Correlation matrix for key quantitative variables

4. **Regression Models**
   - Bivariate regression model (salary ~ age)
   - Trivariate regression model (salary ~ age + education)
   - Multivariate regression model including several predictors

## Key Variables

- **RETRIC**: Net salary
- **TISTUD**: Education level
- **REG**: Geographic region
- **ETAM**: Age
- **SG11**: Gender
- **ORELAV**: Working hours

## Findings

The analysis reveals several important findings:

1. There are statistically significant differences in salary based on education level
2. Geographic location significantly impacts salary levels
3. Age has a positive correlation with salary
4. Education level is one of the strongest predictors of salary
5. The relationship between education and salary remains significant even when controlling for other factors

## Visualizations

The project includes multiple visualizations:
- Histograms and density plots of salary distribution
- Bar charts comparing salary means by region and education
- Box plots showing salary distribution by region and education level
- Visualizations of residuals from regression models

## Requirements

To run this analysis, you'll need:
- MATLAB (with Statistics and Machine Learning Toolbox)
- Labor Force Survey dataset in CSV format

## Usage

1. Place the LFS dataset CSV file in your working directory
2. Modify the file path in the code as needed
3. Run the MATLAB script to execute the full analysis
4. Individual sections can be run separately using the section markers (`%%`)

## References

- [Italian National Institute of Statistics (ISTAT)](https://www.istat.it/)
- Labor Force Survey methodology documentation
