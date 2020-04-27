# Heath Risk Prediction for SCOR Datathon
This repository is for SCOR Datathon held from November 2019 to February 2020 in Paris.\
[SCOR](https://www.scor.com/en) is a tier 1 reinsurance company in the world. During this 4 months, we processed real open data, [NHANES](https://www.cdc.gov/nchs/nhanes/index.htm) and [NHCS](https://www.cdc.gov/nchs/nhcs/data_uses.htm), and built models to predict health risks of a person in U.S. \
\
Main Works and Models
- Gradient Boost Regression to predict Glycohemoglobin and Cholesterol level of a person
- Xgboost Classification to predict mortality
- Cox.PH to identify hazard ratio
- Kaplan Meier to see survival curve
- Random Survival Forest to identify the probability change considering given age and other parameter change.
- Neural Network (linear stack of Layers) to predict age
