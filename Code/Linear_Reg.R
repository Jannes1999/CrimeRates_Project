model2 <- lm(Crime_Rate ~ . , data = train_2)

library(knitr)
suppressMessages({library(stargazer)})

# Obtain the regression summary
summary_table2 <- summary(model2)

model3 <- lm(Crime_Rate ~ HDI + Gini_Coefficient, data = train_2 )

summary_table3 <- summary(model3)

model4 <- lm(log(Crime_Rate) ~ . , data = train_2)
summary_table4 <- summary(model4)

stargazer(model2,model3,model4, type = 'text')

model6 <- lm(Crime_Rate ~ Unemployment_percentage +HDI+ Population_Density_per_sq_km + Weapons_per_100_persons+ Per_Capita_Income + Gini_Coefficient+           Literacy_Rate  + Happiness_Index+ I( Population_Density_per_sq_km^2)+ I(Gini_Coefficient^2)+ I(Literacy_Rate^2) , data = train_2)
summary_table6 <- summary(model6)


model7 <- lm(log(Crime_Rate) ~ Unemployment_percentage +HDI+ Population_Density_per_sq_km + Weapons_per_100_persons+ Per_Capita_Income + Gini_Coefficient+           Literacy_Rate  + Happiness_Index+ I( Population_Density_per_sq_km^2)+ I(Gini_Coefficient^2)+ I(Literacy_Rate^2) , data = train_2)
summary_table7 <- summary(model7)


suppressMessages({stargazer(model6,model7, type = "text" ,title = "Crime rate lm models with nonlinearities")})