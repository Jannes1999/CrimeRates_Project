library(rpart)
library(rpart.plot)

Data1_tree <- rpart(
  formula = train_2$`Crime Rate` ~ .,
  data    = train_2,
  method  = "anova"
)

rpart.plot(Data1_tree)
plotcp(Data1_tree)

# caret cross validation results
Data1_CV_tree <- train(
  train_2$`Crime Rate` ~ .,
  data = train_2,
  method = "rpart",
  trControl = trainControl(method = "cv", number = 10),
  tuneLength = 8
)

ggplot(Data1_CV_tree)
