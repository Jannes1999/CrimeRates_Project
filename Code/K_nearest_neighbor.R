# Specify resampling strategy
cv <- trainControl(
  method = "repeatedcv", 
  number = 10, 
  repeats = 5
)

# Create grid of hyperparameter values
hyper_grid <- expand.grid(k = seq(2, 35, by = 1))

# Tune a knn model using grid search
knn_fit <- train(
  `Crime Rate` ~ ., 
  data = Data1, 
  method = "knn", 
  trControl = cv, 
  tuneGrid = hyper_grid,
  metric = "RMSE"
)
ggplot(knn_fit)
