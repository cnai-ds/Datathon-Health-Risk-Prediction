# Heath Risk Prediction for SCOR Datathon
This repository is for SCOR Datathon held from November 2019 to February 2020 in Paris.\
[SCOR](https://www.scor.com/en) is a tier 1 reinsurance company in the world. During this 4 months, we processed real open data, [NHANES](https://www.cdc.gov/nchs/nhanes/index.htm) and [NHCS](https://www.cdc.gov/nchs/nhcs/data_uses.htm), and built models to predict health risks of a person in U.S. \
\

## Our business problem identification
We have identified 2 biggest business problems for insurance and re-insurance companies; frauds and increase cost from chronic diseases. <br>
With the growth of middle class and urbanisation, sedentary lifestyle is becoming more common across the world. This leads to an [accerelation of costly chronic diseases](https://www.pwc.com/gx/en/industries/healthcare/emerging-trends-pwc-healthcare/chronic-diseases.html). <br>
Health care payers are seeking for solutions to decrease their premium cost not only by predicting one's health risks to set correct premium, but also by improving one's health; the longer the people without health problems, the cheaper the health cost that the payers pays. <br><br>

## Our solutions
We have created a flask application to predict one's diabetes risk, level of glycohemoglobin and cholesterol, and **suggest how one can decrease the risk to specific level**.
For example, we can say, to decrease the risk to 50% to 20% , we can suggest the person to walk 10 minutes more or sleep 1 hour longer per day.

## Main Models for our application
- Gradient Boost Regression to predict Glycohemoglobin and Cholesterol level of a person
- Xgboost Classification to predict mortality
- Cox.PH to identify hazard ratio
- Kaplan Meier to visualize survival curve for each indicators
- Random Survival Forest to identify the probability change considering given age and other parameter change.
- XGboost Regression to predict age of the person
